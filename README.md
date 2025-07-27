# MDfy (Markdown-ize) Plugin for Micro

A [micro](https://micro-editor.github.io/) editor plugin that converts a URL
under the cursor into a Markdown link.

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

## Installation

Place the plugin folder in `~/.config/micro/plug/mdfy/`, or clone it
directly from the GitHub repository:

```sh
mkdir -p ~/.config/micro/plug
git clone https://github.com/akikareha/micro-mdfy-plugin ~/.config/micro/plug/mdfy
```

## License

MIT.

## Author

Aki Kareha (aki@kareha.org)
