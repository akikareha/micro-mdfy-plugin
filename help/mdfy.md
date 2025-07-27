# MDfy (Markdown-ize) Plugin

A micro editor plugin that converts a URL under the cursor into a Markdown
link.

`mdfy` command transforms a URL under the cursor into Markdown link format:

```
[text](url)
```

The text part is automatically extracted from the last path segment of the URL.

For example, if your cursor is on:

```markdown
https://example.com/path/to/page
```

It will be transformed into:

```markdown
[page](https://example.com/path/to/page)
```

Shortcut: `Ctrl-Alt-g`
