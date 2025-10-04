//
// String+HTML.swift
// LWPrettyText
//
// Created by luowei on 2017/3/8.
// Copyright (c) 2017 luowei. All rights reserved.
//
// Adding text link handling reference:
// Create tap-able "links" in the NSAttributedText of a UILabel?
// http://stackoverflow.com/questions/1256887/create-tap-able-links-in-the-nsattributedtext-of-a-uilabel
//

import UIKit

@available(iOS 13.0, *)
extension String {

    /// Converts HTML string to NSMutableAttributedString
    /// - Returns: An attributed string created from the HTML content, or nil if conversion fails
    public func htmlAttributedString() -> NSMutableAttributedString? {
        guard let data = self.data(using: .utf8) else {
            return nil
        }

        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]

        var attributedString: NSMutableAttributedString?

        if Thread.isMainThread {
            do {
                attributedString = try NSMutableAttributedString(
                    data: data,
                    options: options,
                    documentAttributes: nil
                )
            } catch {
                print("Error creating attributedString from HTML: \(error.localizedDescription)")
            }
        } else {
            DispatchQueue.main.async {
                do {
                    attributedString = try NSMutableAttributedString(
                        data: data,
                        options: options,
                        documentAttributes: nil
                    )
                } catch {
                    print("Error creating attributedString from HTML: \(error.localizedDescription)")
                }
            }
        }

        return attributedString
    }

    /// Converts HTML string to NSMutableAttributedString asynchronously
    /// - Parameter completion: Completion handler called with the resulting attributed string
    public func htmlAttributedString(completion: @escaping (NSMutableAttributedString?) -> Void) {
        guard let data = self.data(using: .utf8) else {
            completion(nil)
            return
        }

        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]

        DispatchQueue.main.async {
            do {
                let attributedString = try NSMutableAttributedString(
                    data: data,
                    options: options,
                    documentAttributes: nil
                )
                completion(attributedString)
            } catch {
                print("Error creating attributedString from HTML: \(error.localizedDescription)")
                completion(nil)
            }
        }
    }
}
