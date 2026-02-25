---
name: swiftui-patterns
description: 現代 SwiftUI 架構模式。包含 @Observable 狀態管理、組件組合、型別安全導航與渲染效能優化。
---

# Modern SwiftUI Patterns

此技能提供建構宣告式、高效能 Apple 平台 UI 的最佳實踐。

## 狀態管理指南
- **@Observable**: 取代舊有的 ObservableObject，實現屬性級別的精確渲染追蹤。
- **Property Wrappers**: 根據 Ownership 選擇最簡單的 Wrapper（@State, @Binding, @Environment）。

## 效能優化
- **提取子視圖**: 將視圖拆分為小型的 Struct 以縮小失效範圍 (Invalidation)。
- **Lazy 容器**: 對於大型列表，務必使用 `LazyVStack` 與穩定 ID。
- **.task**: 使用 `.task` 處理非同步工作，支援視圖消失時自動取消。

---
*註：嚴禁在 View 的 `body` 內執行任何高成本計算或網路請求。*
