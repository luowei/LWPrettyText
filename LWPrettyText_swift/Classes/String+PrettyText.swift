//
// String+PrettyText.swift
// LWPrettyText
//
// Created by luowei on 2017/3/7.
// Copyright (c) 2017 luowei. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
extension String {

    // MARK: - Block-based Methods

    public func pt_addAttributes(_ block: (LWPrettyTextMaker) -> Void) -> NSMutableAttributedString {
        return pt_addAttributes(range: NSRange(location: 0, length: self.count), block: block)
    }

    public func pt_addAttributes(range: NSRange, block: (LWPrettyTextMaker) -> Void) -> NSMutableAttributedString {
        let maker = LWPrettyTextMaker(string: self, range: range)
        block(maker)
        return maker.build()
    }

    // MARK: - Direct Attribute Methods (Full String)

    public func pt_attribute(_ attributeName: NSAttributedString.Key, value: Any) -> NSMutableAttributedString {
        return pt_attribute(attributeName, value: value, range: NSRange(location: 0, length: self.count))
    }

    public func pt_paragraphStyle(_ style: NSParagraphStyle) -> NSMutableAttributedString {
        return pt_paragraphStyle(style, range: NSRange(location: 0, length: self.count))
    }

    public func pt_font(_ font: UIFont) -> NSMutableAttributedString {
        return pt_font(font, range: NSRange(location: 0, length: self.count))
    }

    public func pt_color(_ color: UIColor) -> NSMutableAttributedString {
        return pt_color(color, range: NSRange(location: 0, length: self.count))
    }

    public func pt_backgroundColor(_ color: UIColor) -> NSMutableAttributedString {
        return pt_backgroundColor(color, range: NSRange(location: 0, length: self.count))
    }

    public func pt_ligature(_ ligature: Bool) -> NSMutableAttributedString {
        return pt_ligature(ligature, range: NSRange(location: 0, length: self.count))
    }

    public func pt_kern(_ space: CGFloat) -> NSMutableAttributedString {
        return pt_kern(space, range: NSRange(location: 0, length: self.count))
    }

    public func pt_strikethroughStyle(_ style: NSUnderlineStyle) -> NSMutableAttributedString {
        return pt_strikethroughStyle(style, range: NSRange(location: 0, length: self.count))
    }

    public func pt_strikethroughColor(_ color: UIColor) -> NSMutableAttributedString {
        return pt_strikethroughColor(color, range: NSRange(location: 0, length: self.count))
    }

    public func pt_underlineStyle(_ style: NSUnderlineStyle) -> NSMutableAttributedString {
        return pt_underlineStyle(style, range: NSRange(location: 0, length: self.count))
    }

    public func pt_underlineColor(_ color: UIColor) -> NSMutableAttributedString {
        return pt_underlineColor(color, range: NSRange(location: 0, length: self.count))
    }

    public func pt_strokeColor(_ color: UIColor) -> NSMutableAttributedString {
        return pt_strokeColor(color, range: NSRange(location: 0, length: self.count))
    }

    public func pt_strokeWidth(_ width: CGFloat) -> NSMutableAttributedString {
        return pt_strokeWidth(width, range: NSRange(location: 0, length: self.count))
    }

    public func pt_shadow(_ shadow: NSShadow) -> NSMutableAttributedString {
        return pt_shadow(shadow, range: NSRange(location: 0, length: self.count))
    }

    public func pt_textEffect(_ effect: String) -> NSMutableAttributedString {
        return pt_textEffect(effect, range: NSRange(location: 0, length: self.count))
    }

    public func pt_attachment(_ attachment: NSTextAttachment) -> NSMutableAttributedString {
        return pt_attachment(attachment, range: NSRange(location: 0, length: self.count))
    }

    public func pt_link(_ url: URL) -> NSMutableAttributedString {
        return pt_link(url, range: NSRange(location: 0, length: self.count))
    }

    public func pt_baselineOffset(_ offset: CGFloat) -> NSMutableAttributedString {
        return pt_baselineOffset(offset, range: NSRange(location: 0, length: self.count))
    }

    public func pt_obliqueness(_ obliqueness: CGFloat) -> NSMutableAttributedString {
        return pt_obliqueness(obliqueness, range: NSRange(location: 0, length: self.count))
    }

    public func pt_expansion(_ expansion: CGFloat) -> NSMutableAttributedString {
        return pt_expansion(expansion, range: NSRange(location: 0, length: self.count))
    }

    public func pt_writingDirection(_ direction: [NSNumber]) -> NSMutableAttributedString {
        return pt_writingDirection(direction, range: NSRange(location: 0, length: self.count))
    }

    public func pt_verticalGlyphForm(_ form: Int) -> NSMutableAttributedString {
        return pt_verticalGlyphForm(form, range: NSRange(location: 0, length: self.count))
    }

    public func pt_lineSpacing(_ space: CGFloat) -> NSMutableAttributedString {
        return pt_lineSpacing(space, range: NSRange(location: 0, length: self.count))
    }

    // MARK: - Substring Convenience Methods

    public func pt_color(_ color: UIColor, subString: String) -> NSMutableAttributedString? {
        guard let range = self.range(of: subString) else {
            return nil
        }
        let nsRange = NSRange(range, in: self)
        return pt_color(color, range: nsRange)
    }

    public func pt_font(_ font: UIFont, subString: String) -> NSMutableAttributedString? {
        guard let range = self.range(of: subString) else {
            return nil
        }
        let nsRange = NSRange(range, in: self)
        return pt_font(font, range: nsRange)
    }

    // MARK: - Range-based Methods

    public func pt_attribute(_ attributeName: NSAttributedString.Key, value: Any, range: NSRange) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(attributeName, value: value, range: range)
        return attributedString
    }

    public func pt_paragraphStyle(_ style: NSParagraphStyle, range: NSRange) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(.paragraphStyle, value: style, range: range)
        return attributedString
    }

    public func pt_font(_ font: UIFont, range: NSRange) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(.font, value: font, range: range)
        return attributedString
    }

    public func pt_color(_ color: UIColor, range: NSRange) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(.foregroundColor, value: color, range: range)
        return attributedString
    }

    public func pt_backgroundColor(_ color: UIColor, range: NSRange) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(.backgroundColor, value: color, range: range)
        return attributedString
    }

    public func pt_ligature(_ ligature: Bool, range: NSRange) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(.ligature, value: ligature ? 1 : 0, range: range)
        return attributedString
    }

    public func pt_kern(_ space: CGFloat, range: NSRange) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(.kern, value: space, range: range)
        return attributedString
    }

    public func pt_strikethroughStyle(_ style: NSUnderlineStyle, range: NSRange) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(.strikethroughStyle, value: style.rawValue, range: range)
        return attributedString
    }

    public func pt_strikethroughColor(_ color: UIColor, range: NSRange) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(.strikethroughColor, value: color, range: range)
        return attributedString
    }

    public func pt_underlineStyle(_ style: NSUnderlineStyle, range: NSRange) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(.underlineStyle, value: style.rawValue, range: range)
        return attributedString
    }

    public func pt_underlineColor(_ color: UIColor, range: NSRange) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(.underlineColor, value: color, range: range)
        return attributedString
    }

    public func pt_strokeColor(_ color: UIColor, range: NSRange) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(.strokeColor, value: color, range: range)
        return attributedString
    }

    public func pt_strokeWidth(_ width: CGFloat, range: NSRange) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(.strokeWidth, value: width, range: range)
        return attributedString
    }

    public func pt_shadow(_ shadow: NSShadow, range: NSRange) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(.shadow, value: shadow, range: range)
        return attributedString
    }

    public func pt_textEffect(_ effect: String, range: NSRange) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(.textEffect, value: effect, range: range)
        return attributedString
    }

    public func pt_attachment(_ attachment: NSTextAttachment, range: NSRange) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(.attachment, value: attachment, range: range)
        return attributedString
    }

    public func pt_link(_ url: URL, range: NSRange) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(.link, value: url, range: range)
        return attributedString
    }

    public func pt_baselineOffset(_ offset: CGFloat, range: NSRange) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(.baselineOffset, value: offset, range: range)
        return attributedString
    }

    public func pt_obliqueness(_ obliqueness: CGFloat, range: NSRange) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(.obliqueness, value: obliqueness, range: range)
        return attributedString
    }

    public func pt_expansion(_ expansion: CGFloat, range: NSRange) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(.expansion, value: expansion, range: range)
        return attributedString
    }

    public func pt_writingDirection(_ direction: [NSNumber], range: NSRange) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(.writingDirection, value: direction, range: range)
        return attributedString
    }

    public func pt_verticalGlyphForm(_ form: Int, range: NSRange) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(.verticalGlyphForm, value: form, range: range)
        return attributedString
    }

    public func pt_lineSpacing(_ space: CGFloat, range: NSRange) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = space
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)
        return attributedString
    }
}
