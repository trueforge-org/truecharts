#!/usr/bin/env python3
"""Generate the markdown docs of the common library from its JSON schemas.

The pages are built from the values tree: values.schema.source.json is walked
from the root, every $ref is followed and every key gets its real path
(``workload.$name.podSpec.hostNetwork``, ``hostAliases[].ip``).
Which pages exist, and which part of the tree each page documents, is listed in
the schema (x-docs-page). Run with --check to verify that docs/ is up to date.
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
INTERNAL_WARNING = (
    "These keys are only for the internal use of common. Do not use them in charts that are based on common: "
    "they can change or be removed at any time, without a breaking change."
)
PAGE_LIMIT = 450  # lines of keys per page, bigger subtrees get a page of their own
SPLIT_MIN = 60  # smallest subtree (in lines) that is worth a page
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
    docs_required: bool = False
    applies: list[str] = field(default_factory=list)
    identity: str | None = None
    root_values: bool = False
    root_values_internal: bool = False  # the whole values tree is taken over, for the internal use of common
    primary: bool = False
    internal: bool = False
    extends: str | None = None  # values path of an object whose keys this object takes over
    raws: list[int] = field(default_factory=list)  # ids of the schemas the node is made of
    page_specs: list[dict] = field(default_factory=list)  # x-docs-page on the node itself
    frag_specs: list[tuple[str, dict]] = field(default_factory=list)  # x-docs-page on a referenced schema
    alt_idents: list[str] = field(default_factory=list)  # refs inside oneOf or anyOf
    chain: list[str] = field(default_factory=list)  # more refs to refs, after the first


class Schemas:
    def __init__(self, root_file: Path):
        self.root_file = root_file.resolve()
        self.base = self.root_file.parent
        self._files: dict[Path, Any] = {}
        # The raw object is kept next to the node so its id() can not be reused.
        self._cache: dict[tuple[int, Path], tuple[Any, Node]] = {}
        self._multi: dict[tuple, tuple[Any, Node]] = {}
        self.ref_idents: dict[int, str] = {}  # raw schema that is the target of a $ref -> its identity

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
        ident = self.ident(path, fragment)
        self.ref_idents[id(node)] = ident
        return node, path, ident

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

    def _absorb(self, n: Node, raw: Any, file: Path, mode: str, via: str | None = None) -> None:
        """Merge raw into n; the first value found for a keyword wins.

        via is the identity of the $ref this schema was reached through, if any.
        """
        if not isinstance(raw, dict):
            return
        # Keywords next to the $ref win over the referenced schema.
        n.raws.append(id(raw))
        self._own(n, raw, file, mode)
        spec = raw.get("x-docs-page")
        if spec:
            spec = {} if spec is True else spec
            specs = spec if isinstance(spec, list) else [spec]
            for sp in specs:
                if via:
                    n.frag_specs.append((via, sp))
                else:
                    n.page_specs.append(sp)
        if raw.get("x-docs-primary"):
            n.primary = True
        if raw.get("x-docs-internal"):
            if "$ref" in raw and self._is_root_ref(raw["$ref"], file):
                n.root_values_internal = True  # only the part that takes over the root values is internal
            else:
                n.internal = True
        if n.extends is None and raw.get("x-docs-extends"):
            n.extends = raw["x-docs-extends"]
        # Later allOf entries are overrides of earlier ones, so they are read first.
        for sub in reversed(raw.get("allOf", [])):
            self._absorb(n, sub, file, "all" if mode == "base" else mode, via)
        if "$ref" in raw:
            target, tfile, ident = self.follow(raw["$ref"], file)
            if tfile == self.root_file and ident == self.ident(tfile, ""):
                # The whole values tree again: documented as a link, not repeated.
                n.root_values = True
            else:
                if n.identity is None and mode in ("base", "all"):
                    n.identity = ident
                elif mode in ("base", "all") and ident != n.identity and ident not in n.chain:
                    n.chain.append(ident)
                elif mode == "alt" and ident not in n.alt_idents:
                    n.alt_idents.append(ident)
                self._absorb(n, target, tfile, mode, ident)
        for key in ("oneOf", "anyOf"):
            for branch in raw.get(key, []):
                if self._is_tpl_branch(branch):
                    n.tpl = True
                else:
                    self._absorb(n, branch, file, "alt", via)

    def _is_root_ref(self, ref: str, file: Path) -> bool:
        _, tfile, ident = self.follow(ref, file)
        return tfile == self.root_file and ident == self.ident(tfile, "")

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
        if raw.get("x-docs-required") is True:
            n.docs_required = True
        for a in raw.get("x-docs-appliesTo", []):
            if a not in n.applies:
                n.applies.append(a)

    def inherited_keys(self, n: Node, base: Node) -> set[str]:
        """Keys of n that are the very same schema as the key of base (or a $ref to it): documented on the page of base."""
        out = set()
        for k, sources in n.props.items():
            if k not in base.props:
                continue
            same = True
            for raw, file in sources:
                target = self.follow(raw["$ref"], file)[0] if isinstance(raw, dict) and "$ref" in raw else raw
                if not any(target is br for br, _ in base.props[k]):
                    same = False
            if same:
                out.add(k)
        return out

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
    applies: list[str] | None = None
    types: dict[str, dict] = field(default_factory=dict)
    primary: bool = False
    compact_links: bool = False
    overview_only: bool = False
    handwritten: bool = False
    description: str = ""
    collapse: dict[str, str] = field(default_factory=dict)
    body: str | None = None  # a page that is not built from the schema

    def example_files(self) -> list[str]:
        """Paths of the example file of the page: x/index.md may also be examples/x.md."""
        alts = [self.file]
        if self.file.endswith("/index.md"):
            alts.append(self.file[: -len("/index.md")] + ".md")
        return alts

    @property
    def url_path(self) -> str:
        p = self.file[:-3]
        if p.endswith("/index"):
            p = p[: -len("/index")]
        return "" if p == "index" else p


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
    internal: bool = False


SCHEMA_OPTIONS_BODY = """\
The docs are generated from the schema: `values.schema.source.json` and the files in `schemas/`. Besides the standard JSON Schema keywords, the schema has keywords that start with `x-`. They only tell the docs generator what to show, and are left out of the bundled `values.schema.json`, so they never change which values are valid.

This page is for people who work on common. Charts based on common do not need it.

## Standard keywords

| Keyword | Shown as |
| --- | --- |
| `description` | The text of the key. Plain markdown, one or two sentences. Links to other pages are written as `/truecharts-common/<page path>`, with the exact case, and are checked. |
| `type` | Type. A type list such as `["boolean", "string"]` is shown as `bool or string`, unless `x-helm-tpl` is set, see below. |
| `default` | Default. Keep it the same as the value in `values.yaml`. |
| `examples` | The first item is shown as the example of the key. |
| `enum` | Allowed values. |
| `pattern` | Pattern. |
| `minimum`, `maximum`, `minLength`, `maxLength`, `minItems`, `maxItems` | Range, Length and Items. |
| `required` | Required, for the keys in the list. Only for keys without a default, because the schema of a chart is checked before the defaults of common are merged. A key that is required but has a default, or that is only required in some cases, uses `x-docs-required`. |
| `$ref` | The referenced schema is read as part of the key. A schema that is used in several places is documented once and linked from the others. |
| `allOf` | All entries are read. A later entry overrides an earlier one. |
| `oneOf`, `anyOf` | The keys of all branches are shown. A branch that is a string with a `{{` pattern means that the value can be a Helm `tpl` template. |

## Docs keywords

| Keyword | Value | Use |
| --- | --- | --- |
| `x-helm-tpl` | `true`, `"On value only"`, `"On entries only"` or `"On keys and values"` | The value is passed through Helm `tpl`. Shown in the Helm `tpl` row, with the text next to it. For a type list like `["boolean", "string"]` it means that the string is a template, not a string value. |
| `x-docs-required` | `true` | The key is required, but can not be in `required`: it has a default, or it is only required in some cases, for example for one `type`. A key is shown as required when it is in `required` or has `x-docs-required: true`. |
| `x-docs-appliesTo` | List of values of `type` | The key is only used for these types. It is left out of the page of the object, and shown on the page of the type. |
| `x-docs-page` | `true`, an object or a list of objects | The key, or the schema file that is referenced, gets a page. See below. |
| `x-docs-primary` | `true` | The key is the home of the objects it contains. When the same schema is used in several places, the page of the primary key documents it, and the others link to it. Used for `workload`, `service` and `ingress`. |
| `x-docs-extends` | A values path, such as `workload.$name.podSpec.containers.$name` | The object takes over the keys of another object, and adds its own. The keys that are a `$ref` to the same schema as the key of the other object are left out of the docs, and the page says that it takes the same keys. Used for the container of an addon. |
| `x-docs-internal` | `true` | The key is only for the internal use of common. It is shown in a separate section of its page, under a warning. A page of a key that is internal gets the warning at the top. On a `$ref` to the whole root values (the dependencies take all keys of the root values) it marks only that part as internal, and the object itself stays public. |

## Pages

A page is created for every key or schema file with `x-docs-page`. Its file is the values path without `$name` and `[]`, so the folders follow the tree of `values.yaml`: `ingress.$name.integrations.traefik` is `ingress/integrations/traefik.md`. A page with sub pages becomes `index.md` in a folder, and its URL stays the same.

```json
"integrations": {
  "x-docs-page": {"title": "Ingress Integrations", "overview": true}
}
```

| Option | Use |
| --- | --- |
| `file` | The file of the page, when it is not the one from the values path. Needed to put several keys on one page: give each of them the same `file`. |
| `title` | The title of the page. Default is the name of the key. |
| `intro` | Text below the title. |
| `overview` | Show a table of the keys, instead of a section for each key. |
| `compact` | Show the keys after the first one on the page as one row each. |
| `handwritten` | The page is written by hand, and not generated. |
| `collapse` | Show a key of the page as a link to another page, for example `{"service": "service/index.md"}`. |
| `types` | Names the pages of the types of the object, see below. |

A page that gets longer than about 450 lines of keys is split: the biggest subtrees get a page of their own, named after their values path.

## Types

An object with a `type` that has a list of values gets a page for each value, in the folder of its page, when some of its keys have `x-docs-appliesTo`. The page shows the keys of that type. `types` changes how the pages are named, or joins types:

```json
"x-docs-page": {
  "title": "Persistence",
  "types": {
    "nfs": {"file": "nfs", "title": "NFS"},
    "pvc-vct": {"title": "PVC and VCT", "tokens": ["pvc", "vct"]}
  }
}
```
"""


class Generator:
    def __init__(self, schema_file: Path, base_url: str):
        self.schemas = Schemas(schema_file)
        self.pages: list[Page] = []
        self.removed: list[str] = []
        self.base_url = base_url.rstrip("/")
        self.errors: list[str] = []
        self.root_node = self.schemas.node(*self.schemas.root())
        self._index_occurrences()
        self._build_pages()
        self.pages.append(Page(file="schemaOptions.md", title="Schema Options", roots=[], body=SCHEMA_OPTIONS_BODY))
        self._index_roots()
        self._fold_indexes()

    # ---- indexes ---------------------------------------------------------

    def _index_occurrences(self) -> None:
        self.occurrences: dict[str, list[str]] = {}
        self._found: list[tuple] = []
        seen_specs: set = set()

        def walk(n: Node, path: str, stack: tuple, depth: int) -> None:
            if depth > MAX_DEPTH:
                return
            for sp in n.page_specs:
                if ("p", id(sp)) not in seen_specs:
                    seen_specs.add(("p", id(sp)))
                    self._found.append(("path", path, sp, n))
            for ident, sp in n.frag_specs:
                if ("r", ident, id(sp)) not in seen_specs:
                    seen_specs.add(("r", ident, id(sp)))
                    self._found.append(("ref", ident, sp, n))
            for ident in ([n.identity] if n.identity else []) + n.chain:
                paths = self.occurrences.setdefault(ident, [])
                if path not in paths:
                    paths.append(path)
            if n.identity:
                if n.identity in stack:
                    return
                stack = stack + (n.identity,)
            for k, c in self.schemas.children(n):
                walk(c, join(path, k), stack, depth + 1)

        walk(self.root_node, "", (), 0)

    def home_paths(self, ident: str) -> list[str]:
        """Where a shared schema appears, the places of primary keys (workload, service, ingress) first."""
        primary = {k for k, c in self.schemas.children(self.root_node) if c.primary}
        paths = [p for p in self.occurrences.get(ident, []) if p and not p.startswith("common.")]
        return sorted(paths, key=lambda p: re.split(r"[.\[]", p)[0] not in primary)

    @staticmethod
    def generalize(paths: list[str]) -> str | None:
        """The shortest path, with the one name that differs between the places as $name (addons.$name.container)."""
        if not paths:
            return None
        first = paths[0]
        parts = [p.split(".") for p in paths]
        if len(parts) > 1 and all(len(q) == len(parts[0]) for q in parts):
            differing = [i for i in range(len(parts[0])) if len({q[i] for q in parts}) > 1]
            if len(differing) == 1 and all(not q[differing[0]].endswith("]") for q in parts):
                out = parts[0][:]
                out[differing[0]] = "$name"
                return ".".join(out)
        return first

    @staticmethod
    def default_file(label: str) -> str:
        keys = [k for k in re.findall(r"\[\]|[^.\[\]]+", label) if k not in ("$name", "[]")]
        return "/".join(keys) + ".md" if keys else "index.md"

    def _build_pages(self) -> None:
        """Pages come from x-docs-page in the schema: on a key, or on a schema file that is referenced."""
        groups: dict[str, list[tuple]] = {}
        for kind, where, spec, node in self._found:
            if kind == "path":
                label, root = where, {"path": where}
            else:
                homes = self.home_paths(where)
                label, root = (self.generalize(homes) if homes else Path(where.split("#")[0]).stem), {"ref": where}
            file = spec.get("file") or self.default_file(label)
            groups.setdefault(file, []).append((label, root, spec, node))
        for file, items in groups.items():
            opts: dict[str, Any] = {}
            for _, _, spec, _ in items:
                for k, v in spec.items():
                    opts.setdefault(k, v)
            label = items[0][0]
            self.pages.append(
                Page(
                    file=file,
                    title=opts.get("title") or (re.split(r"[.\[]", label.replace("[]", ""))[-1] if label else "Docs"),
                    roots=[root for _, root, _, _ in items],
                    intro=(opts.get("intro") or "").strip(),
                    compact_links=bool(opts.get("compact")),
                    overview_only=bool(opts.get("overview")),
                    handwritten=bool(opts.get("handwritten")),
                    collapse=dict(opts.get("collapse") or {}),
                    types=dict(opts.get("types") or {}),
                    primary=any(node.primary for _, _, _, node in items),
                )
            )

    def _resolve_root(self, root: dict) -> tuple[Node | None, str, str | None]:
        """Return (node, key label, identity) for a page root."""
        if "ref" in root:
            ref = root["ref"]
            n = self.schemas.node({"$ref": ref}, self.schemas.base / "_root.json")
            where = self.home_paths(n.identity) if n.identity else []
            label = root.get("key") or self.generalize(where) or Path(ref.split("#")[0]).stem
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
        ident = n.identity or next((self.schemas.ref_idents[i] for i in n.raws if i in self.schemas.ref_idents), None)
        return n, path, ident

    def _index_roots(self) -> None:
        self.root_by_path: dict[str, Page] = {}
        self.root_by_ident: dict[str, Page] = {}
        self.resolved: dict[tuple[str, int], tuple[Node, str, str | None]] = {}
        # Pages of primary keys (workload, service, ingress) are registered first, so they win a shared schema.
        for page in sorted(self.pages, key=lambda p: not p.primary):
            self._register(page)
        self._typed_pages()
        self._auto_split()

    def _register(self, page: Page) -> None:
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
                if ident and i == 0 and not page.overview_only:
                    self.root_by_ident.setdefault(ident, page)
                if i == 0 and n.addl is not None and not n.props and not page.overview_only:
                    child = self.schemas.node(*n.addl)  # a map of named objects: the page is the page of the objects
                    if child.identity:
                        self.root_by_ident.setdefault(child.identity, page)

    def _folder(self, page: Page) -> str:
        """The folder of the sub pages of a page; x.md becomes x/index.md when it gets sub pages."""
        f = page.file
        if f == "index.md" or f.endswith("/index.md"):
            return f[: -len("index.md")]
        folder = f[:-3] + "/"
        old = f
        page.file = folder + "index.md"
        for p in self.pages:
            if p.parent == old:
                p.parent = page.file
            p.collapse = {k: (page.file if v == old else v) for k, v in p.collapse.items()}
        for key in [k for k in self.resolved if k[0] == old]:
            self.resolved[(page.file, key[1])] = self.resolved.pop(key)
        return folder

    def _fold_indexes(self) -> None:
        for page in list(self.pages):
            stem = page.file[:-3]
            if page.file != "index.md" and not page.file.endswith("/index.md"):
                if any(o.file.startswith(stem + "/") for o in self.pages if o is not page):
                    self._folder(page)

    def _typed_pages(self) -> None:
        """A page for each value of `type` of an object, from the enum of `type` and from x-docs-appliesTo."""
        claimed: set[str] = set()  # objects that already have their type pages
        todo = [
            p for p in self.pages
            if not (p.handwritten or p.overview_only or p.applies) and (p.file, 0) in self.resolved
        ]
        todo.sort(key=lambda p: (-self.resolved[(p.file, 0)][1].count("."), p.file))  # deepest first
        for page in todo:
            node, label, _ = self.resolved[(page.file, 0)]
            found: dict[str, dict[str, set]] = {}
            enums: dict[str, list[str]] = {}

            def scan(n: Node, path: str, rpath: str | None, stack: tuple, depth: int) -> None:
                if depth > MAX_DEPTH:
                    return
                if rpath is None and path.endswith("$name"):
                    rpath = path
                if rpath == path and "type" in n.props:
                    tn = self.schemas.node_multi(n.props["type"])
                    if tn.enum:
                        enums[rpath] = [str(v) for v in tn.enum]
                if n.applies:
                    tokens = found.setdefault(rpath or label, {})
                    for t in n.applies:
                        tokens.setdefault(t, set()).add(path)
                if n.identity:
                    if n.identity in stack:
                        return
                    stack = stack + (n.identity,)
                for k, c in self.schemas.children(n):
                    cp = join(path, k)
                    if cp[len(label) + 1:] in page.collapse:
                        continue
                    scan(c, cp, rpath, stack, depth + 1)

            scan(node, label, None, (), 0)
            for rpath, tokens in found.items():
                if rpath not in enums or rpath in claimed:
                    continue  # only objects with a `type` that has a list of values get type pages
                claimed.add(rpath)
                for t in enums[rpath]:
                    tokens.setdefault(t, set())
                # Types are documented one by one, unless the schema joins them (types: {"pvc-vct": {"tokens": [...]}}).
                joined = {t: key for key, sp in page.types.items() for t in sp.get("tokens", [])}
                groups: dict[str, list[str]] = {}
                for t in tokens:
                    groups.setdefault(joined.get(t, t), []).append(t)
                folder = self._folder(page)
                for key, toks in groups.items():
                    spec = page.types.get(key) or {}
                    child = Page(
                        file=folder + (spec.get("file") or key) + ".md",
                        title=spec.get("title") or key,
                        roots=[{"path": rpath}],
                        parent=page.file,
                        applies=toks,
                    )
                    self.pages.append(child)
                    self._register(child)

    def _auto_split(self) -> None:
        """Give subtrees that make a page too big a page of their own, in the folder of the page."""
        queue = list(self.pages)
        while queue:
            page = queue.pop(0)
            if page.handwritten or page.overview_only or page.applies or len(page.roots) != 1:
                continue
            if (page.file, 0) not in self.resolved:
                continue
            for _ in range(100):
                n, label, ident, entries = self.entries(page, 0)
                height = {e.path: self.render_entry(page, e, label).count("\n") + 1 for e in entries}
                if sum(height.values()) <= PAGE_LIMIT:
                    break
                sizes = {
                    e.path: sum(h for q, h in height.items() if q == e.path or q.startswith((e.path + ".", e.path + "[")))
                    for e in entries
                    if e.link is None
                }
                cands = [
                    (size, path)
                    for path, size in sizes.items()
                    if path != label and size >= SPLIT_MIN and not path.endswith(("$name", "[]"))
                ]
                if not cands:
                    break
                cands.sort(key=lambda c: (-c[0], c[1]))
                child = self._split_page(page, label, cands[0][1])
                if child is None:
                    break
                self._register(child)
                self.pages.append(child)
                queue.append(child)

    def _split_page(self, parent: Page, label: str, path: str) -> Page | None:
        keys = [k for k in re.findall(r"\[\]|[^.\[\]]+", path[len(label):]) if k not in ("$name", "[]")]
        if not keys:
            return None
        folder = self._folder(parent)
        file = folder + "/".join(keys) + ".md"
        if any(p.file == file for p in self.pages):
            file = folder + "-".join(keys) + ".md"
        return Page(file=file, title=keys[-1], roots=[{"path": path}])

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

        def walk(node, path, parent, key, stack, depth, top, typed_ok=False, internal=False):
            if depth > MAX_DEPTH:
                return
            emit = not top or (page.applies is None and not page.overview_only)
            internal = internal or (node.internal and not top)
            child_typed = typed_ok
            if not top:
                if page.applies is None:
                    # Typed keys are documented on the page of their type.
                    if node.applies:
                        return
                else:
                    if node.applies and not set(page.applies) & set(node.applies):
                        return
                    child_typed = typed_ok or bool(set(page.applies) & set(node.applies))
                    emit = child_typed
            if emit:
                entry = Entry(
                    path=path,
                    rel=rel_of(path),
                    node=node,
                    required=node.docs_required is True or bool(parent and key in parent.required),
                    internal=internal and not top,
                )
                other = None if top or node.extends else self._other_page(page, path, node, root_idx)
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
            skip: set[str] = set()
            if node.extends:
                base, _, _ = self._resolve_root({"path": node.extends})
                if base is not None:
                    skip = self.schemas.inherited_keys(node, base)
                    if node.addl is not None and base.addl is not None and node.addl[0] is base.addl[0]:
                        skip.add("$name")
            for k, c in self.schemas.children(node):
                if k in skip:
                    continue
                walk(c, join(path, k), node, k, stack, depth + 1, False, child_typed, internal)

        walk(n, base_path, None, "", (), 0, True)
        return n, label, ident, out

    def _other_page(self, page: Page, path: str, node: Node, root_idx: int) -> Page | None:
        p = self.root_by_path.get(path)
        if p is not None and p is not page:
            return p
        if p is page and path not in [r.get("path") for r in page.roots[:1]]:
            pass
        for ident in ([node.identity] if node.identity else []) + node.chain + node.alt_idents:
            q = self.root_by_ident.get(ident)
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
        if n.extends:
            base_node, _, _ = self._resolve_root({"path": n.extends})
            base_page = self.root_by_path.get(n.extends) or (
                self.root_by_ident.get(base_node.identity) if base_node is not None and base_node.identity else None
            )
            if base_page is not None:
                lines += [f"Takes the same keys as the [{base_page.title}]({self.url(base_page)}) page, next to the keys below.", ""]
        if n.root_values_internal:
            lines += [
                ":::warning", "",
                "This object also takes all keys of the root values, for example `workload`, `service` and `persistence`. "
                "Common sets them for the dependency. They are only for the internal use of common: "
                "do not use them in charts that are based on common.",
                "", ":::", "",
            ]
        elif n.root_values:
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
        if page.body is not None:
            return f"---\ntitle: {page.title}\n---\n\n{page.body.strip()}\n", []
        problems: list[str] = []
        body: list[str] = []
        sections: list[str] = []
        internal_sections: list[str] = []
        page_internal = False
        appears: list[str] = []
        intro_desc = ""
        has_examples = False
        links: list[Entry] = []
        for i, root in enumerate(page.roots):
            if (page.file, i) not in self.resolved:
                continue
            n, label, ident, entries = self.entries(page, i)
            if i == 0:
                page_internal = n.internal
                intro_desc = n.description
                if "ref" in root:
                    appears += self.appears_in(ident, [])
                else:
                    appears += self.appears_in(ident, [label])
            else:
                appears += self.appears_in(ident, [] if "ref" in root else [label])
            if page.overview_only:
                continue
            if page.compact_links and i > 0:
                links.append(entries[0])  # one row for the whole root
                continue
            for e in entries:
                text = self.render_entry(page, e, label)
                if any(k in text for k in ("\x00",)):
                    problems.append(f"{page.file}: bad character in {e.path}")
                if e.node.examples:
                    has_examples = True
                (internal_sections if e.internal else sections).append(text)
        if page.overview_only:
            sections.append(self.render_overview(page))
        if links:
            sections.append(self.render_link_table(links))

        examples_text = ""
        for alt in page.example_files():
            if (examples_dir / alt).exists():
                examples_text = (examples_dir / alt).read_text().strip("\n")
                break
        if not examples_text and not (page.handwritten or page.overview_only):
            examples_text = self.auto_examples(page)
            if not examples_text:
                problems.append(f"{page.file}: the page has no examples, add examples/{page.example_files()[-1]}")

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
                    f"- These options apply only when `type: {' or '.join(page.applies)}`.",
                    "",
                    ":::",
                    "",
                ]
        if page_internal:
            out += [":::warning", "", INTERNAL_WARNING, "", ":::", ""]
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
        if internal_sections:
            out += ["## Internal Common Keys", "", ":::warning", "", INTERNAL_WARNING, "", ":::", "", "---", ""]
            out += [s + "\n" for s in internal_sections]
        if examples_text:
            if not re.match(r"^##\s+Full Examples", examples_text):
                problems.append(f"examples/{page.file}: must start with '## Full Examples'")
            out += [examples_text, ""]
        text = "\n".join(out).rstrip("\n") + "\n"
        text = re.sub(r"\n{3,}", "\n\n", text)
        return text, problems

    def auto_examples(self, page: Page) -> str:
        """Examples for a page without an example file: the part of the examples of other pages that is about the page."""
        if not page.roots or (page.file, 0) not in self.resolved:
            return ""
        _, label, _ = self.resolved[(page.file, 0)]
        segs = re.findall(r"\[\]|[^.\[\]]+", label)
        found: dict[str, str] = {}
        for _, data in self._example_blocks:
            for concrete, value in find_subtrees(data, segs):
                if page.applies and not (isinstance(value, dict) and str(value.get("type")) in page.applies):
                    continue
                text = to_yaml(wrap(concrete, value))
                if 2 <= text.count("\n") + 1 <= 60:
                    found.setdefault(text, text)
        picked = sorted(found, key=lambda t: (t.count("\n"), t))[:3]
        note = "These examples are the part of the examples of other pages that is about this page."
        if not picked:
            gen = self.generated_example(page)
            if not gen:
                return ""
            picked, note = [gen], "A small example, built from the schema. It shows the keys that the page needs."
        out = ["## Full Examples", "", note, ""]
        for t in picked:
            out += ["```yaml", t, "```", ""]
        return "\n".join(out).rstrip("\n")

    def schema_example(self, n: Node, depth: int = 0) -> Any:
        """A small value for a schema: its example, default or first allowed value, else a placeholder of its type."""
        if n.examples:
            return n.examples[0]
        if n.default is not MISSING and n.default not in (None, "", [], {}):
            return n.default
        for v in n.enum:
            return v
        types = [t for t in n.types if t != "null"]
        if n.props or n.addl is not None or "object" in types:
            if depth >= 4:
                return {}
            out: dict = {}
            names = [k for k in n.props if k in n.required] or list(n.props)[:2]
            for k in names:
                out[k] = self.schema_example(self.schemas.node_multi(n.props[k]), depth + 1)
            if not out and n.addl is not None:
                out["example"] = self.schema_example(self.schemas.node(*n.addl), depth + 1)
            return out
        if n.items is not None or "array" in types:
            if depth >= 4 or n.items is None:
                return []
            return [self.schema_example(self.schemas.node(*n.items), depth + 1)]
        if "boolean" in types:
            return True
        if "integer" in types or "number" in types:
            return max(n.minimum or 0, 1)
        return "example"

    def generated_example(self, page: Page) -> str:
        """A last resort example for a page: the keys it needs, built from the schema."""
        n, label, _ = self.resolved[(page.file, 0)]
        value = self.schema_example(n)
        if value in ({}, [], None):
            return ""
        segs = re.findall(r"\[\]|[^.\[\]]+", label)
        data = wrap(["example" if x == "$name" else x for x in segs], value)
        errs: list[str] = []
        if isinstance(data, dict) and all(k in self.root_node.props for k in data):
            validate_value(self.schemas, self.root_node, self.root_node, data, "", errs)
        if errs:
            return ""
        return to_yaml(data)

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
        return sorted(out, key=lambda c: (c.title.lower(), c.file))

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
                problems.append(f"root key '{k}' is not covered by any page (add x-docs-page to it in the schema)")
        files = [p.file for p in self.pages]
        for f in {f for f in files if files.count(f) > 1}:
            problems.append(f"page '{f}' is listed more than once")
        return problems

    # ---- build ----------------------------------------------------------

    def build(self, examples_dir: Path) -> tuple[dict[str, str], list[str]]:
        outputs: dict[str, str] = {}
        self._example_blocks = load_example_blocks(examples_dir, set(self.root_node.props))
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


def load_example_blocks(examples_dir: Path, root_keys: set) -> list[tuple[str, dict]]:
    """The yaml blocks of all example files that are complete values files (they start at a root key)."""
    blocks: list[tuple[str, dict]] = []
    if not examples_dir.exists():
        return blocks
    for f in sorted(examples_dir.rglob("*.md")):
        for block in FENCE_RE.findall(f.read_text()):
            try:
                data = yaml.load(block, Loader=_UniqueKeyLoader)
            except yaml.YAMLError:
                continue
            if isinstance(data, dict) and data and all(k in root_keys for k in data):
                blocks.append((f.as_posix(), data))
    return blocks


def find_subtrees(data: Any, segs: list[str], concrete: list | None = None):
    """Yield (concrete path, value) for the values of data that a values path like a.$name.b[] points to."""
    concrete = concrete or []
    if not segs:
        yield concrete, data
        return
    seg, rest = segs[0], segs[1:]
    if seg == "[]":
        if isinstance(data, list):
            for item in data:
                yield from find_subtrees(item, rest, concrete + ["[]"])
    elif isinstance(data, dict):
        keys = list(data) if seg == "$name" else ([seg] if seg in data else [])
        for k in keys:
            yield from find_subtrees(data[k], rest, concrete + [k])


def wrap(concrete: list, value: Any) -> Any:
    out = value
    for seg in reversed(concrete):
        out = [out] if seg == "[]" else {seg: out}
    return out



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
    ap.add_argument("--output", type=Path, default=SCRIPT_DIR / "docs")
    ap.add_argument("--examples", type=Path, default=SCRIPT_DIR / "examples")
    ap.add_argument("--base-url", default="/truecharts-common")
    ap.add_argument("--check", action="store_true", help="fail when docs/ is not up to date or has problems")
    ap.add_argument("--clean", action="store_true", help="remove generated pages that no longer have a source")
    ap.add_argument("--no-lint", action="store_true", help="skip markdownlint")
    args = ap.parse_args()

    gen = Generator(args.schema, args.base_url)
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
    known_examples = {a for p in gen.pages for a in p.example_files()}
    for ex in sorted(existing_files(args.examples)):
        if ex not in known_examples:
            problems.append(f"examples/{ex} has no page")

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
