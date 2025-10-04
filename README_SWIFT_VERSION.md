# LWPrettyText Swift 版本使用说明

## 概述

`LWPrettyText_swift` 是 `LWPrettyText` 库的 Swift 子模块，包含了使用 Swift 编写的富文本构建组件。

## 安装

### 使用 Swift 版本

如果你的项目使用 Swift，可以安装 Swift 版本：

```ruby
pod 'LWPrettyText_swift'
```

### 使用 Objective-C 版本

如果你的项目使用 Objective-C，可以安装原版本：

```ruby
pod 'LWPrettyText'
```

### 同时使用两个版本

如果需要同时使用 Objective-C 和 Swift 版本：

```ruby
pod 'LWPrettyText'
pod 'LWPrettyText_swift'
```

## Swift 文件列表

本 Swift 子模块包含以下文件：

- `LWPrettyTextMaker.swift` - 富文本构建器
- `String+PrettyText.swift` - String 富文本扩展
- `NSMutableAttributedString+PrettyText.swift` - NSMutableAttributedString 扩展
- `String+HTML.swift` - HTML 字符串处理扩展
- `PrettyText.swift` - 富文本核心类
- `LWPrettyTextSwift.swift` - Swift 集成工具
- `PrettyTextExamples.swift` - 使用示例

## 特性

- 链式语法构建复杂的 NSAttributedString
- 简洁易读的 API
- 支持字体、颜色、行距、对齐等各种文本属性
- HTML 字符串转换支持
- Swift 友好的接口设计

## 版本要求

- iOS 8.0+
- Swift 5.0+

## 许可证

LWPrettyText_swift 使用 MIT 许可证。详情请参见 LICENSE 文件。
