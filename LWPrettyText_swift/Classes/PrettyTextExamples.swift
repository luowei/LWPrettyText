//
// PrettyTextExamples.swift
// LWPrettyText
//
// Created by luowei on 2017/3/7.
// Copyright (c) 2017 luowei. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
public struct PrettyTextExamples {

    // MARK: - Basic Examples

    /// Example: Simple colored text
    public static func coloredTextExample() -> NSMutableAttributedString {
        return "Hello, World!".pt_color(.red)
    }

    /// Example: Text with custom font
    public static func fontExample() -> NSMutableAttributedString {
        return "Custom Font Text".pt_font(.systemFont(ofSize: 24, weight: .bold))
    }

    /// Example: Text with multiple attributes using block syntax
    public static func multipleAttributesExample() -> NSMutableAttributedString {
        return "Beautiful Text".pt_addAttributes { maker in
            maker
                .color(.blue)
                .font(.systemFont(ofSize: 20, weight: .semibold))
                .underlineStyle(.single)
                .kern(2.0)
        }
    }

    /// Example: Text with different colors for different parts
    public static func partialColorExample() -> NSMutableAttributedString {
        let text = "Hello Swift World!"
        let attributed = NSMutableAttributedString(string: text)
        attributed
            .pt_color(.red, subString: "Hello")
            .pt_color(.blue, subString: "Swift")
            .pt_color(.green, subString: "World")
        return attributed
    }

    // MARK: - Advanced Examples

    /// Example: Text with shadow effect
    public static func shadowExample() -> NSMutableAttributedString {
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.gray
        shadow.shadowOffset = CGSize(width: 2, height: 2)
        shadow.shadowBlurRadius = 3

        return "Shadow Text".pt_addAttributes { maker in
            maker
                .font(.systemFont(ofSize: 24, weight: .bold))
                .color(.black)
                .shadow(shadow)
        }
    }

    /// Example: Text with line spacing
    public static func lineSpacingExample() -> NSMutableAttributedString {
        let text = "This is a long text with custom line spacing.\nIt spans multiple lines.\nNotice the spacing between lines."
        return text.pt_lineSpacing(10)
    }

    /// Example: Strikethrough text
    public static func strikethroughExample() -> NSMutableAttributedString {
        return "Discounted Price".pt_addAttributes { maker in
            maker
                .strikethroughStyle(.single)
                .strikethroughColor(.red)
                .color(.gray)
        }
    }

    /// Example: Link text
    public static func linkExample() -> NSMutableAttributedString? {
        guard let url = URL(string: "https://github.com") else { return nil }
        return "Visit GitHub".pt_addAttributes { maker in
            maker
                .link(url)
                .color(.blue)
                .underlineStyle(.single)
        }
    }

    /// Example: Background color
    public static func backgroundColorExample() -> NSMutableAttributedString {
        return "Highlighted Text".pt_addAttributes { maker in
            maker
                .backgroundColor(.yellow)
                .color(.black)
                .font(.systemFont(ofSize: 18))
        }
    }

    /// Example: Complex styled text
    public static func complexExample() -> NSMutableAttributedString {
        let attributed = NSMutableAttributedString()

        let title = "Welcome to LWPrettyText\n".pt_addAttributes { maker in
            maker
                .font(.systemFont(ofSize: 28, weight: .bold))
                .color(.black)
                .kern(1.5)
        }

        let subtitle = "A powerful attributed string library\n".pt_addAttributes { maker in
            maker
                .font(.systemFont(ofSize: 16, weight: .regular))
                .color(.gray)
                .lineSpacing(5)
        }

        let highlight = "Swift & SwiftUI Ready".pt_addAttributes { maker in
            maker
                .font(.systemFont(ofSize: 18, weight: .semibold))
                .color(.white)
                .backgroundColor(.systemBlue)
        }

        attributed.append(title)
        attributed.append(subtitle)
        attributed.append(highlight)

        return attributed
    }

    // MARK: - HTML Example

    /// Example: HTML to attributed string
    public static func htmlExample() -> NSMutableAttributedString? {
        let htmlString = """
        <html>
            <body>
                <h1>HTML Content</h1>
                <p>This is <strong>bold</strong> and this is <em>italic</em>.</p>
                <a href="https://github.com">Link to GitHub</a>
            </body>
        </html>
        """
        return htmlString.htmlAttributedString()
    }

    // MARK: - Using LWPrettyTextSwift convenience methods

    /// Example: Using convenience methods
    public static func convenienMethodsExample() -> NSMutableAttributedString {
        return LWPrettyTextSwift.styled(
            "Quick Styled Text",
            color: .purple,
            font: .systemFont(ofSize: 20, weight: .medium)
        )
    }

    /// Example: Combining multiple attributed strings
    public static func combinedExample() -> NSMutableAttributedString {
        let part1 = LWPrettyTextSwift.colored("Red", color: .red)
        let part2 = LWPrettyTextSwift.colored(" Blue", color: .blue)
        let part3 = LWPrettyTextSwift.colored(" Green", color: .green)

        return part1 + part2 + part3
    }
}

// MARK: - SwiftUI Preview Examples

@available(iOS 13.0, *)
public struct PrettyTextExamplesView: View {
    public init() {}

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Group {
                    Text("Basic Examples")
                        .font(.title)
                        .padding(.top)

                    AttributedText(PrettyTextExamples.coloredTextExample())
                    AttributedText(PrettyTextExamples.fontExample())
                    AttributedText(PrettyTextExamples.multipleAttributesExample())
                    AttributedText(PrettyTextExamples.partialColorExample())
                }

                Divider()

                Group {
                    Text("Advanced Examples")
                        .font(.title)

                    AttributedText(PrettyTextExamples.shadowExample())
                    AttributedText(PrettyTextExamples.lineSpacingExample())
                    AttributedText(PrettyTextExamples.strikethroughExample())
                    if let link = PrettyTextExamples.linkExample() {
                        AttributedText(link)
                    }
                    AttributedText(PrettyTextExamples.backgroundColorExample())
                }

                Divider()

                Group {
                    Text("Complex Example")
                        .font(.title)

                    AttributedText(PrettyTextExamples.complexExample())
                }

                Divider()

                Group {
                    Text("Convenience Methods")
                        .font(.title)

                    AttributedText(PrettyTextExamples.convenienMethodsExample())
                    AttributedText(PrettyTextExamples.combinedExample())
                }
            }
            .padding()
        }
    }
}

@available(iOS 13.0, *)
struct PrettyTextExamplesView_Previews: PreviewProvider {
    static var previews: some View {
        PrettyTextExamplesView()
    }
}
