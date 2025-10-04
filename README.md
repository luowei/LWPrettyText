# LWPrettyText

[![CI Status](https://img.shields.io/travis/luowei/LWPrettyText.svg?style=flat)](https://travis-ci.org/luowei/LWPrettyText)
[![Version](https://img.shields.io/cocoapods/v/LWPrettyText.svg?style=flat)](https://cocoapods.org/pods/LWPrettyText)
[![License](https://img.shields.io/cocoapods/l/LWPrettyText.svg?style=flat)](https://cocoapods.org/pods/LWPrettyText)
[![Platform](https://img.shields.io/cocoapods/p/LWPrettyText.svg?style=flat)](https://cocoapods.org/pods/LWPrettyText)

[English](./README.md) | [中文版](./README_ZH.md)

> An elegant Objective-C library for creating beautiful attributed strings with a clean, chainable API.

## Table of Contents

- [Swift Version](./README_SWIFT_VERSION.md)
- [Introduction](#introduction)
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Usage Examples](#usage-examples)
- [API Reference](#api-reference)
- [Advanced Examples](#advanced-usage-examples)
- [Architecture](#architecture)
- [Performance](#performance-considerations)
- [FAQ](#faq)
- [Contributing](#contributing)
- [License](#license)

## Introduction

LWPrettyText is an elegant Objective-C library for creating rich text (NSAttributedString) with a clean, chainable API. Say goodbye to verbose NSAttributedString creation code and make text styling simple and elegant.

## Features

- Chainable method syntax for clean, readable code
- Extensions for both NSString and NSMutableAttributedString
- Comprehensive text styling support (colors, fonts, backgrounds, strikethrough, underline, etc.)
- Range-based and substring-based styling
- Builder pattern with block syntax for batch attribute setting
- HTML string to attributed string conversion
- Full iOS 8.0+ compatibility

## Requirements

- iOS 8.0 or higher
- Xcode 8.0 or higher

## Installation

### CocoaPods

LWPrettyText is available through [CocoaPods](https://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'LWPrettyText'
```

Then run:
```bash
pod install
```

### Carthage

Add to your Cartfile:

```ruby
github "luowei/LWPrettyText"
```

## Quick Start

### Import the Framework

```objective-c
#import <LWPrettyText/LWPrettyText.h>
```

### Simple Example

```objective-c
// Create styled text in one line
NSMutableAttributedString *text = [@"Hello World" pt_color:[UIColor redColor]];
[text pt_font:[UIFont boldSystemFontOfSize:18]];

// Apply to label
label.attributedText = text;
```

## Usage Examples

### Basic Usage

#### 1. UILabel Text Styling

```objective-c
// Create basic attributed text
NSString *labelText = @"Do any additional setup after loading the view, typically from a nib.";
NSMutableAttributedString *attLabelText = [labelText pt_color:[UIColor greenColor]];

// Chain method calls to set background color
[attLabelText pt_backgroundColor:[UIColor brownColor]];

// Set color for specific range
[attLabelText pt_color:[UIColor redColor] range:NSMakeRange(3, 3)];

// Set color for substring
NSRange range = [labelText rangeOfString:@"additional"];
[attLabelText pt_color:[UIColor blueColor] range:range];

// Apply to label
self.label.attributedText = attLabelText;
```

#### 2. UITextView Complex Styling

```objective-c
NSString *text = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";

// Set background color for partial text
NSString *subText = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu";
NSRange subRange = [text rangeOfString:subText];
NSMutableAttributedString *attText = [text pt_backgroundColor:[UIColor whiteColor] range:subRange];

// Set font size for specific word
[attText pt_font:[UIFont systemFontOfSize:24] range:[subText rangeOfString:@"Lorem"]];

// Use builder pattern with block to set multiple attributes
NSRange subRange2 = [text rangeOfString:@"consectetaur"];
[attText pt_addAttributesWithRange:subRange2
                             block:^(LWPrettyTextMaker *maker) {
                                 [maker pt_font:[UIFont systemFontOfSize:20]];
                                 [maker pt_color:[UIColor whiteColor]];
                                 [maker pt_backgroundColor:[UIColor blackColor]];
                                 [maker pt_writingDirection:@[@(NSWritingDirectionRightToLeft)]];
                             }];

// Set paragraph style
[attText pt_addAttributesWithBlock:^(LWPrettyTextMaker *maker) {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setFirstLineHeadIndent:40];
    [maker pt_paragraphStyle:paragraphStyle];
}];

self.textView.attributedText = attText;
```

#### 3. UITextField Substring Styling

```objective-c
// Quick substring styling
self.textField.attributedText = [@"aaaa bbbb cccc" pt_color:[UIColor greenColor]
                                                  subString:@"bbbb"];
```

#### 4. HTML String to Attributed String

```objective-c
NSString *html = [NSString stringWithContentsOfFile:[[NSBundle mainBundle]
                                                      pathForResource:@"Test"
                                                               ofType:@"html"]
                                           encoding:NSUTF8StringEncoding
                                              error:nil];
self.textView.attributedText = [html HTMLAttributedString];
```

## Attributed String Features

LWPrettyText provides comprehensive support for all NSAttributedString features through clean, intuitive APIs. Every attribute supported by iOS's NSAttributedString is available with a simple, consistent interface.

### Text Attributes
- **Font** (`pt_font:`): Change font family, size, and weight
  - Supports all UIFont configurations
  - Perfect for mixing font styles in a single text
- **Foreground Color** (`pt_color:`): Set text color
  - Full UIColor support including custom colors
  - Alpha transparency supported
- **Background Color** (`pt_backgroundColor:`): Set text background/highlight color
  - Great for highlighting important text sections
  - Supports transparency for subtle highlights
- **Stroke** (`pt_strokeColor:`, `pt_strokeWidth:`): Apply text outline
  - Customize both stroke color and width
  - Positive width creates outlined text, negative creates filled text with outline
- **Shadow** (`pt_shadow:`): Add shadow effects to text
  - Control shadow offset, blur radius, and color
  - Create depth and visual hierarchy

### Text Decoration
- **Underline** (`pt_underlineStyle:`, `pt_underlineColor:`):
  - Multiple styles: single, double, thick, dotted, dashed
  - Custom underline colors independent of text color
  - Supports pattern combinations (e.g., dotted double underline)
- **Strikethrough** (`pt_strikethroughStyle:`, `pt_strikethroughColor:`):
  - Same style options as underline
  - Custom strikethrough colors
  - Perfect for showing deleted or invalid text
- **Link** (`pt_link:`): Make text tappable with URL support
  - Supports any NSURL (web links, app schemes, etc.)
  - Automatically handled by UITextView
  - Custom appearance can be controlled with other attributes

### Text Layout & Spacing
- **Kern** (`pt_kern:`): Adjust character spacing
  - Positive values increase spacing, negative values decrease
  - Fine-tune text density and readability
- **Line Spacing** (`pt_lineSpacing:`): Control space between lines
  - Set via pt_lineSpacing for quick adjustment
  - Or use paragraph style for more complex line spacing options
- **Paragraph Style** (`pt_paragraphStyle:`): Full paragraph formatting
  - Alignment (left, center, right, justified, natural)
  - First line head indent
  - Head and tail indent
  - Line break mode (word wrap, character wrap, truncation)
  - Minimum/maximum line height
  - Line height multiple
  - Paragraph spacing before and after
  - Hyphenation factor
- **Baseline Offset** (`pt_baselineOffset:`): Vertical text positioning
  - Positive values raise text (superscript effect)
  - Negative values lower text (subscript effect)
  - Perfect for mathematical formulas and footnotes
- **Ligature** (`pt_ligature:`): Control character ligatures
  - Enable/disable ligatures (connected characters like "fi", "fl")
  - Affects text appearance in certain fonts

### Advanced Typography
- **Text Effect** (`pt_textEffect:`): Apply special text effects
  - NSTextEffectLetterpressStyle for embossed appearance
  - iOS 7.0+ effect for premium, tactile look
- **Obliqueness** (`pt_obliqueness:`): Skew text for italic-like effect
  - Positive values slant right, negative values slant left
  - Range typically -1.0 to 1.0
  - Create faux italics for fonts without italic variants
- **Expansion** (`pt_expansion:`): Horizontally stretch or compress text
  - Positive values expand (wider letters)
  - Negative values compress (narrower letters)
  - Useful for fitting text or creating stylistic effects
- **Writing Direction** (`pt_writingDirection:`): Control text direction
  - Support for Right-to-Left (RTL) languages like Arabic, Hebrew
  - Support for Left-to-Right (LTR) languages
  - Embedding and override modes
- **Vertical Glyph Form** (`pt_verticalGlyphForm:`): Vertical text layout
  - Support for vertical text (Chinese, Japanese, Korean)
  - 0 for horizontal, 1 for vertical forms
- **Attachment** (`pt_attachment:`): Embed images and other content
  - NSTextAttachment for inline images
  - Custom content in text flow
  - Perfect for emoticons, icons, or inline media
- **Custom Attribute** (`pt_attribute:value:`): Set any custom attribute
  - Use any NSAttributedString attribute key
  - Support for custom attributes in your own text processing

## Builder Pattern

LWPrettyText implements the builder pattern through `LWPrettyTextMaker`, allowing you to batch-set multiple attributes in a clean, organized way:

### Basic Builder Usage

```objective-c
NSMutableAttributedString *text = [@"Hello World" pt_addAttributesWithBlock:^(LWPrettyTextMaker *maker) {
    [maker pt_font:[UIFont boldSystemFontOfSize:18]];
    [maker pt_color:[UIColor redColor]];
    [maker pt_backgroundColor:[UIColor yellowColor]];
    [maker pt_kern:2];
    [maker pt_underlineStyle:NSUnderlineStyleSingle];
}];
```

### Range-Specific Builder

```objective-c
[attText pt_addAttributesWithRange:NSMakeRange(0, 5)
                             block:^(LWPrettyTextMaker *maker) {
                                 [maker pt_font:[UIFont boldSystemFontOfSize:20]];
                                 [maker pt_color:[UIColor blueColor]];
                                 [maker pt_backgroundColor:[UIColor lightGrayColor]];
                                 [maker pt_underlineStyle:NSUnderlineStyleDouble];
                                 [maker pt_underlineColor:[UIColor redColor]];
                             }];
```

### Complex Styling Example

```objective-c
NSString *text = @"Build beautiful text with ease!";
NSMutableAttributedString *styled = [text pt_addAttributesWithBlock:^(LWPrettyTextMaker *maker) {
    // Font styling
    [maker pt_font:[UIFont systemFontOfSize:16]];

    // Color styling
    [maker pt_color:[UIColor darkGrayColor]];

    // Layout
    NSMutableParagraphStyle *para = [[NSMutableParagraphStyle alloc] init];
    para.alignment = NSTextAlignmentCenter;
    para.lineSpacing = 5;
    [maker pt_paragraphStyle:para];

    // Effects
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeMake(2, 2);
    shadow.shadowColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    [maker pt_shadow:shadow];
}];

// Add emphasis to specific word
NSRange range = [text rangeOfString:@"beautiful"];
[styled pt_addAttributesWithRange:range block:^(LWPrettyTextMaker *maker) {
    [maker pt_font:[UIFont boldSystemFontOfSize:18]];
    [maker pt_color:[UIColor orangeColor]];
    [maker pt_expansion:0.2]; // Slightly expand the text
}];
```

## Advanced Usage Examples

### 1. Superscript and Subscript Text

Perfect for mathematical formulas, chemical notations, or footnote references:

```objective-c
NSString *formula = @"E = mc2";
NSMutableAttributedString *styledFormula = [formula pt_font:[UIFont systemFontOfSize:18]];

// Make "2" superscript
NSRange superscriptRange = [formula rangeOfString:@"2"];
[styledFormula pt_baselineOffset:8 range:superscriptRange];
[styledFormula pt_font:[UIFont systemFontOfSize:12] range:superscriptRange];

// Or for chemical formulas like H2O
NSString *chemical = @"H2O";
NSMutableAttributedString *styledChemical = [chemical pt_font:[UIFont systemFontOfSize:18]];
NSRange subscriptRange = [chemical rangeOfString:@"2"];
[styledChemical pt_baselineOffset:-4 range:subscriptRange];
[styledChemical pt_font:[UIFont systemFontOfSize:12] range:subscriptRange];
```

### 2. Text with Outline/Stroke

Create eye-catching outlined text:

```objective-c
NSString *text = @"OUTLINED TEXT";
NSMutableAttributedString *outlined = [text pt_addAttributesWithBlock:^(LWPrettyTextMaker *maker) {
    [maker pt_font:[UIFont boldSystemFontOfSize:36]];
    [maker pt_strokeColor:[UIColor blackColor]];
    [maker pt_strokeWidth:3.0];  // Positive for outline only
    [maker pt_color:[UIColor whiteColor]];
}];

// Or filled text with outline
NSMutableAttributedString *filledOutline = [text pt_addAttributesWithBlock:^(LWPrettyTextMaker *maker) {
    [maker pt_font:[UIFont boldSystemFontOfSize:36]];
    [maker pt_strokeColor:[UIColor blackColor]];
    [maker pt_strokeWidth:-3.0];  // Negative for filled with outline
    [maker pt_color:[UIColor yellowColor]];
}];
```

### 3. Multiple Underline Styles

Demonstrate various underline options:

```objective-c
NSString *text = @"Single Underline\nDouble Underline\nThick Underline\nDotted Underline";
NSMutableAttributedString *styled = [[NSMutableAttributedString alloc] initWithString:text];

// Single underline
[styled pt_underlineStyle:NSUnderlineStyleSingle range:NSMakeRange(0, 16)];

// Double underline
[styled pt_underlineStyle:NSUnderlineStyleDouble range:NSMakeRange(17, 16)];

// Thick underline
[styled pt_underlineStyle:NSUnderlineStyleThick range:NSMakeRange(34, 15)];

// Dotted underline with custom color
NSRange dottedRange = NSMakeRange(50, 16);
[styled pt_underlineStyle:(NSUnderlineStyleSingle | NSUnderlinePatternDot) range:dottedRange];
[styled pt_underlineColor:[UIColor redColor] range:dottedRange];
```

### 4. Rich Text with Shadows

Add depth to your text with shadows:

```objective-c
NSString *text = @"Text with Shadow";
NSMutableAttributedString *shadowed = [text pt_addAttributesWithBlock:^(LWPrettyTextMaker *maker) {
    [maker pt_font:[UIFont boldSystemFontOfSize:24]];
    [maker pt_color:[UIColor whiteColor]];

    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeMake(3, 3);
    shadow.shadowBlurRadius = 5.0;
    shadow.shadowColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    [maker pt_shadow:shadow];
}];
```

### 5. Paragraph Formatting

Create beautifully formatted paragraphs:

```objective-c
NSString *paragraph = @"This is the first paragraph with proper formatting. It demonstrates how to use paragraph styles for professional text layout.\n\nThis is the second paragraph with different indentation and spacing.";

NSMutableAttributedString *formatted = [paragraph pt_addAttributesWithBlock:^(LWPrettyTextMaker *maker) {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];

    // Text alignment
    paragraphStyle.alignment = NSTextAlignmentJustified;

    // Line spacing
    paragraphStyle.lineSpacing = 4;

    // First line indent
    paragraphStyle.firstLineHeadIndent = 20;

    // Paragraph spacing
    paragraphStyle.paragraphSpacing = 12;

    // Line break mode
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;

    [maker pt_paragraphStyle:paragraphStyle];
    [maker pt_font:[UIFont systemFontOfSize:16]];
}];
```

### 6. Inline Images with Attachments

Embed images directly in your text:

```objective-c
NSString *text = @"This text has an inline image: ";
NSMutableAttributedString *textWithImage = [[NSMutableAttributedString alloc] initWithString:text];

// Create image attachment
NSTextAttachment *imageAttachment = [[NSTextAttachment alloc] init];
imageAttachment.image = [UIImage imageNamed:@"icon"];
imageAttachment.bounds = CGRectMake(0, -4, 20, 20);  // Adjust position and size

// Create attributed string from attachment
NSAttributedString *imageString = [NSAttributedString attributedStringWithAttachment:imageAttachment];
[textWithImage appendAttributedString:imageString];

// Continue with more text
NSAttributedString *moreText = [[NSAttributedString alloc] initWithString:@" and then more text."];
[textWithImage appendAttributedString:moreText];
```

### 7. Highlighted Search Results

Highlight search terms in text:

```objective-c
NSString *fullText = @"The quick brown fox jumps over the lazy dog. The fox is quick and brown.";
NSString *searchTerm = @"fox";
NSMutableAttributedString *highlighted = [fullText pt_font:[UIFont systemFontOfSize:16]];

// Find and highlight all occurrences
NSString *tempString = fullText;
NSRange searchRange = NSMakeRange(0, tempString.length);

while (searchRange.location != NSNotFound) {
    searchRange = [tempString rangeOfString:searchTerm options:NSCaseInsensitiveSearch range:searchRange];

    if (searchRange.location != NSNotFound) {
        [highlighted pt_backgroundColor:[UIColor yellowColor] range:searchRange];
        [highlighted pt_color:[UIColor blackColor] range:searchRange];

        // Move past this occurrence
        searchRange = NSMakeRange(searchRange.location + searchRange.length,
                                 tempString.length - (searchRange.location + searchRange.length));
    }
}
```

### 8. Price Display with Styling

Create attractive price displays:

```objective-c
NSString *priceText = @"$99.99";
NSMutableAttributedString *price = [priceText pt_addAttributesWithBlock:^(LWPrettyTextMaker *maker) {
    [maker pt_font:[UIFont boldSystemFontOfSize:36]];
    [maker pt_color:[UIColor redColor]];
}];

// Make the dollar sign and cents smaller
[price pt_font:[UIFont boldSystemFontOfSize:20] range:NSMakeRange(0, 1)];  // $
[price pt_baselineOffset:10 range:NSMakeRange(0, 1)];  // Raise $ sign

NSRange centsRange = NSMakeRange(priceText.length - 3, 3);  // .99
[price pt_font:[UIFont boldSystemFontOfSize:20] range:centsRange];
[price pt_baselineOffset:10 range:centsRange];  // Raise cents
```

### 9. Character Spacing and Expansion

Fine-tune text appearance:

```objective-c
NSString *text = @"SPACED OUT TEXT";
NSMutableAttributedString *spaced = [text pt_addAttributesWithBlock:^(LWPrettyTextMaker *maker) {
    [maker pt_font:[UIFont systemFontOfSize:20]];
    [maker pt_kern:5];  // Add 5 points between characters
}];

// Or expand the text horizontally
NSString *expanded = @"EXPANDED";
NSMutableAttributedString *wide = [expanded pt_addAttributesWithBlock:^(LWPrettyTextMaker *maker) {
    [maker pt_font:[UIFont boldSystemFontOfSize:24]];
    [maker pt_expansion:0.3];  // Expand by 30%
}];
```

### 10. Link Styling

Create custom-styled links:

```objective-c
NSString *text = @"Visit our website for more information.";
NSMutableAttributedString *linkedText = [text pt_font:[UIFont systemFontOfSize:16]];

// Add link to "website"
NSRange linkRange = [text rangeOfString:@"website"];
NSURL *url = [NSURL URLWithString:@"https://github.com/luowei/LWPrettyText"];
[linkedText pt_link:url range:linkRange];

// Customize link appearance
[linkedText pt_color:[UIColor blueColor] range:linkRange];
[linkedText pt_underlineStyle:NSUnderlineStyleSingle range:linkRange];

// Make sure to use UITextView with link detection enabled
// textView.editable = NO;
// textView.selectable = YES;
```

### 11. Oblique/Skewed Text

Create italic-like effects:

```objective-c
NSString *text = @"Skewed Text Effect";
NSMutableAttributedString *skewed = [text pt_addAttributesWithBlock:^(LWPrettyTextMaker *maker) {
    [maker pt_font:[UIFont systemFontOfSize:24]];
    [maker pt_obliqueness:0.3];  // Skew to the right
}];
```

### 12. Letterpress Effect

Add a subtle embossed look:

```objective-c
NSString *text = @"Letterpress Style";
NSMutableAttributedString *letterpress = [text pt_addAttributesWithBlock:^(LWPrettyTextMaker *maker) {
    [maker pt_font:[UIFont boldSystemFontOfSize:28]];
    [maker pt_color:[UIColor darkGrayColor]];
    [maker pt_textEffect:NSTextEffectLetterpressStyle];
}];
```

### 13. Multi-Language Support

Support for right-to-left languages:

```objective-c
NSString *arabicText = @"مرحبا بك";  // "Welcome" in Arabic
NSMutableAttributedString *rtlText = [arabicText pt_addAttributesWithBlock:^(LWPrettyTextMaker *maker) {
    [maker pt_font:[UIFont systemFontOfSize:18]];
    [maker pt_writingDirection:@[@(NSWritingDirectionRightToLeft | NSWritingDirectionOverride)]];
}];
```

### 14. Combined Effects - Title Card

Combine multiple attributes for impressive results:

```objective-c
NSString *title = @"PREMIUM CONTENT";
NSMutableAttributedString *titleCard = [title pt_addAttributesWithBlock:^(LWPrettyTextMaker *maker) {
    // Large, bold font
    [maker pt_font:[UIFont boldSystemFontOfSize:32]];

    // Gradient-like effect with stroke
    [maker pt_color:[UIColor whiteColor]];
    [maker pt_strokeColor:[UIColor blackColor]];
    [maker pt_strokeWidth:-2.0];

    // Add shadow for depth
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeMake(2, 2);
    shadow.shadowBlurRadius = 4.0;
    shadow.shadowColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    [maker pt_shadow:shadow];

    // Letter spacing
    [maker pt_kern:3];

    // Slight expansion
    [maker pt_expansion:0.1];
}];
```

## API Reference

### Overview

LWPrettyText provides two main categories with identical method signatures:
- `NSString+PrettyText`: Convert strings to attributed strings
- `NSMutableAttributedString+PrettyText`: Style existing attributed strings

All methods follow a consistent pattern with three variants:
- Apply to entire string: `pt_color:(UIColor *)color`
- Apply to range: `pt_color:(UIColor *)color range:(NSRange)range`
- Apply to substring: `pt_color:(UIColor *)color subString:(NSString *)subString`

### NSString Category Methods

Both `NSString` and `NSMutableAttributedString` categories provide the same method sets. You can use whichever is more convenient for your use case.

#### Basic Text Attributes

```objective-c
// Font
- (NSMutableAttributedString *)pt_font:(UIFont *)font;
- (NSMutableAttributedString *)pt_font:(UIFont *)font range:(NSRange)range;
- (NSMutableAttributedString *)pt_font:(UIFont *)font subString:(NSString *)subString;

// Text Color
- (NSMutableAttributedString *)pt_color:(UIColor *)color;
- (NSMutableAttributedString *)pt_color:(UIColor *)color range:(NSRange)range;
- (NSMutableAttributedString *)pt_color:(UIColor *)color subString:(NSString *)subString;

// Background Color
- (NSMutableAttributedString *)pt_backgroundColor:(UIColor *)color;
- (NSMutableAttributedString *)pt_backgroundColor:(UIColor *)color range:(NSRange)range;
```

#### Text Decoration

```objective-c
// Strikethrough
- (NSMutableAttributedString *)pt_strikethroughStyle:(NSUnderlineStyle)style;
- (NSMutableAttributedString *)pt_strikethroughStyle:(NSUnderlineStyle)style range:(NSRange)range;
- (NSMutableAttributedString *)pt_strikethroughColor:(UIColor *)color;
- (NSMutableAttributedString *)pt_strikethroughColor:(UIColor *)color range:(NSRange)range;

// Underline
- (NSMutableAttributedString *)pt_underlineStyle:(NSUnderlineStyle)style;
- (NSMutableAttributedString *)pt_underlineStyle:(NSUnderlineStyle)style range:(NSRange)range;
- (NSMutableAttributedString *)pt_underlineColor:(UIColor *)color;
- (NSMutableAttributedString *)pt_underlineColor:(UIColor *)color range:(NSRange)range;

// Stroke
- (NSMutableAttributedString *)pt_strokeColor:(UIColor *)color;
- (NSMutableAttributedString *)pt_strokeColor:(UIColor *)color range:(NSRange)range;
- (NSMutableAttributedString *)pt_strokeWidth:(CGFloat)width;
- (NSMutableAttributedString *)pt_strokeWidth:(CGFloat)width range:(NSRange)range;
```

#### Character and Line Spacing

```objective-c
// Character Spacing (Kerning)
- (NSMutableAttributedString *)pt_kern:(NSInteger)space;
- (NSMutableAttributedString *)pt_kern:(NSInteger)space range:(NSRange)range;

// Line Spacing
- (NSMutableAttributedString *)pt_lineSpacing:(CGFloat)space;
- (NSMutableAttributedString *)pt_lineSpacing:(CGFloat)space range:(NSRange)range;

// Ligature
- (NSMutableAttributedString *)pt_ligature:(BOOL)ligature;
- (NSMutableAttributedString *)pt_ligature:(BOOL)ligature range:(NSRange)range;
```

#### Advanced Attributes

```objective-c
// Paragraph Style
- (NSMutableAttributedString *)pt_paragraphStyle:(NSParagraphStyle *)style;
- (NSMutableAttributedString *)pt_paragraphStyle:(NSParagraphStyle *)style range:(NSRange)range;

// Shadow
- (NSMutableAttributedString *)pt_shadow:(NSShadow *)shadow;
- (NSMutableAttributedString *)pt_shadow:(NSShadow *)shadow range:(NSRange)range;

// Text Effect (e.g., NSTextEffectLetterpressStyle)
- (NSMutableAttributedString *)pt_textEffect:(NSString *)string;
- (NSMutableAttributedString *)pt_textEffect:(NSString *)string range:(NSRange)range;

// Attachment (Images, etc.)
- (NSMutableAttributedString *)pt_attachment:(NSTextAttachment *)attachment;
- (NSMutableAttributedString *)pt_attachment:(NSTextAttachment *)attachment range:(NSRange)range;

// Link
- (NSMutableAttributedString *)pt_link:(NSURL *)url;
- (NSMutableAttributedString *)pt_link:(NSURL *)url range:(NSRange)range;

// Baseline Offset (Superscript/Subscript)
- (NSMutableAttributedString *)pt_baselineOffset:(CGFloat)offset;
- (NSMutableAttributedString *)pt_baselineOffset:(CGFloat)offset range:(NSRange)range;

// Obliqueness (Skew)
- (NSMutableAttributedString *)pt_obliqueness:(CGFloat)obliqueness;
- (NSMutableAttributedString *)pt_obliqueness:(CGFloat)obliqueness range:(NSRange)range;

// Expansion (Horizontal stretch/compression)
- (NSMutableAttributedString *)pt_expansion:(CGFloat)expansion;
- (NSMutableAttributedString *)pt_expansion:(CGFloat)expansion range:(NSRange)range;

// Writing Direction
- (NSMutableAttributedString *)pt_writingDirection:(NSArray<NSNumber *> *)direction;
- (NSMutableAttributedString *)pt_writingDirection:(NSArray<NSNumber *> *)direction range:(NSRange)range;

// Vertical Glyph Form
- (NSMutableAttributedString *)pt_verticalGlyphForm:(NSInteger)form;
- (NSMutableAttributedString *)pt_verticalGlyphForm:(NSInteger)form range:(NSRange)range;

// Custom Attribute
- (NSMutableAttributedString *)pt_attribute:(NSString *)attributeName value:(id)value;
- (NSMutableAttributedString *)pt_attribute:(NSString *)attributeName value:(id)value range:(NSRange)range;
```

#### Builder Pattern Methods

```objective-c
// Add multiple attributes for entire string
- (NSMutableAttributedString *)pt_addAttributesWithBlock:(void(^)(LWPrettyTextMaker *maker))makerBlock;

// Add multiple attributes for specific range
- (NSMutableAttributedString *)pt_addAttributesWithRange:(NSRange)range
                                                   block:(void(^)(LWPrettyTextMaker *maker))makerBlock;
```

### LWPrettyTextMaker Methods

The `LWPrettyTextMaker` class provides the same attribute methods as the categories, designed for use within builder blocks:

```objective-c
@interface LWPrettyTextMaker : NSObject

@property(nonatomic, strong, readonly) NSMutableAttributedString *prettyText;
@property(nonatomic) NSRange range;
@property(nonatomic, strong) NSMutableAttributedString *attributedString;
@property(nonatomic, strong) NSMutableDictionary<NSString *,id> *attributes;

// Initialization
- (instancetype)initWithString:(NSString *)string range:(NSRange)range;
- (instancetype)initWithAttributedString:(NSMutableAttributedString *)attributedString range:(NSRange)range;

// All attribute methods (same as category methods)
- (LWPrettyTextMaker *)pt_attribute:(NSString *)attributeName value:(id)value;
- (LWPrettyTextMaker *)pt_paragraphStyle:(NSParagraphStyle *)style;
- (LWPrettyTextMaker *)pt_font:(UIFont *)font;
- (LWPrettyTextMaker *)pt_color:(UIColor *)color;
- (LWPrettyTextMaker *)pt_backgroundColor:(UIColor *)color;
- (LWPrettyTextMaker *)pt_ligature:(BOOL)ligature;
- (LWPrettyTextMaker *)pt_kern:(NSInteger)space;
- (LWPrettyTextMaker *)pt_strikethroughStyle:(NSUnderlineStyle)style;
- (LWPrettyTextMaker *)pt_strikethroughColor:(UIColor *)color;
- (LWPrettyTextMaker *)pt_underlineStyle:(NSUnderlineStyle)style;
- (LWPrettyTextMaker *)pt_underlineColor:(UIColor *)color;
- (LWPrettyTextMaker *)pt_strokeColor:(UIColor *)color;
- (LWPrettyTextMaker *)pt_strokeWidth:(CGFloat)width;
- (LWPrettyTextMaker *)pt_shadow:(NSShadow *)shadow;
- (LWPrettyTextMaker *)pt_textEffect:(NSString *)string;
- (LWPrettyTextMaker *)pt_attachment:(NSTextAttachment *)attachment;
- (LWPrettyTextMaker *)pt_link:(NSURL *)url;
- (LWPrettyTextMaker *)pt_baselineOffset:(CGFloat)offset;
- (LWPrettyTextMaker *)pt_obliqueness:(CGFloat)obliqueness;
- (LWPrettyTextMaker *)pt_expansion:(CGFloat)expansion;
- (LWPrettyTextMaker *)pt_writingDirection:(NSArray<NSNumber *> *)direction;
- (LWPrettyTextMaker *)pt_verticalGlyphForm:(NSInteger)form;
- (LWPrettyTextMaker *)pt_lineSpacing:(CGFloat)space;

@end
```

### HTML Support

```objective-c
@interface NSString (HTML)
- (NSMutableAttributedString *)HTMLAttributedString;
@end
```

Convert HTML strings to attributed strings with support for basic HTML tag styling.

## Example Project

To run the example project:

1. Clone the repo
2. Navigate to the Example directory
3. Run `pod install`
4. Open `LWPrettyText.xcworkspace`
5. Run the project to see examples

```bash
git clone https://github.com/luowei/LWPrettyText.git
cd LWPrettyText/Example
pod install
open LWPrettyText.xcworkspace
```

## Why Choose LWPrettyText?

### Clean and Intuitive API

**Traditional NSAttributedString approach:**
```objective-c
NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"Hello World"];
[text addAttribute:NSForegroundColorAttributeName
             value:[UIColor redColor]
             range:NSMakeRange(0, 5)];
[text addAttribute:NSFontAttributeName
             value:[UIFont boldSystemFontOfSize:18]
             range:NSMakeRange(0, 5)];
```

**With LWPrettyText:**
```objective-c
NSMutableAttributedString *text = [@"Hello World" pt_color:[UIColor redColor]
                                                     range:NSMakeRange(0, 5)];
[text pt_font:[UIFont boldSystemFontOfSize:18] range:NSMakeRange(0, 5)];
```

### Key Advantages

#### 1. Chainable Method Calls
```objective-c
NSMutableAttributedString *text = [string pt_color:[UIColor redColor]];
[text pt_font:[UIFont systemFontOfSize:16]];
[text pt_backgroundColor:[UIColor yellowColor]];
[text pt_underlineStyle:NSUnderlineStyleSingle];
```

#### 2. Automatic Range Calculation
```objective-c
// No need to manually calculate ranges
[@"Hello World" pt_color:[UIColor redColor] subString:@"World"];
```

#### 3. Builder Pattern Support
```objective-c
[text pt_addAttributesWithBlock:^(LWPrettyTextMaker *maker) {
    [maker pt_font:[UIFont boldSystemFontOfSize:18]];
    [maker pt_color:[UIColor blueColor]];
    [maker pt_kern:2];
}];
```

#### 4. Comprehensive Attribute Support
- All NSAttributedString attributes available
- Consistent API across all attributes
- Range and substring variants for every method

## Best Practices

### Tips for Using LWPrettyText

1. **Use builder pattern for complex styling**: When applying multiple attributes, the builder pattern keeps code organized and readable.

2. **Cache frequently-used styled strings**: If you use the same styled text repeatedly, create it once and reuse it.

3. **Validate ranges**: When using range-based methods, ensure ranges are valid to avoid crashes.

4. **Combine with UITextView**: For interactive features like links, use UITextView with appropriate settings:
   ```objective-c
   textView.editable = NO;
   textView.selectable = YES;
   textView.dataDetectorTypes = UIDataDetectorTypeLink;
   ```

### Common Patterns

#### Highlighting Search Results
```objective-c
NSString *searchTerm = @"search";
NSMutableAttributedString *text = [fullText pt_font:[UIFont systemFontOfSize:16]];
NSRange range = [fullText rangeOfString:searchTerm options:NSCaseInsensitiveSearch];
if (range.location != NSNotFound) {
    [text pt_backgroundColor:[UIColor yellowColor] range:range];
}
```

#### Creating Headers
```objective-c
NSMutableAttributedString *header = [@"Section Title" pt_addAttributesWithBlock:^(LWPrettyTextMaker *maker) {
    [maker pt_font:[UIFont boldSystemFontOfSize:24]];
    [maker pt_color:[UIColor darkGrayColor]];

    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = NSTextAlignmentCenter;
    [maker pt_paragraphStyle:style];
}];
```

## Important Notes

**Safety Guidelines:**
- All methods return `NSMutableAttributedString` for method chaining
- Range parameters must be valid; invalid ranges will cause crashes
- Substring styling is ignored if the substring doesn't exist in the text
- HTML conversion supports basic tags; complex HTML may need preprocessing

**Compatibility:**
- Fully compatible with standard UIKit text views (UILabel, UITextView, UITextField)
- All NSAttributedString attributes are supported
- iOS 8.0+ required

## Architecture

### Component Overview

LWPrettyText is built using Objective-C Category extensions, providing a clean and non-invasive way to add rich text functionality:

```
LWPrettyText
├── NSString+PrettyText
│   └── Converts plain strings to attributed strings
├── NSMutableAttributedString+PrettyText
│   └── Adds chainable styling methods to attributed strings
├── LWPrettyTextMaker
│   └── Builder pattern implementation for batch attribute setting
└── NSString+HTML
    └── HTML to attributed string conversion
```

### Design Principles

**1. Category-Based Architecture**
- Non-invasive extension of Foundation classes
- No subclassing required
- Works seamlessly with existing code

**2. Naming Conventions**
- All methods prefixed with `pt_` to avoid namespace conflicts
- Consistent method signatures across categories
- Three method variants: base, with range, with substring

**3. Return Value Pattern**
- All methods return `NSMutableAttributedString`
- Enables method chaining
- Supports both immediate use and further modification

### Internal Implementation

```objective-c
// Example: How pt_color works internally
- (NSMutableAttributedString *)pt_color:(UIColor *)color range:(NSRange)range {
    NSMutableAttributedString *attributedString = [self mutableCopy];
    [attributedString addAttribute:NSForegroundColorAttributeName
                             value:color
                             range:range];
    return attributedString;
}
```

## Performance Considerations

### Optimization Tips

**1. Native API Usage**
- All methods use Foundation's NSAttributedString APIs
- No custom rendering or text processing
- Performance identical to manual NSAttributedString creation

**2. Memory Management**
- Methods create new instances when converting from NSString
- Returns mutable copies to enable chaining
- Consider caching for frequently-used styled strings

**3. Best Practices**
```objective-c
// Good: Create once, reuse many times
static NSMutableAttributedString *cachedTitle = nil;
if (!cachedTitle) {
    cachedTitle = [@"Title" pt_font:[UIFont boldSystemFontOfSize:18]];
}
label.attributedText = [cachedTitle copy];

// Avoid: Creating styled strings repeatedly in loops
for (int i = 0; i < 1000; i++) {
    // This is inefficient
    cell.textLabel.attributedText = [text pt_color:[UIColor redColor]];
}
```

### Performance Metrics

- **Attribute Setting**: O(1) - Direct dictionary insertion
- **Range Calculation**: O(n) - Linear search for substring matching
- **Builder Pattern**: O(k) - Where k is number of attributes set
- **HTML Conversion**: O(n) - Depends on HTML complexity

## FAQ

### General Questions

**Q: Why return NSMutableAttributedString instead of NSAttributedString?**

A: Returning mutable types enables method chaining and allows further modifications. If you need an immutable attributed string, simply call the `copy` method on the result:
```objective-c
NSAttributedString *immutableText = [[text pt_color:[UIColor redColor]] copy];
```

**Q: How do I style different ranges of the same text differently?**

A: Create a base attributed string first, then apply different styling methods to different ranges:
```objective-c
NSMutableAttributedString *text = [string pt_color:[UIColor blackColor]];
[text pt_color:[UIColor redColor] range:range1];
[text pt_font:[UIFont boldSystemFontOfSize:18] range:range2];
[text pt_backgroundColor:[UIColor yellowColor] subString:@"important"];
```

**Q: Can I use LWPrettyText with Swift?**

A: Yes! LWPrettyText works in Swift projects through Objective-C bridging headers:
```swift
// In your bridging header
#import <LWPrettyText/LWPrettyText.h>

// In Swift code
let text = "Hello World".pt_color(.red)
text.pt_font(UIFont.boldSystemFont(ofSize: 18))
```
Alternatively, consider using Swift's native AttributedString APIs (iOS 15+) for pure Swift projects.

### Technical Questions

**Q: What happens if I use a substring that doesn't exist in the text?**

A: The method safely returns without applying any styling. No exception is thrown:
```objective-c
// This won't crash, but won't apply any styling either
[@"Hello World" pt_color:[UIColor redColor] subString:@"Goodbye"];
```

**Q: Can I combine LWPrettyText with standard NSAttributedString methods?**

A: Absolutely! LWPrettyText methods return standard `NSMutableAttributedString` objects, so you can mix and match:
```objective-c
NSMutableAttributedString *text = [@"Hello" pt_color:[UIColor redColor]];
[text addAttribute:NSKernAttributeName value:@2 range:NSMakeRange(0, 5)];
[text pt_font:[UIFont systemFontOfSize:16]];
```

**Q: Is there any performance overhead compared to using NSAttributedString directly?**

A: No significant overhead. LWPrettyText methods are thin wrappers around NSAttributedString's native APIs. The slight additional cost is method dispatch, which is negligible.

**Q: How do I handle dynamic text where ranges change?**

A: Use the substring-based methods instead of range-based methods:
```objective-c
// Good: Automatically finds the range
[text pt_color:[UIColor redColor] subString:searchTerm];

// Avoid: Manual range calculation when text changes
NSRange range = [text.string rangeOfString:searchTerm];
[text pt_color:[UIColor redColor] range:range];
```

### Compatibility Questions

**Q: What iOS versions are supported?**

A: LWPrettyText supports iOS 8.0 and later. All features work consistently across supported versions.

**Q: Does it work with Interface Builder?**

A: LWPrettyText is a runtime library for creating attributed strings programmatically. It doesn't integrate with Interface Builder's visual editor. You can apply styled strings to IB outlets in your code.

**Q: Can I use LWPrettyText in UITableViewCell or UICollectionViewCell?**

A: Yes! Just apply attributed strings to labels as usual:
```objective-c
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.attributedText = [data[indexPath.row] pt_color:[UIColor blueColor]];
    return cell;
}
```

## Contributing

We welcome contributions from the community! Whether you've found a bug, have a feature request, or want to contribute code, your input is valuable.

### How to Contribute

1. **Fork the repository** on GitHub
2. **Create a feature branch** from `master`:
   ```bash
   git checkout -b feature/amazing-feature
   ```
3. **Make your changes** with clear, descriptive commits:
   ```bash
   git commit -m 'Add support for custom text effects'
   ```
4. **Write or update tests** if applicable
5. **Push to your fork**:
   ```bash
   git push origin feature/amazing-feature
   ```
6. **Open a Pull Request** with a clear description of your changes

### Reporting Issues

When reporting bugs, please include:
- iOS version and device information
- Xcode version
- Steps to reproduce the issue
- Expected vs. actual behavior
- Code samples if applicable

### Feature Requests

We love hearing your ideas! When requesting features:
- Explain the use case clearly
- Describe how it would improve the library
- Provide examples if possible

### Code Style

- Follow existing Objective-C coding conventions
- Use meaningful variable and method names
- Add comments for complex logic
- Keep methods focused and concise

## Support

- **Issues**: [GitHub Issues](https://github.com/luowei/LWPrettyText/issues)
- **Documentation**: This README and inline code documentation
- **Examples**: Check the Example project for comprehensive usage examples

## Author

**Luo Wei**
- Email: luowei@wodedata.com
- GitHub: [@luowei](https://github.com/luowei)

## License

LWPrettyText is released under the **MIT License**. See the [LICENSE](LICENSE) file for details.

```
MIT License

Copyright (c) 2025 Luo Wei

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## Acknowledgments

- Thanks to all contributors who have helped improve this library
- Inspired by the need for cleaner attributed string APIs in iOS development
- Built with love for the iOS developer community

---

**If you find LWPrettyText helpful, please consider giving it a star on GitHub!** ⭐️
