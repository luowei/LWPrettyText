# Graph Report - /Users/luowei/projects/libs/LWPrettyText  (2026-05-04)

## Corpus Check
- Corpus is ~12,950 words - fits in a single context window. You may not need a graph.

## Summary
- 268 nodes · 271 edges · 13 communities detected
- Extraction: 100% EXTRACTED · 0% INFERRED · 0% AMBIGUOUS
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- [[_COMMUNITY_Community 0|Community 0]]
- [[_COMMUNITY_Community 1|Community 1]]
- [[_COMMUNITY_Community 2|Community 2]]
- [[_COMMUNITY_Community 3|Community 3]]
- [[_COMMUNITY_Community 4|Community 4]]
- [[_COMMUNITY_Community 5|Community 5]]
- [[_COMMUNITY_Community 6|Community 6]]
- [[_COMMUNITY_Community 7|Community 7]]
- [[_COMMUNITY_Community 8|Community 8]]
- [[_COMMUNITY_Community 9|Community 9]]
- [[_COMMUNITY_Community 10|Community 10]]
- [[_COMMUNITY_Community 11|Community 11]]
- [[_COMMUNITY_Community 12|Community 12]]

## God Nodes (most connected - your core abstractions)
1. `NSMutableAttributedString` - 54 edges
2. `LWPrettyTextMaker` - 53 edges
3. `NSString` - 51 edges
4. `String` - 25 edges
5. `PrettyTextExamples` - 14 edges
6. `LWPrettyTextSwift` - 8 edges
7. `LWAppDelegate` - 7 edges
8. `AttributedText` - 5 edges
9. `Tests` - 4 edges
10. `PrettyTextModifier` - 4 edges

## Surprising Connections (you probably didn't know these)
- None detected - all connections are within the same source files.

## Communities (22 total, 4 thin omitted)

### Community 0 - "Community 0"
Cohesion: 0.04
Nodes (29): NSMutableAttributedString, -pt_addAttributesWithBlock, -pt_addAttributesWithRangeblock, -pt_attachmentrange, -pt_attributevalue, -pt_attributevaluerange, -pt_backgroundColorrange, -pt_baselineOffsetrange (+21 more)

### Community 1 - "Community 1"
Cohesion: 0.05
Nodes (27): LWPrettyTextMaker, -initWithAttributedStringrange, -initWithStringrange, -prettyText, -pt_attachment, -pt_attributevalue, -pt_backgroundColor, -pt_baselineOffset (+19 more)

### Community 2 - "Community 2"
Cohesion: 0.04
Nodes (51): NSString, -pt_addAttributesWithBlock, -pt_addAttributesWithRangeblock, -pt_attachment, -pt_attachmentrange, -pt_attributevalue, -pt_attributevaluerange, -pt_backgroundColor (+43 more)

### Community 4 - "Community 4"
Cohesion: 0.12
Nodes (9): AttributedText, PrettyText, PrettyTextBuilder, PrettyTextModifier, View, PrettyTextExamplesView, UIViewRepresentable, View (+1 more)

### Community 5 - "Community 5"
Cohesion: 0.12
Nodes (3): PrettyTextExamples, PrettyTextExamplesView_Previews, PreviewProvider

### Community 7 - "Community 7"
Cohesion: 0.25
Nodes (7): LWAppDelegate, -applicationDidBecomeActive, -applicationDidEnterBackground, -applicationdidFinishLaunchingWithOptions, -applicationWillEnterForeground, -applicationWillResignActive, -applicationWillTerminate

### Community 8 - "Community 8"
Cohesion: 0.4
Nodes (4): Tests, -setUp, -tearDown, -testExample

### Community 9 - "Community 9"
Cohesion: 0.5
Nodes (3): SecondViewController, -didReceiveMemoryWarning, -viewDidLoad

### Community 10 - "Community 10"
Cohesion: 0.5
Nodes (3): LWViewController, -didReceiveMemoryWarning, -viewDidLoad

## Knowledge Gaps
- **118 isolated node(s):** `-setUp`, `-tearDown`, `-testExample`, `-applicationdidFinishLaunchingWithOptions`, `-applicationWillResignActive` (+113 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **4 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What connects `-setUp`, `-tearDown`, `-testExample` to the rest of the system?**
  _118 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Community 0` be split into smaller, more focused modules?**
  _Cohesion score 0.04 - nodes in this community are weakly interconnected._
- **Should `Community 1` be split into smaller, more focused modules?**
  _Cohesion score 0.05 - nodes in this community are weakly interconnected._
- **Should `Community 2` be split into smaller, more focused modules?**
  _Cohesion score 0.04 - nodes in this community are weakly interconnected._
- **Should `Community 3` be split into smaller, more focused modules?**
  _Cohesion score 0.08 - nodes in this community are weakly interconnected._
- **Should `Community 4` be split into smaller, more focused modules?**
  _Cohesion score 0.12 - nodes in this community are weakly interconnected._
- **Should `Community 5` be split into smaller, more focused modules?**
  _Cohesion score 0.12 - nodes in this community are weakly interconnected._