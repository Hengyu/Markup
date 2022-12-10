//
//  MarkupContent.swift
//
//  Created by hengyu on 2022/5/19.
//  Copyright © 20122 hengyu. All rights reserved.
//

import Foundation

private class BundleLocator { }

public enum MarkupContentType: Codable, Equatable, Hashable {
    case markdown
    case code

    fileprivate func toStylesheetJS(codeStyle: MarkupCodeStyle) -> String {
        switch self {
        case .markdown:
            return "<link rel=\"stylesheet\" href=\"github-markdown.css\">"
        case .code:
            return "<link rel=\"stylesheet\" href=\(codeStyle.cssFileName())>" +
            "<script src=\"highlight.min.js\">" +
            "</script><script>hljs.highlightAll();</script>"
        }
    }
}

public enum MarkupCodeStyle: Codable, Equatable, Hashable {
    case github
    case google
    case intelliJ
    case vs
    case xcode

    fileprivate func cssFileName() -> String {
        switch self {
        case .github:
            return "github.min.css"
        case .google:
            return "googlecode.min.css"
        case .intelliJ:
            return "intellij-light.min.css"
        case .vs:
            return "vs.min.css"
        case .xcode:
            return "xcode.min.css"
        }
    }
}

public struct MarkupContent {
    private static let charset: String = "<meta charset=\"utf-8\">"
    private static let phoneAdaptive: String =
    "<meta name=\"viewport\" content=\"width=device-width, " +
    "initial-scale=1.0, maximum-scale=1.0, user-scalable=no\">"

    public var html: String {
        let stylesheet = type.toStylesheetJS(codeStyle: codeStyle)
        let header = HTMLHeader ?? "<head>\(MarkupContent.charset)\(MarkupContent.phoneAdaptive)\(stylesheet)</head>"
        let body: String
        if type == .code {
            body = "<body><pre><code>\(HTMLBody)</code></pre></body>"
        } else {
            body = "<body>\(HTMLBody)</body>"
        }
        let HTML = "<html>\(header)\(body)</html>"
        return HTML
    }

    public var type: MarkupContentType
    public var codeStyle: MarkupCodeStyle
    public var HTMLHeader: String?
    public var HTMLBody: String

    public static var resourceURL: URL? {
        #if SWIFT_PACKAGE
        return Bundle.module.resourceURL
        #else
        return Bundle(for: BundleLocator.self).resourceURL
        #endif
    }

    public init(HTMLHeader: String? = nil, HTMLBody: String, type: MarkupContentType, codeStyle: MarkupCodeStyle = .xcode) {
        self.HTMLHeader = HTMLHeader
        self.HTMLBody = HTMLBody
        self.type = type
        self.codeStyle = codeStyle
    }
}

extension String {
    func strippingImageContents() -> String {
        var result = self
        while let range = result.range(of: "<\\s*img\\s+([^>]*)\\s*>", options: .regularExpression) {
            result.replaceSubrange(range, with: "")
        }
        return result
    }

    fileprivate mutating func stripImageContents() {
        while let range = range(of: "<\\s*img\\s+([^>]*)\\s*>", options: .regularExpression) {
            replaceSubrange(range, with: "")
        }
    }
}
