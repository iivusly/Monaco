// swift-tools-version:5.3

// Copyright 2020 Michael F. Collins, III
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import PackageDescription

let package = Package(
  name: "MonacoEditor",
  defaultLocalization: LanguageTag("en"),
  platforms: [
    .macOS(.v11)
  ],
  products: [
    .library(
      name: "MonacoEditor",
      targets: ["MonacoEditor"]
    ),
  ],
  dependencies: [
    .package(
      name: "Gzip",
      url: "https://github.com/1024jp/GzipSwift.git",
      .upToNextMajor(from: "5.1.1")
    ),
	.package(
		name: "SwiftUI-Introspect",
		url: "https://github.com/siteline/SwiftUI-Introspect.git",
		.upToNextMajor(from: "0.1.4")
	)
  ],
  targets: [
    .target(
      name: "MonacoEditor",
      dependencies: ["Gzip"],
      resources: [
        .copy("Editor")
      ]
    ),
    .testTarget(
      name: "MonacoEditorTests",
      dependencies: ["MonacoEditor"]
    ),
  ],
  swiftLanguageVersions: [.v5]
)
