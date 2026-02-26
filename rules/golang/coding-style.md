---
paths:
  - "**/*.go"
  - "**/go.mod"
  - "**/go.sum"
---
# Go 編碼風格 (Go Coding Style)

> 本文件擴充了 [通用編碼風格 (common/coding-style.md)](../common/coding-style.md) 的 Go 特定內容。

## 格式化與工具

- 強制使用 **gofmt** 與 **goimports** — 嚴禁針對基本縮排或間距進行爭論。

## 設計原則

- **接受介面，返回結構體** (Accept interfaces, return structs)：提升代碼彈性。
- 保持介面精簡：每個介面建議僅包含 1-3 個方法。

## 錯誤處理 (Error Handling)

回傳錯誤時必須包裝上下文資訊：

```go
if err != nil {
    return fmt.Errorf("建立使用者失敗: %w", err)
}
```

## 參考資料

詳見技能：`golang-patterns` 以獲取完整的 Go 慣用語、併發模式與最佳實踐。
