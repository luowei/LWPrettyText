//
// LWPrettyTextSwift.swift
// LWPrettyText
//
// Created by luowei on 2017/3/7.
// Copyright (c) 2017 luowei. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

/// Main namespace for LWPrettyText Swift API
@available(iOS 13.0, *)
public enum LWPrettyTextSwift {

    /// Current version of the library
    public static let version = "1.0.0-swift"

    /// Creates a pretty text maker for building attributed strings
    /// - Parameters:
    ///   - string: The base string to apply attributes to
    ///   - range: The range to apply attributes (optional, defaults to full string)
    /// - Returns: A LWPrettyTextMaker instance for chaining attribute calls
    public static func make(
        _ string: String,
        range: NSRange? = nil
    ) -> LWPrettyTextMaker {
        let finalRange = range ?? NSRange(location: 0, length: string.count)
        return LWPrettyTextMaker(string: string, range: finalRange)
    }

    /// Creates a pretty text maker from an existing attributed string
    /// - Parameters:
    ///   - attributedString: The base attributed string
    ///   - range: The range to apply attributes (optional, defaults to full string)
    /// - Returns: A LWPrettyTextMaker instance for chaining attribute calls
    public static func make(
        _ attributedString: NSMutableAttributedString,
        range: NSRange? = nil
    ) -> LWPrettyTextMaker {
        let finalRange = range ?? NSRange(location: 0, length: attributedString.length)
        return LWPrettyTextMaker(attributedString: attributedString, range: finalRange)
    }
}

// MARK: - Convenience Functions

@available(iOS 13.0, *)
extension LWPrettyTextSwift {

    /// Creates an attributed string with a single color
    /// - Parameters:
    ///   - string: The text string
    ///   - color: The text color
    /// - Returns: An attributed string with the specified color
    public static func colored(_ string: String, color: UIColor) -> NSMutableAttributedString {
        return string.pt_color(color)
    }

    /// Creates an attributed string with a single font
    /// - Parameters:
    ///   - string: The text string
    ///   - font: The font to apply
    /// - Returns: An attributed string with the specified font
    public static func styled(_ string: String, font: UIFont) -> NSMutableAttributedString {
        return string.pt_font(font)
    }

    /// Creates an attributed string with both color and font
    /// - Parameters:
    ///   - string: The text string
    ///   - color: The text color
    ///   - font: The font to apply
    /// - Returns: An attributed string with the specified color and font
    public static func styled(
        _ string: String,
        color: UIColor,
        font: UIFont
    ) -> NSMutableAttributedString {
        return string.pt_color(color).pt_font(font)
    }

    /// Creates an underlined attributed string
    /// - Parameters:
    ///   - string: The text string
    ///   - style: The underline style
    ///   - color: The underline color (optional)
    /// - Returns: An attributed string with underline
    public static func underlined(
        _ string: String,
        style: NSUnderlineStyle = .single,
        color: UIColor? = nil
    ) -> NSMutableAttributedString {
        let attributed = string.pt_underlineStyle(style)
        if let color = color {
            return attributed.pt_underlineColor(color)
        }
        return attributed
    }

    /// Creates a strikethrough attributed string
    /// - Parameters:
    ///   - string: The text string
    ///   - style: The strikethrough style
    ///   - color: The strikethrough color (optional)
    /// - Returns: An attributed string with strikethrough
    public static func strikethrough(
        _ string: String,
        style: NSUnderlineStyle = .single,
        color: UIColor? = nil
    ) -> NSMutableAttributedString {
        let attributed = string.pt_strikethroughStyle(style)
        if let color = color {
            return attributed.pt_strikethroughColor(color)
        }
        return attributed
    }

    /// Creates an attributed string with line spacing
    /// - Parameters:
    ///   - string: The text string
    ///   - spacing: The line spacing value
    /// - Returns: An attributed string with line spacing
    public static func lineSpaced(_ string: String, spacing: CGFloat) -> NSMutableAttributedString {
        return string.pt_lineSpacing(spacing)
    }

    /// Creates an attributed string with kern (character spacing)
    /// - Parameters:
    ///   - string: The text string
    ///   - kern: The kern value
    /// - Returns: An attributed string with kern
    public static func kerned(_ string: String, kern: CGFloat) -> NSMutableAttributedString {
        return string.pt_kern(kern)
    }
}

// MARK: - AttributedString Operators

@available(iOS 13.0, *)
public extension NSMutableAttributedString {

    /// Appends another attributed string
    /// - Parameters:
    ///   - lhs: The left-hand attributed string
    ///   - rhs: The right-hand attributed string
    /// - Returns: A new attributed string with both concatenated
    static func + (lhs: NSMutableAttributedString, rhs: NSMutableAttributedString) -> NSMutableAttributedString {
        let result = NSMutableAttributedString(attributedString: lhs)
        result.append(rhs)
        return result
    }

    /// Appends a plain string
    /// - Parameters:
    ///   - lhs: The attributed string
    ///   - rhs: The plain string to append
    /// - Returns: A new attributed string with the string appended
    static func + (lhs: NSMutableAttributedString, rhs: String) -> NSMutableAttributedString {
        let result = NSMutableAttributedString(attributedString: lhs)
        result.append(NSAttributedString(string: rhs))
        return result
    }
}
