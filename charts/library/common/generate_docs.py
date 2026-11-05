#!/usr/bin/env python3
"""Generate the markdown docs of the common library from its JSON schemas.

The pages are built from the values tree: values.schema.source.json is walked
from the root, every $ref is followed and every key gets its real path
(``workload.$name.podSpec.hostNetwork``, ``hostAliases[].ip``).
Which pages exist, and which part of the tree each page documents, is listed in
docs-pages.yaml. Run with --check to verify that docs/ is up to date.
"""

import argparse
import copy
import json
import re
import shutil
import subprocess
import sys
import tempfile
import unicodedata
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any

import yaml

MISSING = object()
SCRIPT_DIR = Path(__file__).resolve().parent
TPL_PATTERN_MARKER = "{{"
MAX_DEPTH = 14
MAX_APPEARS_IN = 8
LONG_DEFAULT = 100
LINK_RE = re.compile(r"(?<!!)\[[^\]]*\]\(([^)\s]+)\)")
HEADING_RE = re.compile(r"^(#{1,6})\s+(.*?)\s*#*\s*$")


# --------------------------------------------------------------------------
# Schema loading and normalising
# --------------------------------------------------------------------------


@dataclass
class Node:
    """A schema node with $ref, allOf, oneOf and anyOf merged into one view."""

    description: str = ""
    default: Any = MISSING
    types: list[str] = field(default_factory=list)
    enum: list[Any] = field(default_factory=list)
    pattern: str | None = None
    minimum: Any = None
    maximum: Any = None
    min_length: Any = None
    max_length: Any = None
    min_items: Any = None
    max_items: Any = None
    examples: list[Any] = field(default_factory=list)
    required: set[str] = field(default_factory=set)
    props: dict[str, list[tuple[Any, str]]] = field(default_factory=dict)
    items: tuple[Any, str] | None = None
    addl: tuple[Any, str] | None = None
    closed: bool = False
    tpl: bool = False
    helm_tpl: Any = None
    docs_required: bool | None = None
    applies: list[str] = field(default_factory=list)
    identity: str | None = None
    root_values: bool = False


class Schemas:
    def __init__(self, root_file: Path):
        self.root_file = root_file.resolve()
        self.base = self.root_file.parent
        self._files: dict[Path, Any] = {}
        # The raw object is kept next to the node so its id() can not be reused.
        self._cache: dict[tuple[int, Path], tuple[Any, Node]] = {}
        self._multi: dict[tuple, tuple[Any, Node]] = {}

    def load(self, path: Path) -> Any:
        path = path.resolve()
        if path not in self._files:
            self._files[path] = json.loads(path.read_text())
        return self._files[path]

    def root(self) -> tuple[Any, Path]:
        return self.load(self.root_file), self.root_file

    def ident(self, path: Path, fragment: str) -> str:
        try:
            rel = path.relative_to(self.base).as_posix()
        except ValueError:
            rel = path.as_posix()
        return f"{rel}#{fragment}" if fragment else rel

    def follow(self, ref: str, file: Path) -> tuple[Any, Path, str]:
        target, _, fragment = ref.partition("#")
        path = (file.parent / target).resolve() if target else file
        doc = self.load(path)
        node = doc
        for part in [p for p in fragment.split("/") if p]:
            part = part.replace("~1", "/").replace("~0", "~")
            node = node[int(part)] if isinstance(node, list) else node[part]
        return node, path, self.ident(path, fragment)

    def node(self, raw: Any, file: Path) -> Node:
        key = (id(raw), file)
        if key not in self._cache:
            n = Node()
            self._absorb(n, raw, file, "base")
            self._cache[key] = (raw, n)
        return self._cache[key][1]

    def node_multi(self, sources: list[tuple[Any, str]]) -> Node:
        """A node built from several definitions of the same key; the first one wins."""
        if len(sources) == 1:
            return self.node(*sources[0])
        key = tuple((id(r), f) for r, f in sources)
        if key not in self._multi:
            n = Node()
            for raw, file in sources:
                self._absorb(n, raw, file, "base")
            self._multi[key] = (sources, n)
        return self._multi[key][1]

    def _absorb(self, n: Node, raw: Any, file: Path, mode: str) -> None:
        """Merge raw into n; the first value found for a keyword wins."""
        if not isinstance(raw, dict):
            return
        # Keywords next to the $ref win over the referenced schema.
        self._own(n, raw, file, mode)
        # Later allOf entries are overrides of earlier ones, so they are read first.
        for sub in reversed(raw.get("allOf", [])):
            self._absorb(n, sub, file, "all" if mode == "base" else mode)
        if "$ref" in raw:
            target, tfile, ident = self.follow(raw["$ref"], file)
            if tfile == self.root_file and ident == self.ident(tfile, ""):
                # The whole values tree again: documented as a link, not repeated.
                n.root_values = True
            else:
                if n.identity is None and mode in ("base", "all"):
                    n.identity = ident
                self._absorb(n, target, tfile, mode)
        for key in ("oneOf", "anyOf"):
            for branch in raw.get(key, []):
                if self._is_tpl_branch(branch):
                    n.tpl = True
                else:
                    self._absorb(n, branch, file, "alt")

    @staticmethod
    def _is_tpl_branch(branch: Any) -> bool:
        return (
            isinstance(branch, dict)
            and branch.get("type") == "string"
            and TPL_PATTERN_MARKER in str(branch.get("pattern", ""))
            and "enum" not in branch
        )

    def _own(self, n: Node, raw: dict, file: Path, mode: str) -> None:
        if not n.description and raw.get("description"):
            n.description = raw["description"].strip()
        if n.default is MISSING and "default" in raw:
            n.default = raw["default"]
        types = raw.get("type")
        if isinstance(types, str):
            types = [types]
        if isinstance(types, list):
            if mode != "alt" and raw.get("x-helm-tpl") and "string" in types and len(
                [t for t in types if t not in ("string", "null")]
            ) >= 1:
                # [T, "string"] with x-helm-tpl: the string form is a template.
                n.tpl = True
                types = [t for t in types if t != "string"]
            for t in types:
                if t not in n.types:
                    n.types.append(t)
        for v in raw.get("enum", []):
            if v not in n.enum:
                n.enum.append(v)
        if "const" in raw and raw["const"] not in n.enum:
            n.enum.append(raw["const"])
        if n.pattern is None and raw.get("pattern") and TPL_PATTERN_MARKER not in raw["pattern"]:
            n.pattern = raw["pattern"]
        for attr, kw in (
            ("minimum", "minimum"),
            ("maximum", "maximum"),
            ("min_length", "minLength"),
            ("max_length", "maxLength"),
            ("min_items", "minItems"),
            ("max_items", "maxItems"),
        ):
            if getattr(n, attr) is None and kw in raw:
                setattr(n, attr, raw[kw])
        for ex in raw.get("examples", []):
            n.examples.append(ex)
        if mode != "alt":
            n.required.update(raw.get("required", []))
        for k, v in (raw.get("properties") or {}).items():
            if v is False:
                continue
            n.props.setdefault(k, []).append((v, file))
        if n.items is None and isinstance(raw.get("items"), dict):
            n.items = (raw["items"], file)
        ap = raw.get("additionalProperties")
        if isinstance(ap, dict) and n.addl is None:
            n.addl = (ap, file)
        elif ap is False and mode != "alt":
            n.closed = True
        if n.helm_tpl is None and raw.get("x-helm-tpl") is not None:
            n.helm_tpl = raw["x-helm-tpl"]
        if n.docs_required is None and "x-docs-required" in raw:
            n.docs_required = bool(raw["x-docs-required"])
        for a in raw.get("x-docs-appliesTo", []):
            if a not in n.applies:
                n.applies.append(a)

    def children(self, n: Node):
        """Yield (key, Node) for the documented children of n."""
        for k, sources in n.props.items():
            yield k, self.node_multi(sources)
        if n.addl is not None:
            yield "$name", self.node(*n.addl)
        if n.items is not None:
            item = self.node(*n.items)
            if item.props or item.addl or "object" in item.types or "array" in item.types:
                yield "[]", item


def join(path: str, key: str) -> str:
    if key == "[]":
        return path + "[]"
    return f"{path}.{key}" if path else key


# --------------------------------------------------------------------------
# Page configuration
# --------------------------------------------------------------------------


@dataclass
class Page:
    file: str
    title: str
    roots: list[dict]
    intro: str = ""
    parent: str | None = None
    applies: str | None = None
    compact_links: bool = False
    overview_only: bool = False
    handwritten: bool = False
    description: str = ""
    collapse: dict[str, str] = field(default_factory=dict)

    @property
    def url_path(self) -> str:
        p = self.file[:-3]
        if p.endswith("/index"):
            p = p[: -len("/index")]
        return "" if p == "index" else p


def load_pages(path: Path) -> tuple[list[Page], list[str]]:
    data = yaml.safe_load(path.read_text())
    pages = []
    for entry in data["pages"]:
        roots = entry.get("roots")
        if roots is None:
            roots = [{"path": entry.get("path", "")}] if "ref" not in entry else [{"ref": entry["ref"]}]
            for extra in entry.get("include", []):
                roots.append(extra if isinstance(extra, dict) else {"path": extra})
        pages.append(
            Page(
                file=entry["file"],
                title=entry.get("title") or Path(entry["file"]).stem,
                roots=roots,
                intro=(entry.get("intro") or "").strip(),
                parent=entry.get("parent"),
                applies=entry.get("applies"),
                compact_links=bool(entry.get("compact_links")),
                overview_only=bool(entry.get("overview_only")),
                handwritten=bool(entry.get("handwritten")),
                description=entry.get("description", ""),
                collapse=entry.get("collapse") or {},
            )
        )
    return pages, list(data.get("removed", []))


# --------------------------------------------------------------------------
# Rendering helpers
# --------------------------------------------------------------------------


def display_width(text: str) -> int:
    return sum(2 if unicodedata.east_asian_width(c) in "WF" else 1 for c in text)


def slug(text: str) -> str:
    text = text.strip().lower()
    out = []
    for c in text:
        if c.isalnum() or c in "_-":
            out.append(c)
        elif c == " ":
            out.append("-")
    return "".join(out)


def esc_cell(text: str) -> str:
    return text.replace("|", "\\|").replace("\n", " ")


def md_table(rows: list[tuple[str, str]]) -> str:
    lines = ["| Field | Value |", "| --- | --- |"]
    for k, v in rows:
        lines.append(f"| {esc_cell(k)} | {esc_cell(v)} |")
    return "\n".join(lines)


class _Dumper(yaml.SafeDumper):
    def increase_indent(self, flow=False, indentless=False):  # noqa: D401
        return super().increase_indent(flow, False)


def to_yaml(value: Any) -> str:
    return yaml.dump(
        value, Dumper=_Dumper, sort_keys=False, default_flow_style=False, allow_unicode=True
    ).rstrip("\n")


def type_name(t: str) -> str:
    return {"object": "map", "boolean": "bool", "integer": "int", "array": "list"}.get(t, t)


def nest(path: str, value: Any, example_name: str = "example") -> Any:
    """Build {a: {b: value}} for a values path, $name becomes a sample name."""
    segs = re.findall(r"\[\]|[^.\[\]]+", path)
    out = value
    for seg in reversed(segs):
        if seg == "[]":
            out = [out]
        else:
            out = {example_name if seg == "$name" else seg: out}
    return out


# --------------------------------------------------------------------------
# Generator
# --------------------------------------------------------------------------


@dataclass
class Entry:
    path: str
    rel: str
    node: Node
    required: bool
    link: Page | None = None
    recursive: bool = False


class Generator:
    def __init__(self, schema_file: Path, pages_file: Path, base_url: str):
        self.schemas = Schemas(schema_file)
        self.pages, self.removed = load_pages(pages_file)
        self.base_url = base_url.rstrip("/")
        self.errors: list[str] = []
        self.root_node = self.schemas.node(*self.schemas.root())
        self._index_occurrences()
        self._index_roots()

    # ---- indexes ---------------------------------------------------------

    def _index_occurrences(self) -> None:
        self.occurrences: dict[str, list[str]] = {}
        seen_paths: set[str] = set()

        def walk(n: Node, path: str, stack: tuple, depth: int) -> None:
            if depth > MAX_DEPTH:
                return
            if n.identity:
                paths = self.occurrences.setdefault(n.identity, [])
                if path not in paths:
                    paths.append(path)
                if n.identity in stack:
                    return
                stack = stack + (n.identity,)
            for k, c in self.schemas.children(n):
                walk(c, join(path, k), stack, depth + 1)

        walk(self.root_node, "", (), 0)
        self.all_paths = seen_paths

    def _resolve_root(self, root: dict) -> tuple[Node | None, str, str | None]:
        """Return (node, key label, identity) for a page root."""
        if "ref" in root:
            ref = root["ref"]
            n = self.schemas.node({"$ref": ref}, self.schemas.base / "_root.json")
            where = self.appears_in(n.identity, [])
            label = root.get("key") or (where[0] if where else Path(ref.split("#")[0]).stem)
            return n, label, n.identity
        path = root.get("path", "")
        n = self.root_node
        for seg in re.findall(r"\[\]|[^.\[\]]+", path):
            nxt = None
            for k, c in self.schemas.children(n):
                if k == seg:
                    nxt = c
                    break
            if nxt is None:
                return None, path, None
            n = nxt
        return n, path, n.identity

    def _index_roots(self) -> None:
        self.root_by_path: dict[str, Page] = {}
        self.root_by_ident: dict[str, Page] = {}
        self.resolved: dict[tuple[str, int], tuple[Node, str, str | None]] = {}
        for page in self.pages:
            for i, root in enumerate(page.roots):
                n, label, ident = self._resolve_root(root)
                if n is None:
                    self.errors.append(f"{page.file}: path '{label}' does not exist in the schema")
                    continue
                self.resolved[(page.file, i)] = (n, label, ident)
                if "ref" in root:
                    self.root_by_ident.setdefault(ident, page)
                elif page.applies is None:
                    self.root_by_path.setdefault(root.get("path", ""), page)
                    if root.get("link", True) and ident and page.applies is None and i == 0 and not page.overview_only:
                        self.root_by_ident.setdefault(ident, page)

    # ---- urls -----------------------------------------------------------

    def url(self, page: Page, anchor: str = "") -> str:
        u = f"{self.base_url}/{page.url_path}".rstrip("/")
        u = u or self.base_url
        return f"{u}#{anchor}" if anchor else u

    # ---- entries --------------------------------------------------------

    def entries(self, page: Page, root_idx: int):
        n, label, ident = self.resolved[(page.file, root_idx)]
        root = page.roots[root_idx]
        is_ref = "ref" in root
        base_path = label
        depth_limit = root.get("depth")

        def rel_of(path: str) -> str:
            if len(page.roots) > 1:
                return path  # several roots on one page: full paths keep the headings unique
            if path == base_path:
                return re.split(r"\.", path)[-1]
            if path.startswith(base_path + ".") or path.startswith(base_path + "["):
                rest = path[len(base_path):]
                return rest[1:] if rest.startswith(".") else rest
            return path

        out: list[Entry] = []

        def walk(node, path, parent, key, stack, depth, top, typed_ok=False):
            if depth > MAX_DEPTH:
                return
            emit = not top or (page.applies is None and not page.overview_only)
            child_typed = typed_ok
            if not top:
                if page.applies is None:
                    # Typed keys are documented on the page of their type.
                    if node.applies:
                        return
                else:
                    if node.applies and page.applies not in node.applies:
                        return
                    child_typed = typed_ok or page.applies in node.applies
                    emit = child_typed
            if emit:
                entry = Entry(
                    path=path,
                    rel=rel_of(path),
                    node=node,
                    required=node.docs_required is True
                    or (node.docs_required is None and bool(parent and key in parent.required)),
                )
                other = None if top else self._other_page(page, path, node, root_idx)
                target = None if top else page.collapse.get(entry.rel)
                if target:
                    other = next(p for p in self.pages if p.file == target)
                if other is not None:
                    entry.link = other
                    out.append(entry)
                    return
                if not top and node.identity and node.identity in stack:
                    entry.recursive = True
                    out.append(entry)
                    return
                out.append(entry)
            if node.identity:
                stack = stack + (node.identity,)
            if depth_limit is not None and depth >= depth_limit:
                return
            for k, c in self.schemas.children(node):
                walk(c, join(path, k), node, k, stack, depth + 1, False, child_typed)

        walk(n, base_path, None, "", (), 0, True)
        return n, label, ident, out

    def _other_page(self, page: Page, path: str, node: Node, root_idx: int) -> Page | None:
        p = self.root_by_path.get(path)
        if p is not None and p is not page:
            return p
        if p is page and path not in [r.get("path") for r in page.roots[:1]]:
            pass
        if node.identity:
            q = self.root_by_ident.get(node.identity)
            if q is not None and q is not page:
                return q
        return None

    # ---- rendering -------------------------------------------------------

    def type_str(self, n: Node) -> str:
        types = list(n.types)
        if n.items is not None and "array" in types:
            item = self.schemas.node(*n.items)
            inner = [type_name(t) for t in item.types if t != "null"] or ["any"]
            if item.enum and len(inner) == 1:
                inner = [type_name(item.types[0]) if item.types else "string"]
            parts = [("list of " + " or ".join(inner)) if t == "array" else type_name(t) for t in types]
        else:
            parts = [type_name(t) for t in types]
        if not parts:
            if n.enum:
                parts = ["string"]
            elif n.props or n.addl is not None:
                parts = ["map"]
            else:
                parts = ["any"]
        return " or ".join(dict.fromkeys(parts))

    def tpl_str(self, n: Node) -> str:
        if n.helm_tpl is True or (n.helm_tpl is None and n.tpl):
            return "✅"
        if isinstance(n.helm_tpl, str):
            return f"✅ ({n.helm_tpl})"
        if n.helm_tpl is False:
            return "❌"
        return "❌"

    def default_str(self, n: Node) -> tuple[str, str | None]:
        if n.default is MISSING:
            return "unset", None
        text = json.dumps(n.default, ensure_ascii=False)
        if len(text) > LONG_DEFAULT:
            return "See below", to_yaml(n.default)
        return f"`{text}`", None

    def appears_in(self, ident: str | None, fallback: list[str]) -> list[str]:
        paths = list(self.occurrences.get(ident, [])) if ident else []
        for f in fallback:
            if f not in paths:
                paths.append(f)
        paths = [p for p in paths if p and not p.startswith("common.")]
        return sorted(paths, key=lambda p: (p.count("."), p))

    def render_entry(self, page: Page, e: Entry, prefix: str) -> str:
        n = e.node
        lines = [f"## `{e.rel}`", ""]
        if n.description:
            lines += [n.description, ""]
        if e.recursive:
            lines += ["This key repeats the structure it is part of.", ""]
        if e.link is not None:
            lines += [f"See [{e.link.title}]({self.url(e.link)}) for all keys of this object.", ""]
        if n.root_values:
            lines += [f"Takes the same keys as the [root values]({self.base_url}), next to the keys below.", ""]
        item = self.schemas.node(*n.items) if n.items else None
        rows = [
            ("Key", f"`{e.path}`"),
            ("Type", f"`{self.type_str(n)}`"),
            ("Required", "✅" if e.required else "❌"),
            ("Helm `tpl`", self.tpl_str(n)),
        ]
        d, long_default = self.default_str(n)
        rows.append(("Default", d))
        enum = n.enum or (item.enum if item else [])
        if enum:
            rows.append(("Allowed values", ", ".join(f"`{json.dumps(v, ensure_ascii=False)}`" for v in enum)))
        pattern = n.pattern or (item.pattern if item else None)
        long_pattern = None
        if pattern:
            if "|" in pattern:
                rows.append(("Pattern", "See below"))
                long_pattern = pattern
            else:
                rows.append(("Pattern", f"`{pattern}`"))
        if n.minimum is not None or n.maximum is not None:
            rows.append(("Range", f"{n.minimum if n.minimum is not None else '…'} to {n.maximum if n.maximum is not None else '…'}"))
        if n.min_length is not None or n.max_length is not None:
            rows.append(("Length", f"{n.min_length if n.min_length is not None else '…'} to {n.max_length if n.max_length is not None else '…'}"))
        if n.min_items is not None or n.max_items is not None:
            rows.append(("Items", f"{n.min_items if n.min_items is not None else '…'} to {n.max_items if n.max_items is not None else '…'}"))
        if n.applies:
            rows.append(("Applies to", ", ".join(f"`{a}`" for a in n.applies)))
        lines += [md_table(rows), ""]
        if long_default:
            lines += ["Default value:", "", "```yaml", long_default, "```", ""]
        if long_pattern:
            lines += ["Pattern:", "", "```text", long_pattern, "```", ""]
        if n.examples:
            lines += ["Example", "", "```yaml", to_yaml(nest(e.path, n.examples[0])), "```", ""]
        lines.append("---")
        return "\n".join(lines)

    def render_page(self, page: Page, examples_dir: Path) -> tuple[str, list[str]]:
        problems: list[str] = []
        body: list[str] = []
        sections: list[str] = []
        appears: list[str] = []
        intro_desc = ""
        has_examples = False
        links: list[Entry] = []
        for i, root in enumerate(page.roots):
            if (page.file, i) not in self.resolved:
                continue
            n, label, ident, entries = self.entries(page, i)
            if i == 0:
                intro_desc = n.description
                if "ref" in root:
                    appears += self.appears_in(ident, [])
                else:
                    appears += self.appears_in(ident, [label])
            else:
                appears += self.appears_in(ident, [] if "ref" in root else [label])
            if page.overview_only:
                continue
            for e in entries:
                if e.link is not None and page.compact_links:
                    links.append(e)
                    continue
                text = self.render_entry(page, e, label)
                if any(k in text for k in ("\x00",)):
                    problems.append(f"{page.file}: bad character in {e.path}")
                if e.node.examples:
                    has_examples = True
                sections.append(text)
        if page.overview_only:
            sections.append(self.render_overview(page))
        if links:
            sections.append(self.render_link_table(links))

        example_file = examples_dir / page.file
        examples_text = ""
        if example_file.exists():
            examples_text = example_file.read_text().strip("\n")

        title = page.title
        fm_title = title if re.fullmatch(r"[\w .()/&+-]+", title) else json.dumps(title)
        out = ["---", f"title: {fm_title}", "---", ""]
        bullets = []
        if has_examples:
            bullets.append("Examples under each key are only to be used as a placement guide")
        if examples_text:
            bullets.append(f"See the [Full Examples]({self.url(page, 'full-examples')}) section for complete examples.")
        if bullets:
            out += [":::note", ""] + [f"- {b}" for b in bullets] + ["", ":::", ""]
        if intro_desc and page.overview_only:
            out += [intro_desc, ""]
        if page.applies and page.parent:
            parent = next((p for p in self.pages if p.file == page.parent), None)
            if parent is not None:
                out += [
                    ":::tip",
                    "",
                    f"- See all available keys of this object on the [{parent.title}]({self.url(parent)}) page.",
                    f"- These options apply only when `type: {page.applies}`.",
                    "",
                    ":::",
                    "",
                ]
        if page.intro:
            out += [page.intro, ""]
        appears = [a for a in dict.fromkeys(appears) if a]
        if appears:
            out += ["## Appears in", ""]
            for a in appears[:MAX_APPEARS_IN]:
                out.append(f"- `.Values.{a}`")
            if len(appears) > MAX_APPEARS_IN:
                out.append(f"- and {len(appears) - MAX_APPEARS_IN} more places")
            out += ["", "---", ""]
        child_pages = self.child_pages(page)
        if child_pages:
            out += ["## Child Pages", ""]
            for c in child_pages:
                out.append(f"- [{c.title}]({self.url(c)})")
            out += ["", "---", ""]
        out += [s + "\n" for s in sections]
        if examples_text:
            if not re.match(r"^##\s+Full Examples", examples_text):
                problems.append(f"examples/{page.file}: must start with '## Full Examples'")
            out += [examples_text, ""]
        text = "\n".join(out).rstrip("\n") + "\n"
        text = re.sub(r"\n{3,}", "\n\n", text)
        return text, problems

    def child_pages(self, page: Page) -> list[Page]:
        if not page.file.endswith("index.md"):
            return []
        d = page.file[: -len("index.md")]
        out = []
        for p in self.pages:
            if p is page or not p.file.startswith(d) or d == "" and "/" in p.file:
                continue
            rest = p.file[len(d):]
            if rest.count("/") == 0 or (rest.count("/") == 1 and rest.endswith("/index.md")):
                out.append(p)
        if d == "":
            return []
        return out

    def render_overview(self, page: Page) -> str:
        n, label, _ = self.resolved[(page.file, 0)][0:3]
        lines = ["## Keys", "", "| Key | Type | Description |", "| --- | --- | --- |"]
        for k, c in self.schemas.children(n):
            path = join(label, k)
            target = self.page_for(path, c)
            if target is None or target is page:
                name = f"`{k}`"
            else:
                multi = len(target.roots) > 1 and path in [r.get("path") for r in target.roots]
                anchor = slug(path) if multi and not target.compact_links else ""
                name = f"[`{k}`]({self.url(target, anchor)})"
            desc = c.description.split("\n")[0] if c.description else ""
            lines.append(f"| {name} | `{self.type_str(c)}` | {esc_cell(desc)} |")
        return "\n".join(lines) + "\n\n---"

    def is_root_of(self, page: Page, path: str, node: Node) -> bool:
        return self.root_by_path.get(path) is page or (
            node.identity is not None and self.root_by_ident.get(node.identity) is page
        )

    def page_for(self, path: str, node: Node) -> Page | None:
        """The page that documents the key at path."""
        p = self.root_by_path.get(path) or (self.root_by_ident.get(node.identity) if node.identity else None)
        if p is not None:
            return p
        return self.page_containing(path)

    def render_link_table(self, links: list[Entry]) -> str:
        lines = ["## Linked objects", "", "| Key | Type | Description |", "| --- | --- | --- |"]
        for e in links:
            desc = e.node.description.split("\n")[0] if e.node.description else ""
            lines.append(f"| `{e.rel}` | `{self.type_str(e.node)}` | {esc_cell(desc)} |")
        return "\n".join(lines) + "\n\n---"

    def page_containing(self, path: str) -> Page | None:
        """The page whose root is path, an ancestor of path or, as a fallback, a descendant."""
        for page in self.pages:
            for root in page.roots:
                p = root.get("path")
                if p is not None and (p == path or path.startswith(p + ".") and p):
                    return page
        for page in self.pages:
            for root in page.roots:
                p = root.get("path")
                if p and p.startswith(path + "."):
                    return page
        return None

    # ---- coverage -------------------------------------------------------

    def check_coverage(self) -> list[str]:
        problems = []
        for k, c in self.schemas.children(self.root_node):
            if self.page_for(k, c) is None:
                problems.append(f"root key '{k}' is not covered by any page in docs-pages.yaml")
        files = [p.file for p in self.pages]
        for f in {f for f in files if files.count(f) > 1}:
            problems.append(f"page '{f}' is listed more than once")
        return problems

    # ---- build ----------------------------------------------------------

    def build(self, examples_dir: Path) -> tuple[dict[str, str], list[str]]:
        outputs: dict[str, str] = {}
        problems = list(self.errors) + self.check_coverage()
        for page in self.pages:
            if page.handwritten:
                continue
            text, probs = self.render_page(page, examples_dir)
            outputs[page.file] = text
            problems += probs
        return outputs, problems


# --------------------------------------------------------------------------
# Checks
# --------------------------------------------------------------------------


def strip_code(text: str) -> str:
    return re.sub(r"```.*?```", "", text, flags=re.S)


def headings(text: str) -> list[str]:
    out = []
    in_code = False
    for line in text.splitlines():
        if line.startswith("```"):
            in_code = not in_code
            continue
        if in_code:
            continue
        m = HEADING_RE.match(line)
        if m:
            out.append(re.sub(r"[`*_]{1,2}(?=\S)|(?<=\S)[`*_]{1,2}", "", m.group(2)) if False else m.group(2).replace("`", ""))
    return out


def anchors_of(text: str) -> set[str]:
    seen: dict[str, int] = {}
    out = set()
    for h in headings(text):
        s = slug(h)
        n = seen.get(s, 0)
        seen[s] = n + 1
        out.add(s if n == 0 else f"{s}-{n}")
    return out


def check_links(gen: Generator, texts: dict[str, str]) -> list[str]:
    problems = []
    by_url = {}
    for f, t in texts.items():
        p = f[:-3]
        if p.endswith("/index"):
            p = p[: -len("/index")]
        p = "" if p == "index" else p
        by_url[p] = f
    anchors = {f: anchors_of(t) for f, t in texts.items()}
    for f, t in texts.items():
        for target in LINK_RE.findall(strip_code(t)):
            if re.match(r"^[a-z]+:", target) and not target.startswith(gen.base_url):
                continue
            path, _, frag = target.partition("#")
            if path == "":
                dest = f
            elif path.startswith(gen.base_url):
                key = path[len(gen.base_url):].strip("/")
                dest = by_url.get(key)
                if dest is None:
                    problems.append(f"{f}: link to missing page {target}")
                    continue
            elif path.startswith("/"):
                continue
            else:
                continue
            if frag and frag not in anchors.get(dest, set()):
                problems.append(f"{f}: link to missing anchor {target}")
    return problems


def check_titles(gen: Generator) -> list[str]:
    problems = []
    by_dir: dict[str, list[Page]] = {}
    for p in gen.pages:
        by_dir.setdefault(str(Path(p.file).parent), []).append(p)
    for d, pages in by_dir.items():
        titles = [p.title for p in pages]
        for t in set(titles):
            if titles.count(t) > 1:
                problems.append(f"duplicate page title '{t}' in {d}/")
    return problems


def run_markdownlint(paths: list[Path], config: Path | None) -> list[str]:
    exe = shutil.which("markdownlint")
    if exe is None:
        print("⚠️  markdownlint not found, skipping the markdown lint check", file=sys.stderr)
        return []
    cmd = [exe]
    if config is not None:
        cmd += ["-c", str(config)]
    cmd += [str(p) for p in paths]
    res = subprocess.run(cmd, capture_output=True, text=True)
    return [l for l in (res.stdout + res.stderr).splitlines() if l.strip()]


def find_markdownlint_config(start: Path) -> Path | None:
    for parent in [start, *start.parents]:
        cfg = parent / ".markdownlint.yaml"
        if cfg.exists():
            return cfg
    return None



# --------------------------------------------------------------------------
# Example validation
# --------------------------------------------------------------------------

FENCE_RE = re.compile(r"```ya?ml\n(.*?)```", re.S)
PARTIAL_MARK = "docs-example: partial"
PY_TYPES = {
    "string": (str,),
    "boolean": (bool,),
    "integer": (int,),
    "number": (int, float),
    "object": (dict,),
    "array": (list,),
    "null": (type(None),),
}


class _UniqueKeyLoader(yaml.SafeLoader):
    def construct_mapping(self, node, deep=False):
        seen = set()
        for key_node, _ in node.value:
            key = self.construct_object(key_node, deep=deep)
            if key in seen:
                raise yaml.constructor.ConstructorError(
                    None, None, f"duplicate key '{key}'", key_node.start_mark
                )
            seen.add(key)
        return super().construct_mapping(node, deep)


def _type_ok(value: Any, types: list[str]) -> bool:
    for t in types:
        if t == "integer" and isinstance(value, bool):
            continue
        if t == "number" and isinstance(value, bool):
            continue
        if isinstance(value, PY_TYPES[t]):
            return True
    return False


def validate_value(schemas: Schemas, root: Node, n: Node, value: Any, path: str, errs: list[str], depth: int = 0) -> None:
    if depth > MAX_DEPTH or value is None:
        return
    if isinstance(value, str) and "{{" in value:
        return
    if n.types and not _type_ok(value, n.types) and not (n.tpl and isinstance(value, str)):
        errs.append(f"{path}: expected {' or '.join(n.types)}, got {type(value).__name__}")
        return
    if n.enum and not isinstance(value, (dict, list)) and value not in n.enum:
        errs.append(f"{path}: {value!r} is not one of {n.enum}")
    if isinstance(value, dict):
        for k, v in value.items():
            child = None
            if k in n.props:
                child = schemas.node_multi(n.props[k])
            elif n.root_values and k in root.props:
                child = schemas.node_multi(root.props[k])
            elif n.addl is not None:
                child = schemas.node(*n.addl)
            elif n.closed or (n.props and not n.root_values):
                if n.closed:
                    errs.append(f"{path}.{k}: unknown key" if path else f"{k}: unknown key")
                continue
            if child is not None:
                validate_value(schemas, root, child, v, join(path, str(k)), errs, depth + 1)
    elif isinstance(value, list) and n.items is not None:
        item = schemas.node(*n.items)
        for i, v in enumerate(value):
            validate_value(schemas, root, item, v, f"{path}[{i}]", errs, depth + 1)


def check_examples(gen: Generator, examples_dir: Path) -> list[str]:
    problems = []
    if not examples_dir.exists():
        return problems
    root = gen.root_node
    for f in sorted(examples_dir.rglob("*.md")):
        rel = f.relative_to(examples_dir).as_posix()
        for i, block in enumerate(FENCE_RE.findall(f.read_text()), 1):
            where = f"examples/{rel} block {i}"
            try:
                data = yaml.load(block, Loader=_UniqueKeyLoader)
            except yaml.YAMLError as e:
                problems.append(f"{where}: invalid yaml: {str(e).splitlines()[0]}")
                continue
            if PARTIAL_MARK in block or not isinstance(data, dict) or not data:
                continue
            if not all(k in root.props for k in data):
                continue  # a fragment of a values file, not a full one
            errs: list[str] = []
            validate_value(gen.schemas, root, root, data, "", errs)
            problems += [f"{where}: {e}" for e in errs]
    return problems


# --------------------------------------------------------------------------
# Main
# --------------------------------------------------------------------------


def write_outputs(outputs: dict[str, str], out_dir: Path, keep: set[str]) -> None:
    for f, text in outputs.items():
        dest = out_dir / f
        dest.parent.mkdir(parents=True, exist_ok=True)
        dest.write_text(text)


def existing_files(out_dir: Path) -> set[str]:
    return {p.relative_to(out_dir).as_posix() for p in out_dir.rglob("*.md")} if out_dir.exists() else set()


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--schema", type=Path, default=SCRIPT_DIR / "values.schema.source.json")
    ap.add_argument("--pages", type=Path, default=SCRIPT_DIR / "docs-pages.yaml")
    ap.add_argument("--output", type=Path, default=SCRIPT_DIR / "docs")
    ap.add_argument("--examples", type=Path, default=SCRIPT_DIR / "examples")
    ap.add_argument("--base-url", default="/truecharts-common")
    ap.add_argument("--check", action="store_true", help="fail when docs/ is not up to date or has problems")
    ap.add_argument("--clean", action="store_true", help="remove generated pages that no longer have a source")
    ap.add_argument("--no-lint", action="store_true", help="skip markdownlint")
    args = ap.parse_args()

    gen = Generator(args.schema, args.pages, args.base_url)
    outputs, problems = gen.build(args.examples)
    problems += check_titles(gen)

    handwritten = {p.file for p in gen.pages if p.handwritten}
    texts = dict(outputs)
    for f in handwritten:
        path = args.output / f
        if path.exists():
            texts[f] = path.read_text()
        else:
            problems.append(f"handwritten page docs/{f} is missing")
    problems += check_links(gen, texts)
    problems += check_examples(gen, args.examples)

    known = {p.file for p in gen.pages}
    for ex in sorted(existing_files(args.examples)):
        if ex not in known:
            problems.append(f"examples/{ex} has no page in docs-pages.yaml")

    if args.check:
        stale = []
        on_disk = existing_files(args.output)
        for f, text in outputs.items():
            if not (args.output / f).exists():
                stale.append(f"docs/{f} is missing")
            elif (args.output / f).read_text() != text:
                stale.append(f"docs/{f} is out of date")
        for f in sorted(on_disk - known):
            stale.append(f"docs/{f} is not generated by any page")
        if not args.no_lint:
            with tempfile.TemporaryDirectory() as tmp:
                tmpdir = Path(tmp)
                for f, t in texts.items():
                    (tmpdir / "docs" / f).parent.mkdir(parents=True, exist_ok=True)
                    (tmpdir / "docs" / f).write_text(t)
                problems += run_markdownlint([tmpdir / "docs"], find_markdownlint_config(SCRIPT_DIR))
                if args.examples.exists():
                    cfg = tmpdir / "examples.markdownlint.yaml"
                    base = find_markdownlint_config(SCRIPT_DIR)
                    conf = yaml.safe_load(base.read_text()) if base else {}
                    conf["MD041"] = False
                    cfg.write_text(yaml.safe_dump(conf))
                    problems += run_markdownlint([args.examples], cfg)
        problems = stale + problems
        if problems:
            print("❌ The docs have problems:")
            for p in problems:
                print(f"  - {p}")
            print("Run python3 charts/library/common/generate_docs.py to regenerate the docs.")
            return 1
        print("✅ The docs are up to date")
        return 0

    if args.clean:
        for f in sorted(existing_files(args.output) - known):
            (args.output / f).unlink()
        for d in sorted((p for p in args.output.rglob("*") if p.is_dir()), reverse=True):
            if not any(d.iterdir()):
                d.rmdir()
    write_outputs(outputs, args.output, handwritten)
    print(f"Wrote {len(outputs)} pages to {args.output}")
    if problems:
        print("❌ Problems found:")
        for p in problems:
            print(f"  - {p}")
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
