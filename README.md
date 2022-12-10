# Markup

Render markdown and code into `HTML` within `CSS` styles.

## Installation

`Markup` could be installed via [Swift Package Manager](https://www.swift.org/package-manager/). Open Xcode and go to **File** -> **Add Packages...**, search `https://github.com/hengyu/Markup.git`, and add the package as one of your project's dependency.

## Usage

```swift
import Markup

let html = MarkupContent(HTMLBody: rawMarkdown, type: .markdown).html
webView.render(html, baseURL: MarkupContent.resourceURL)
```

## Acknowledgements

- `Markup` uses the [highlight.js](https://github.com/highlightjs/highlight.js) to render the code files; 
- `Markup` also leverages the [github-markdown-css](https://github.com/sindresorhus/github-markdown-css) to render markdown text in GitHub style.

## License

`Markup` is released under the [MIT License](LICENSE).
