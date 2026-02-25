---
name: foundation-models-on-device
description: Apple FoundationModels 框架模式。用於 iOS 26+ 上的裝置端 (On-device) LLM 開發，包含引導式生成 (@Generable)、工具調用與快照串流。
---

# FoundationModels: On-Device LLM (iOS 26)

此技能定義了在 App 中整合 Apple 裝置端語言模型的模式，利用 FoundationModels 框架實現具備隱私保護與離線支援的 AI 功能。

## 核心模式

### 1. 模型可用性檢查
在建立 Session 前，務必檢查 `SystemLanguageModel.default.availability`，處理裝置不支援或模型未就緒的情況。

### 2. 引導式生成 (@Generable)
使用 Swift 的 `@Generable` 巨集來生成結構化數據，而非原始字串。
- **優點**: 編譯時型別安全、自動生成 `PartiallyGenerated` 型別支援串流顯示。
- **約束**: 支援透過 `@Guide` 設定數值範圍或陣列長度。

### 3. 工具調用 (Tool Calling)
讓模型調用自訂的 Swift 程式碼來執行特定領域的任務（如搜尋食譜、建立行事曆事件）。

### 4. 快照串流 (Snapshot Streaming)
使用 `streamResponse` 實現即時 UI 更新。每個快照 (Snapshot) 代表當前已生成的完整部分狀態。

## 關鍵限制與決策
- **Token 限制**: 裝置端模型限制為 4,096 tokens。
- **隱私優先**: 數據絕不離開裝置，完全支援離線運作。
- **單次請求**: 每個 Session 一次僅能處理一個請求，可透過 `isResponding` 檢查狀態。

## 最佳實踐
- **優先使用 instructions**: 指令的權重高於 Prompt，用於定義模型的角色與安全規範。
- **存取 `.content`**: 務必透過 `.content` 屬性獲取結果，而非舊版的屬性。
- **效能監測**: 使用 Xcode Instruments 分析模型推論對裝置性能的影響。

---
*註：針對大量數據處理，應考慮分塊 (Chunking) 或多 Session 併行策略。*
