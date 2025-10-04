//
// NSMutableAttributedString+PrettyText.swift
// LWPrettyText
//
// Created by luowei on 2017/3/7.
// Copyright (c) 2017 luowei. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
extension NSMutableAttributedString {

    // MARK: - Block-based Methods

    @discardableResult
    public func pt_addAttributes(_ block: (LWPrettyTextMaker) -> Void) -> NSMutableAttributedString {
        return pt_addAttributes(range: NSRange(location: 0, length: self.length), block: block)
    }

    @discardableResult
    public func pt_addAttributes(range: NSRange, block: (LWPrettyTextMaker) -> Void) -> NSMutableAttributedString {
        let maker = LWPrettyTextMaker(attributedString: self, range: range)
        block(maker)
        return maker.build()
    }

    // MARK: - Direct Attribute Methods (Full String)

    @discardableResult
    public func pt_attribute(_ attributeName: NSAttributedString.Key, value: Any) -> NSMutableAttributedString {
        return pt_attribute(attributeName, value: value, range: NSRange(location: 0, length: self.length))
    }

    @discardableResult
    public func pt_paragraphStyle(_ style: NSParagraphStyle) -> NSMutableAttributedString {
        return pt_paragraphStyle(style, range: NSRange(location: 0, length: self.length))
    }

    @discardableResult
    public func pt_font(_ font: UIFont) -> NSMutableAttributedString {
        return pt_font(font, range: NSRange(location: 0, length: self.length))
    }

    @discardableResult
    public func pt_color(_ color: UIColor) -> NSMutableAttributedString {
        return pt_color(color, range: NSRange(location: 0, length: self.length))
    }

    @discardableResult
    public func pt_backgroundColor(_ color: UIColor) -> NSMutableAttributedString {
        return pt_backgroundColor(color, range: NSRange(location: 0, length: self.length))
    }

    @discardableResult
    public func pt_ligature(_ ligature: Bool) -> NSMutableAttributedString {
        return pt_ligature(ligature, range: NSRange(location: 0, length: self.length))
    }

    @discardableResult
    public func pt_kern(_ space: CGFloat) -> NSMutableAttributedString {
        return pt_kern(space, range: NSRange(location: 0, length: self.length))
    }

    @discardableResult
    public func pt_strikethroughStyle(_ style: NSUnderlineStyle) -> NSMutableAttributedString {
        return pt_strikethroughStyle(style, range: NSRange(location: 0, length: self.length))
    }

    @discardableResult
    public func pt_strikethroughColor(_ color: UIColor) -> NSMutableAttributedString {
        return pt_strikethroughColor(color, range: NSRange(location: 0, length: self.length))
    }

    @discardableResult
    public func pt_underlineStyle(_ style: NSUnderlineStyle) -> NSMutableAttributedString {
        return pt_underlineStyle(style, range: NSRange(location: 0, length: self.length))
    }

    @discardableResult
    public func pt_underlineColor(_ color: UIColor) -> NSMutableAttributedString {
        return pt_underlineColor(color, range: NSRange(location: 0, length: self.length))
    }

    @discardableResult
    public func pt_strokeColor(_ color: UIColor) -> NSMutableAttributedString {
        return pt_strokeColor(color, range: NSRange(location: 0, length: self.length))
    }

    @discardableResult
    public func pt_strokeWidth(_ width: CGFloat) -> NSMutableAttributedString {
        return pt_strokeWidth(width, range: NSRange(location: 0, length: self.length))
    }

    @discardableResult
    public func pt_shadow(_ shadow: NSShadow) -> NSMutableAttributedString {
        return pt_shadow(shadow, range: NSRange(location: 0, length: self.length))
    }

    @discardableResult
    public func pt_textEffect(_ effect: String) -> NSMutableAttributedString {
        return pt_textEffect(effect, range: NSRange(location: 0, length: self.length))
    }

    @discardableResult
    public func pt_attachment(_ attachment: NSTextAttachment) -> NSMutableAttributedString {
        return pt_attachment(attachment, range: NSRange(location: 0, length: self.length))
    }

    @discardableResult
    public func pt_link(_ url: URL) -> NSMutableAttributedString {
        return pt_link(url, range: NSRange(location: 0, length: self.length))
    }

    @discardableResult
    public func pt_baselineOffset(_ offset: CGFloat) -> NSMutableAttributedString {
        return pt_baselineOffset(offset, range: NSRange(location: 0, length: self.length))
    }

    @discardableResult
    public func pt_obliqueness(_ obliqueness: CGFloat) -> NSMutableAttributedString {
        return pt_obliqueness(obliqueness, range: NSRange(location: 0, length: self.length))
    }

    @discardableResult
    public func pt_expansion(_ expansion: CGFloat) -> NSMutableAttributedString {
        return pt_expansion(expansion, range: NSRange(location: 0, length: self.length))
    }

    @discardableResult
    public func pt_writingDirection(_ direction: [NSNumber]) -> NSMutableAttributedString {
        return pt_writingDirection(direction, range: NSRange(location: 0, length: self.length))
    }

    @discardableResult
    public func pt_verticalGlyphForm(_ form: Int) -> NSMutableAttributedString {
        return pt_verticalGlyphForm(form, range: NSRange(location: 0, length: self.length))
    }

    @discardableResult
    public func pt_lineSpacing(_ space: CGFloat) -> NSMutableAttributedString {
        return pt_lineSpacing(space, range: NSRange(location: 0, length: self.length))
    }

    // MARK: - Substring Convenience Methods

    @discardableResult
    public func pt_color(_ color: UIColor, subString: String) -> NSMutableAttributedString {
        guard let range = self.string.range(of: subString) else {
            return self
        }
        let nsRange = NSRange(range, in: self.string)
        return pt_color(color, range: nsRange)
    }

    @discardableResult
    public func pt_font(_ font: UIFont, subString: String) -> NSMutableAttributedString {
        guard let range = self.string.range(of: subString) else {
            return self
        }
        let nsRange = NSRange(range, in: self.string)
        return pt_font(font, range: nsRange)
    }

    // MARK: - Range-based Methods

    @discardableResult
    public func pt_attribute(_ attributeName: NSAttributedString.Key, value: Any, range: NSRange) -> NSMutableAttributedString {
        addAttribute(attributeName, value: value, range: range)
        return self
    }

    @discardableResult
    public func pt_paragraphStyle(_ style: NSParagraphStyle, range: NSRange) -> NSMutableAttributedString {
        addAttribute(.paragraphStyle, value: style, range: range)
        return self
    }

    @discardableResult
    public func pt_font(_ font: UIFont, range: NSRange) -> NSMutableAttributedString {
        addAttribute(.font, value: font, range: range)
        return self
    }

    @discardableResult
    public func pt_color(_ color: UIColor, range: NSRange) -> NSMutableAttributedString {
        addAttribute(.foregroundColor, value: color, range: range)
        return self
    }

    @discardableResult
    public func pt_backgroundColor(_ color: UIColor, range: NSRange) -> NSMutableAttributedString {
        addAttribute(.backgroundColor, value: color, range: range)
        return self
    }

    @discardableResult
    public func pt_ligature(_ ligature: Bool, range: NSRange) -> NSMutableAttributedString {
        addAttribute(.ligature, value: ligature ? 1 : 0, range: range)
        return self
    }

    @discardableResult
    public func pt_kern(_ space: CGFloat, range: NSRange) -> NSMutableAttributedString {
        addAttribute(.kern, value: space, range: range)
        return self
    }

    @discardableResult
    public func pt_strikethroughStyle(_ style: NSUnderlineStyle, range: NSRange) -> NSMutableAttributedString {
        addAttribute(.strikethroughStyle, value: style.rawValue, range: range)
        return self
    }

    @discardableResult
    public func pt_strikethroughColor(_ color: UIColor, range: NSRange) -> NSMutableAttributedString {
        addAttribute(.strikethroughColor, value: color, range: range)
        return self
    }

    @discardableResult
    public func pt_underlineStyle(_ style: NSUnderlineStyle, range: NSRange) -> NSMutableAttributedString {
        addAttribute(.underlineStyle, value: style.rawValue, range: range)
        return self
    }

    @discardableResult
    public func pt_underlineColor(_ color: UIColor, range: NSRange) -> NSMutableAttributedString {
        addAttribute(.underlineColor, value: color, range: range)
        return self
    }

    @discardableResult
    public func pt_strokeColor(_ color: UIColor, range: NSRange) -> NSMutableAttributedString {
        addAttribute(.strokeColor, value: color, range: range)
        return self
    }

    @discardableResult
    public func pt_strokeWidth(_ width: CGFloat, range: NSRange) -> NSMutableAttributedString {
        addAttribute(.strokeWidth, value: width, range: range)
        return self
    }

    @discardableResult
    public func pt_shadow(_ shadow: NSShadow, range: NSRange) -> NSMutableAttributedString {
        addAttribute(.shadow, value: shadow, range: range)
        return self
    }

    @discardableResult
    public func pt_textEffect(_ effect: String, range: NSRange) -> NSMutableAttributedString {
        addAttribute(.textEffect, value: effect, range: range)
        return self
    }

    @discardableResult
    public func pt_attachment(_ attachment: NSTextAttachment, range: NSRange) -> NSMutableAttributedString {
        addAttribute(.attachment, value: attachment, range: range)
        return self
    }

    @discardableResult
    public func pt_link(_ url: URL, range: NSRange) -> NSMutableAttributedString {
        addAttribute(.link, value: url, range: range)
        return self
    }

    @discardableResult
    public func pt_baselineOffset(_ offset: CGFloat, range: NSRange) -> NSMutableAttributedString {
        addAttribute(.baselineOffset, value: offset, range: range)
        return self
    }

    @discardableResult
    public func pt_obliqueness(_ obliqueness: CGFloat, range: NSRange) -> NSMutableAttributedString {
        addAttribute(.obliqueness, value: obliqueness, range: range)
        return self
    }

    @discardableResult
    public func pt_expansion(_ expansion: CGFloat, range: NSRange) -> NSMutableAttributedString {
        addAttribute(.expansion, value: expansion, range: range)
        return self
    }

    @discardableResult
    public func pt_writingDirection(_ direction: [NSNumber], range: NSRange) -> NSMutableAttributedString {
        addAttribute(.writingDirection, value: direction, range: range)
        return self
    }

    @discardableResult
    public func pt_verticalGlyphForm(_ form: Int, range: NSRange) -> NSMutableAttributedString {
        addAttribute(.verticalGlyphForm, value: form, range: range)
        return self
    }

    @discardableResult
    public func pt_lineSpacing(_ space: CGFloat, range: NSRange) -> NSMutableAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = space
        addAttribute(.paragraphStyle, value: paragraphStyle, range: range)
        return self
    }
}
