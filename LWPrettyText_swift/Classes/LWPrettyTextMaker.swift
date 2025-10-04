//
// LWPrettyTextMaker.swift
// LWPrettyText
//
// Created by luowei on 2017/3/7.
// Copyright (c) 2017 luowei. All rights reserved.
//

import UIKit

/// A builder class for creating attributed strings with various text attributes
@available(iOS 13.0, *)
public class LWPrettyTextMaker {

    // MARK: - Properties

    public private(set) var prettyText: NSMutableAttributedString
    public var range: NSRange
    private var attributes: [NSAttributedString.Key: Any] = [:]

    // MARK: - Initialization

    public init(string: String, range: NSRange) {
        self.range = range
        self.prettyText = NSMutableAttributedString(string: string)
    }

    public init(attributedString: NSMutableAttributedString, range: NSRange) {
        self.range = range
        self.prettyText = attributedString
    }

    // MARK: - Build Method

    @discardableResult
    public func build() -> NSMutableAttributedString {
        prettyText.addAttributes(attributes, range: range)
        return prettyText
    }

    // MARK: - Attribute Methods

    @discardableResult
    public func attribute(_ attributeName: NSAttributedString.Key, value: Any) -> LWPrettyTextMaker {
        attributes[attributeName] = value
        return self
    }

    @discardableResult
    public func paragraphStyle(_ style: NSParagraphStyle) -> LWPrettyTextMaker {
        return attribute(.paragraphStyle, value: style)
    }

    @discardableResult
    public func font(_ font: UIFont) -> LWPrettyTextMaker {
        return attribute(.font, value: font)
    }

    @discardableResult
    public func color(_ color: UIColor) -> LWPrettyTextMaker {
        return attribute(.foregroundColor, value: color)
    }

    @discardableResult
    public func backgroundColor(_ color: UIColor) -> LWPrettyTextMaker {
        return attribute(.backgroundColor, value: color)
    }

    @discardableResult
    public func ligature(_ ligature: Bool) -> LWPrettyTextMaker {
        return attribute(.ligature, value: ligature ? 1 : 0)
    }

    @discardableResult
    public func kern(_ space: CGFloat) -> LWPrettyTextMaker {
        return attribute(.kern, value: space)
    }

    @discardableResult
    public func strikethroughStyle(_ style: NSUnderlineStyle) -> LWPrettyTextMaker {
        return attribute(.strikethroughStyle, value: style.rawValue)
    }

    @discardableResult
    public func strikethroughColor(_ color: UIColor) -> LWPrettyTextMaker {
        return attribute(.strikethroughColor, value: color)
    }

    @discardableResult
    public func underlineStyle(_ style: NSUnderlineStyle) -> LWPrettyTextMaker {
        return attribute(.underlineStyle, value: style.rawValue)
    }

    @discardableResult
    public func underlineColor(_ color: UIColor) -> LWPrettyTextMaker {
        return attribute(.underlineColor, value: color)
    }

    @discardableResult
    public func strokeColor(_ color: UIColor) -> LWPrettyTextMaker {
        return attribute(.strokeColor, value: color)
    }

    @discardableResult
    public func strokeWidth(_ width: CGFloat) -> LWPrettyTextMaker {
        return attribute(.strokeWidth, value: width)
    }

    @discardableResult
    public func shadow(_ shadow: NSShadow) -> LWPrettyTextMaker {
        return attribute(.shadow, value: shadow)
    }

    @discardableResult
    public func textEffect(_ effect: String) -> LWPrettyTextMaker {
        return attribute(.textEffect, value: effect)
    }

    @discardableResult
    public func attachment(_ attachment: NSTextAttachment) -> LWPrettyTextMaker {
        return attribute(.attachment, value: attachment)
    }

    @discardableResult
    public func link(_ url: URL) -> LWPrettyTextMaker {
        return attribute(.link, value: url)
    }

    @discardableResult
    public func baselineOffset(_ offset: CGFloat) -> LWPrettyTextMaker {
        return attribute(.baselineOffset, value: offset)
    }

    @discardableResult
    public func obliqueness(_ obliqueness: CGFloat) -> LWPrettyTextMaker {
        return attribute(.obliqueness, value: obliqueness)
    }

    @discardableResult
    public func expansion(_ expansion: CGFloat) -> LWPrettyTextMaker {
        return attribute(.expansion, value: expansion)
    }

    @discardableResult
    public func writingDirection(_ direction: [NSNumber]) -> LWPrettyTextMaker {
        return attribute(.writingDirection, value: direction)
    }

    @discardableResult
    public func verticalGlyphForm(_ form: Int) -> LWPrettyTextMaker {
        return attribute(.verticalGlyphForm, value: form)
    }

    // MARK: - Paragraph Style Helpers

    @discardableResult
    public func lineSpacing(_ space: CGFloat) -> LWPrettyTextMaker {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = space
        return attribute(.paragraphStyle, value: paragraphStyle)
    }
}
