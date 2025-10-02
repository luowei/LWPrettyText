# LWPrettyText

[![CI Status](https://img.shields.io/travis/luowei/LWPrettyText.svg?style=flat)](https://travis-ci.org/luowei/LWPrettyText)
[![Version](https://img.shields.io/cocoapods/v/LWPrettyText.svg?style=flat)](https://cocoapods.org/pods/LWPrettyText)
[![License](https://img.shields.io/cocoapods/l/LWPrettyText.svg?style=flat)](https://cocoapods.org/pods/LWPrettyText)
[![Platform](https://img.shields.io/cocoapods/p/LWPrettyText.svg?style=flat)](https://cocoapods.org/pods/LWPrettyText)

## 简介

LWPrettyText 是一个优雅的 Objective-C 富文本（NSAttributedString）Category 组件库，让你可以用简洁的链式语法快速构建复杂的富文本样式。告别繁琐的 NSAttributedString 创建过程，让文本样式设置变得简单而优雅。

## 特性

- 链式调用语法，代码简洁易读
- 支持 NSString 和 NSMutableAttributedString 扩展
- 丰富的文本样式支持（颜色、字体、背景色、删除线、下划线等）
- 支持指定范围或子字符串的样式设置
- 支持 Block 语法批量设置多个属性
- 支持 HTML 字符串转富文本
- 完全兼容 iOS 8.0+

## 系统要求

- iOS 8.0 或更高版本
- Xcode 8.0 或更高版本

## 安装

### CocoaPods

LWPrettyText 可通过 [CocoaPods](https://cocoapods.org) 安装。在你的 Podfile 中添加以下内容：

```ruby
pod 'LWPrettyText'
```

然后运行：
```bash
pod install
```

### Carthage

在你的 Cartfile 中添加：

```ruby
github "luowei/LWPrettyText"
```

## 使用方法

### 导入头文件

```objective-c
#import <LWPrettyText/LWPrettyText.h>
```

### 基础用法

#### 1. UILabel 文本样式设置

```objective-c
// 创建基础富文本
NSString *labelText = @"Do any additional setup after loading the view, typically from a nib.";
NSMutableAttributedString *attLabelText = [labelText pt_color:[UIColor greenColor]];

// 链式调用设置背景色
[attLabelText pt_backgroundColor:[UIColor brownColor]];

// 设置指定范围的颜色
[attLabelText pt_color:[UIColor redColor] range:NSMakeRange(3, 3)];

// 设置子字符串的颜色
NSRange range = [labelText rangeOfString:@"additional"];
[attLabelText pt_color:[UIColor blueColor] range:range];

// 应用到 Label
self.label.attributedText = attLabelText;
```

#### 2. UITextView 复杂样式设置

```objective-c
NSString *text = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";

// 设置部分文本的背景色
NSString *subText = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu";
NSRange subRange = [text rangeOfString:subText];
NSMutableAttributedString *attText = [text pt_backgroundColor:[UIColor whiteColor] range:subRange];

// 设置特定单词的字体大小
[attText pt_font:[UIFont systemFontOfSize:24] range:[subText rangeOfString:@"Lorem"]];

// 使用 Block 批量设置多个属性
NSRange subRange2 = [text rangeOfString:@"consectetaur"];
[attText pt_addAttributesWithRange:subRange2
                             block:^(LWPrettyTextMaker *maker) {
                                 [maker pt_font:[UIFont systemFontOfSize:20]];
                                 [maker pt_color:[UIColor whiteColor]];
                                 [maker pt_backgroundColor:[UIColor blackColor]];
                                 [maker pt_writingDirection:@[@(NSWritingDirectionRightToLeft)]];
                             }];

// 设置段落样式
[attText pt_addAttributesWithBlock:^(LWPrettyTextMaker *maker) {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setFirstLineHeadIndent:40];
    [maker pt_paragraphStyle:paragraphStyle];
}];

self.textView.attributedText = attText;
```

#### 3. UITextField 子字符串样式设置

```objective-c
// 快速设置子字符串的颜色
self.textField.attributedText = [@"aaaa bbbb cccc" pt_color:[UIColor greenColor]
                                                  subString:@"bbbb"];
```

#### 4. HTML 字符串转富文本

```objective-c
NSString *html = [NSString stringWithContentsOfFile:[[NSBundle mainBundle]
                                                      pathForResource:@"Test"
                                                               ofType:@"html"]
                                           encoding:NSUTF8StringEncoding
                                              error:nil];
self.textView.attributedText = [html HTMLAttributedString];
```

### 支持的属性方法

#### NSString Category 和 NSMutableAttributedString Category

两个 Category 提供了相同的方法集，可以根据需要选择使用：

##### 基础文本属性

```objective-c
// 字体
- (NSMutableAttributedString *)pt_font:(UIFont *)font;
- (NSMutableAttributedString *)pt_font:(UIFont *)font range:(NSRange)range;
- (NSMutableAttributedString *)pt_font:(UIFont *)font subString:(NSString *)subString;

// 文本颜色
- (NSMutableAttributedString *)pt_color:(UIColor *)color;
- (NSMutableAttributedString *)pt_color:(UIColor *)color range:(NSRange)range;
- (NSMutableAttributedString *)pt_color:(UIColor *)color subString:(NSString *)subString;

// 背景颜色
- (NSMutableAttributedString *)pt_backgroundColor:(UIColor *)color;
- (NSMutableAttributedString *)pt_backgroundColor:(UIColor *)color range:(NSRange)range;
```

##### 文本装饰

```objective-c
// 删除线
- (NSMutableAttributedString *)pt_strikethroughStyle:(NSUnderlineStyle)style;
- (NSMutableAttributedString *)pt_strikethroughStyle:(NSUnderlineStyle)style range:(NSRange)range;
- (NSMutableAttributedString *)pt_strikethroughColor:(UIColor *)color;
- (NSMutableAttributedString *)pt_strikethroughColor:(UIColor *)color range:(NSRange)range;

// 下划线
- (NSMutableAttributedString *)pt_underlineStyle:(NSUnderlineStyle)style;
- (NSMutableAttributedString *)pt_underlineStyle:(NSUnderlineStyle)style range:(NSRange)range;
- (NSMutableAttributedString *)pt_underlineColor:(UIColor *)color;
- (NSMutableAttributedString *)pt_underlineColor:(UIColor *)color range:(NSRange)range;

// 描边
- (NSMutableAttributedString *)pt_strokeColor:(UIColor *)color;
- (NSMutableAttributedString *)pt_strokeColor:(UIColor *)color range:(NSRange)range;
- (NSMutableAttributedString *)pt_strokeWidth:(CGFloat)width;
- (NSMutableAttributedString *)pt_strokeWidth:(CGFloat)width range:(NSRange)range;
```

##### 字符间距和行距

```objective-c
// 字符间距
- (NSMutableAttributedString *)pt_kern:(NSInteger)space;
- (NSMutableAttributedString *)pt_kern:(NSInteger)space range:(NSRange)range;

// 行间距
- (NSMutableAttributedString *)pt_lineSpacing:(CGFloat)space;
- (NSMutableAttributedString *)pt_lineSpacing:(CGFloat)space range:(NSRange)range;

// 连字
- (NSMutableAttributedString *)pt_ligature:(BOOL)ligature;
- (NSMutableAttributedString *)pt_ligature:(BOOL)ligature range:(NSRange)range;
```

##### 高级属性

```objective-c
// 段落样式
- (NSMutableAttributedString *)pt_paragraphStyle:(NSParagraphStyle *)style;
- (NSMutableAttributedString *)pt_paragraphStyle:(NSParagraphStyle *)style range:(NSRange)range;

// 阴影
- (NSMutableAttributedString *)pt_shadow:(NSShadow *)shadow;
- (NSMutableAttributedString *)pt_shadow:(NSShadow *)shadow range:(NSRange)range;

// 文本效果
- (NSMutableAttributedString *)pt_textEffect:(NSString *)string;
- (NSMutableAttributedString *)pt_textEffect:(NSString *)string range:(NSRange)range;

// 附件（图片等）
- (NSMutableAttributedString *)pt_attachment:(NSTextAttachment *)attachment;
- (NSMutableAttributedString *)pt_attachment:(NSTextAttachment *)attachment range:(NSRange)range;

// 链接
- (NSMutableAttributedString *)pt_link:(NSURL *)url;
- (NSMutableAttributedString *)pt_link:(NSURL *)url range:(NSRange)range;

// 基线偏移
- (NSMutableAttributedString *)pt_baselineOffset:(CGFloat)offset;
- (NSMutableAttributedString *)pt_baselineOffset:(CGFloat)offset range:(NSRange)range;

// 倾斜
- (NSMutableAttributedString *)pt_obliqueness:(CGFloat)obliqueness;
- (NSMutableAttributedString *)pt_obliqueness:(CGFloat)obliqueness range:(NSRange)range;

// 扩展
- (NSMutableAttributedString *)pt_expansion:(CGFloat)expansion;
- (NSMutableAttributedString *)pt_expansion:(CGFloat)expansion range:(NSRange)range;

// 书写方向
- (NSMutableAttributedString *)pt_writingDirection:(NSArray<NSNumber *> *)direction;
- (NSMutableAttributedString *)pt_writingDirection:(NSArray<NSNumber *> *)direction range:(NSRange)range;

// 垂直字形
- (NSMutableAttributedString *)pt_verticalGlyphForm:(NSInteger)form;
- (NSMutableAttributedString *)pt_verticalGlyphForm:(NSInteger)form range:(NSRange)range;

// 自定义属性
- (NSMutableAttributedString *)pt_attribute:(NSString *)attributeName value:(id)value;
- (NSMutableAttributedString *)pt_attribute:(NSString *)attributeName value:(id)value range:(NSRange)range;
```

##### Block 批量设置

```objective-c
// 为整个字符串添加多个属性
- (NSMutableAttributedString *)pt_addAttributesWithBlock:(void(^)(LWPrettyTextMaker *maker))makerBlock;

// 为指定范围添加多个属性
- (NSMutableAttributedString *)pt_addAttributesWithRange:(NSRange)range
                                                   block:(void(^)(LWPrettyTextMaker *maker))makerBlock;
```

### LWPrettyTextMaker

`LWPrettyTextMaker` 是一个辅助类，用于在 Block 中批量设置属性：

```objective-c
[attText pt_addAttributesWithRange:range block:^(LWPrettyTextMaker *maker) {
    [maker pt_font:[UIFont boldSystemFontOfSize:18]];
    [maker pt_color:[UIColor redColor]];
    [maker pt_backgroundColor:[UIColor yellowColor]];
    [maker pt_kern:2];
    [maker pt_underlineStyle:NSUnderlineStyleSingle];
}];
```

### HTML 支持

```objective-c
@interface NSString (HTML)
- (NSMutableAttributedString *)HTMLAttributedString;
@end
```

可以将 HTML 字符串直接转换为富文本，支持基本的 HTML 标签样式。

## 示例项目

要运行示例项目：

1. 克隆仓库
2. 进入 Example 目录
3. 运行 `pod install`
4. 打开 `LWPrettyText.xcworkspace`
5. 运行项目查看效果

```bash
git clone https://github.com/luowei/LWPrettyText.git
cd LWPrettyText/Example
pod install
open LWPrettyText.xcworkspace
```

## 核心优势

### 1. 简洁的 API 设计

传统方式：
```objective-c
NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"Hello World"];
[attributedString addAttribute:NSForegroundColorAttributeName
                         value:[UIColor redColor]
                         range:NSMakeRange(0, 5)];
[attributedString addAttribute:NSFontAttributeName
                         value:[UIFont boldSystemFontOfSize:18]
                         range:NSMakeRange(0, 5)];
```

使用 LWPrettyText：
```objective-c
NSMutableAttributedString *attributedString = [@"Hello World" pt_color:[UIColor redColor]
                                                                  range:NSMakeRange(0, 5)];
[attributedString pt_font:[UIFont boldSystemFontOfSize:18] range:NSMakeRange(0, 5)];
```

### 2. 链式调用

```objective-c
NSMutableAttributedString *text = [string pt_color:[UIColor redColor]];
[text pt_font:[UIFont systemFontOfSize:16]];
[text pt_backgroundColor:[UIColor yellowColor]];
[text pt_underlineStyle:NSUnderlineStyleSingle];
```

### 3. 子字符串快速设置

```objective-c
// 无需手动计算 range
[@"Hello World" pt_color:[UIColor redColor] subString:@"World"];
```

### 4. Block 批量设置

```objective-c
[text pt_addAttributesWithBlock:^(LWPrettyTextMaker *maker) {
    [maker pt_font:[UIFont boldSystemFontOfSize:18]];
    [maker pt_color:[UIColor blueColor]];
    [maker pt_kern:2];
}];
```

## 注意事项

1. 所有方法都返回 `NSMutableAttributedString` 对象，支持链式调用
2. 使用 `range` 参数时，请确保范围有效，避免越界
3. 使用 `subString` 参数时，如果子字符串不存在，将不会应用任何样式
4. HTML 转富文本功能支持基础 HTML 标签，复杂样式可能需要额外处理

## 技术细节

### 架构设计

LWPrettyText 采用 Category 扩展方式，主要包含以下组件：

- **NSString+PrettyText**：为 NSString 提供富文本转换能力
- **NSMutableAttributedString+PrettyText**：为富文本对象提供链式设置能力
- **LWPrettyTextMaker**：属性构建器，用于 Block 语法的属性批量设置
- **NSString+HTML**：HTML 字符串转富文本支持

### 方法命名规范

- 所有方法以 `pt_` 前缀开头，避免命名冲突
- 提供无参数、带 range 和带 subString 三种重载形式
- 返回值统一为 `NSMutableAttributedString`，便于链式调用

## 性能考虑

- 方法内部使用 NSAttributedString 原生 API，性能与系统一致
- 避免不必要的对象创建和复制
- 建议对频繁使用的富文本进行缓存

## 常见问题

**Q: 为什么方法返回的是 NSMutableAttributedString 而不是 NSAttributedString？**

A: 返回可变类型是为了支持链式调用和进一步的修改。如果需要不可变类型，可以使用 `copy` 方法。

**Q: 如何为同一段文本设置多个不同范围的样式？**

A: 先创建一个基础富文本，然后多次调用不同的样式方法：
```objective-c
NSMutableAttributedString *text = [string pt_color:[UIColor blackColor]];
[text pt_color:[UIColor redColor] range:range1];
[text pt_font:[UIFont boldSystemFontOfSize:18] range:range2];
```

**Q: 是否支持 Swift？**

A: 支持。可以在 Swift 项目中通过桥接头文件使用，或者考虑使用 Swift 原生的富文本 API。

## 贡献

欢迎提交 Issue 和 Pull Request！

如果你发现 Bug 或有新功能建议，请：

1. Fork 本仓库
2. 创建你的特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交你的修改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启一个 Pull Request

## 作者

luowei - luowei@wodedata.com

## 许可证

LWPrettyText 使用 MIT 许可证。详见 [LICENSE](LICENSE) 文件。

## 相关链接

- [GitHub 仓库](https://github.com/luowei/LWPrettyText)
- [CocoaPods](https://cocoapods.org/pods/LWPrettyText)
- [示例项目](https://github.com/luowei/LWPrettyText/tree/master/Example)

## 更新日志

### 1.0.0
- 初始版本发布
- 支持基础富文本属性设置
- 支持链式调用
- 支持 Block 批量设置
- 支持 HTML 转富文本
- 完整的 API 文档

---

如果这个库对你有帮助，请给个 Star 支持一下！⭐️
