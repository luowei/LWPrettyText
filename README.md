# LWPrettyText

[![CI Status](https://img.shields.io/travis/luowei/LWPrettyText.svg?style=flat)](https://travis-ci.org/luowei/LWPrettyText)
[![Version](https://img.shields.io/cocoapods/v/LWPrettyText.svg?style=flat)](https://cocoapods.org/pods/LWPrettyText)
[![License](https://img.shields.io/cocoapods/l/LWPrettyText.svg?style=flat)](https://cocoapods.org/pods/LWPrettyText)
[![Platform](https://img.shields.io/cocoapods/p/LWPrettyText.svg?style=flat)](https://cocoapods.org/pods/LWPrettyText)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

LWPrettyText is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'LWPrettyText'
```

**Carthage**
```ruby
github "luowei/LWPrettyText"
```

## Usage

```OC
    // ---- label ---
    NSString *labelText = @"Do any additional setup after loading the view, typically from a nib.";
    NSMutableAttributedString *attLabelText = [labelText pt_color:[UIColor greenColor]];
    [attLabelText pt_backgroundColor:[UIColor brownColor]];

    [attLabelText pt_color:[UIColor redColor] range:NSMakeRange(3, 3)];

    NSRange range = [labelText rangeOfString:@"additional"];
    [attLabelText pt_color:[UIColor blueColor] range:range];

    self.label.attributedText = attLabelText;

    //---- textView ----
    NSString *text = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";

    NSString *subText = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu";
    NSRange subRange = [text rangeOfString:subText];
    NSMutableAttributedString *attText = [text pt_backgroundColor:[UIColor whiteColor] range:subRange];
    [attText pt_font:[UIFont systemFontOfSize:24] range:[subText rangeOfString:@"Lorem"] ];

    NSRange subRange2 = [text rangeOfString:@"consectetaur"];
    [attText pt_addAttributesWithRange:subRange2
                                 block:^(LWPrettyTextMaker *maker) {
                                     [maker pt_font:[UIFont systemFontOfSize:20]];
                                     [maker pt_color:[UIColor whiteColor]];
                                     [maker pt_backgroundColor:[UIColor blackColor]];
                                     [maker pt_writingDirection:@[@(NSWritingDirectionRightToLeft)]];
                                 }];

    [attText pt_addAttributesWithBlock:^(LWPrettyTextMaker *maker) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setFirstLineHeadIndent:40];
        [maker pt_paragraphStyle:paragraphStyle];
    }];

    self.textView.attributedText = attText;

    self.textField.attributedText = [@"aaaa bbbb cccc" pt_color:[UIColor greenColor] subString:@"bbbb"];


    //---- html ----
    NSString *html = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Test" ofType:@"html"] encoding:NSUTF8StringEncoding error:nil];
    self.textView.attributedText = [html HTMLAttributedString];
```

## Author

luowei, luowei@wodedata.com

## License

LWPrettyText is available under the MIT license. See the LICENSE file for more info.
