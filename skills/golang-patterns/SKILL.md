---
name: golang-patterns
description: 慣用的 Go (Idiomatic Go) 開發模式。包含錯誤處理 (Error Wrapping)、併發模式 (Worker Pool)、介面設計與效能優化。
---

# Go Development Patterns

此技能強制執行 Go 語言的簡潔與清晰原則，確保代碼具備高度的可預測性與效能。

## 核心哲學
- **清晰優於聰明**: 代碼應該易於閱讀且直觀。
- **有用零值 (Useful Zero Value)**: 設計類型使其無需初始化即可使用（如 `sync.Mutex`）。
- **接受介面，回傳結構**: 參數使用 Interface 提升彈性，回傳具體 Struct 保留細節。

## 併發與控制
- **Worker Pool**: 限制 Goroutine 數量以處理大量任務。
- **Context 傳遞**: 始終在第一個參數傳遞 `context.Context` 以處理取消與超時。
- **優雅關閉 (Graceful Shutdown)**: 監聽系統信號並確保資源清理。

---
*註：Go 的核心是「無趣」—— 預測性、一致性且簡單。*
