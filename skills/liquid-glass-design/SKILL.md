---
name: liquid-glass-design
description: iOS 26 Liquid Glass 設計系統模式。涵蓋 SwiftUI 與 UIKit 中的毛玻璃材質、互動反射、變形過渡 (Morphing) 與元件整合。
---

# Liquid Glass Design System (iOS 26)

此技能定義了 iOS 26 全新 Liquid Glass 材質的實作模式，包含具備物理感與互動性的材質效果。

## 核心組件 (SwiftUI)
- **.glassEffect()**: 賦予 View 玻璃質感，支援自訂形狀與色調。
- **GlassEffectContainer**: 效能優化的容器，支援多個玻璃元素間的融合與變形。
- **glassEffectUnion**: 將多個視圖結合成單一連續的玻璃形狀。

## 設計原則
- **互動性優先**: 僅在需要回饋的元件（如按鈕）上開啟 `.interactive()`。
- **階層清晰**: 避免過度嵌套玻璃效果，確保文字具備足夠的對比度。

---
*註：務必檢查 `widgetRenderingMode` 以確保組件在 Widget 中的顯示正確性。*
