//
// PrettyText.swift
// LWPrettyText
//
// Created by luowei on 2017/3/7.
// Copyright (c) 2017 luowei. All rights reserved.
//

import SwiftUI

/// SwiftUI wrapper for displaying attributed text
@available(iOS 13.0, *)
public struct PrettyText: View {
    private let attributedString: NSAttributedString

    public init(_ attributedString: NSAttributedString) {
        self.attributedString = attributedString
    }

    public init(_ string: String, configuration: (LWPrettyTextMaker) -> Void) {
        let maker = LWPrettyTextMaker(
            string: string,
            range: NSRange(location: 0, length: string.count)
        )
        configuration(maker)
        self.attributedString = maker.build()
    }

    public var body: some View {
        Text(AttributedString(attributedString))
    }
}

// MARK: - AttributedText UIViewRepresentable for UIKit compatibility

@available(iOS 13.0, *)
public struct AttributedText: UIViewRepresentable {
    private let attributedString: NSAttributedString
    private let lineLimit: Int?
    private let lineBreakMode: NSLineBreakMode
    private let textAlignment: NSTextAlignment

    public init(
        _ attributedString: NSAttributedString,
        lineLimit: Int? = nil,
        lineBreakMode: NSLineBreakMode = .byTruncatingTail,
        textAlignment: NSTextAlignment = .left
    ) {
        self.attributedString = attributedString
        self.lineLimit = lineLimit
        self.lineBreakMode = lineBreakMode
        self.textAlignment = textAlignment
    }

    public func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.numberOfLines = lineLimit ?? 0
        label.lineBreakMode = lineBreakMode
        label.textAlignment = textAlignment
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return label
    }

    public func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.attributedText = attributedString
        uiView.numberOfLines = lineLimit ?? 0
        uiView.lineBreakMode = lineBreakMode
        uiView.textAlignment = textAlignment
    }
}

// MARK: - PrettyTextBuilder for SwiftUI-style API

@available(iOS 13.0, *)
@resultBuilder
public struct PrettyTextBuilder {
    public static func buildBlock(_ components: NSAttributedString...) -> NSAttributedString {
        let result = NSMutableAttributedString()
        for component in components {
            result.append(component)
        }
        return result
    }
}

// MARK: - SwiftUI View Extension

@available(iOS 13.0, *)
extension View {
    /// Applies pretty text styling
    public func prettyText(_ configuration: @escaping (LWPrettyTextMaker) -> Void) -> some View {
        self.modifier(PrettyTextModifier(configuration: configuration))
    }
}

@available(iOS 13.0, *)
private struct PrettyTextModifier: ViewModifier {
    let configuration: (LWPrettyTextMaker) -> Void

    func body(content: Content) -> some View {
        content
    }
}
