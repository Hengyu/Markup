@testable import Markup
import XCTest

final class MarkupContentTests: XCTestCase {
    func testHTML() throws {
        let content = MarkupContent(
            HTMLBody: """
            <h1>This is a heading</h1><p>This is a paragraph.</p>
            """,
            type: .markdown
        )
        let expected = "<html><head>" +
        "<meta charset=\"utf-8\">" +
        "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, " +
        "maximum-scale=1.0, user-scalable=no\">" +
        "<link rel=\"stylesheet\" href=\"github-markdown.css\">" +
        "</head>" +
        "<body><h1>This is a heading</h1><p>This is a paragraph.</p></body>" +
        "</html>"
        XCTAssertEqual(content.html, expected)
    }
}
