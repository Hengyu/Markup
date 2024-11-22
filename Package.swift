// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Markup",
    platforms: [
        .iOS(.v9),
        .macOS(.v10_12),
        .tvOS(.v9),
        .watchOS(.v5)
    ],
    products: [
        .library(name: "Markup", targets: ["Markup"])
    ],
    targets: [
        .target(
            name: "Markup",
            dependencies: [],
            exclude: [
                "Resources/github-markdown-css/index.html",
                "Resources/github-markdown-css/license",
                "Resources/github-markdown-css/package.json",
                "Resources/github-markdown-css/readme.md",
                "Resources/highlightjs/LICENSE"
            ],
            resources: [
                .copy("Resources/github-markdown-css/github-markdown.css"),
                .copy("Resources/github-markdown-css/github-markdown-dark.css"),
                .copy("Resources/github-markdown-css/github-markdown-light.css"),
                .copy("Resources/highlightjs/highlight.min.js"),
                .copy("Resources/highlightjs/styles/default.min.css"),
                .copy("Resources/highlightjs/styles/github-dark-dimmed.min.css"),
                .copy("Resources/highlightjs/styles/github-dark.min.css"),
                .copy("Resources/highlightjs/styles/github.min.css"),
                .copy("Resources/highlightjs/styles/googlecode.min.css"),
                .copy("Resources/highlightjs/styles/idea.min.css"),
                .copy("Resources/highlightjs/styles/intellij-light.min.css"),
                .copy("Resources/highlightjs/styles/vs.min.css"),
                .copy("Resources/highlightjs/styles/xcode.min.css")
            ]
        ),
        .testTarget(name: "MarkupTests", dependencies: ["Markup"])
    ]
)
