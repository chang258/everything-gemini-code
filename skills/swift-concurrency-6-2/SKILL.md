---
name: swift-concurrency-6-2
description: Swift 6.2 併發模式。涵蓋 @concurrent 顯式背景調度、隔離協議遵循 (Isolated Conformances) 與 MainActor 預設推斷。
---

# Swift 6.2 Approachable Concurrency

此技能定義了 Swift 6.2 現代併發的最佳實踐，強調「預設單執行緒，顯式開啟併發」。

## 關鍵異動
- **預設不切換**: Async 函數預設留在呼叫者的 Actor 上，消除隱式的背景調度。
- **@concurrent**: 僅針對運算密集型任務使用 `@concurrent` 顯式調度至背景執行緒池。
- **MainActor 推斷**: 應用程式目標支援更簡潔的 `@MainActor` 標註省略。

---
*註：若編譯器回報 Data Race，代表代碼存在真實的併發風險，應調整隔離設計而非抑制錯誤。*
