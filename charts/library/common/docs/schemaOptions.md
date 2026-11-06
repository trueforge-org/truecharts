---
title: Schema Options
---

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
| `x-docs-internal` | `true` | The key is only for the internal use of common. It is shown in a separate section of its page, under a warning. A page of a key that is internal gets the warning at the top. On a `$ref` to the whole root values (the dependencies take all keys of the root values) it marks only that part as internal, and the object itself stays public. A string instead of `true` is shown as the text of the warning. |

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
