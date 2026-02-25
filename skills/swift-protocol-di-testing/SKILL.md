---
name: swift-protocol-di-testing
description: 基於 Protocol 的 Swift 依賴注入與測試模式。提供文件系統、網路與 API 的 Mock 方案，實現無 I/O 的確定性測試。
---

# Swift Protocol-Based DI & Testing

此技能協助建立具備測試性的 Swift 架構，透過小而專注的 Protocol 隔離外部依賴。

## 核心模式
- **專注 Protocol**: 一個 Protocol 只處理一個外部關注點（如 `FileAccessor`）。
- **預設參數注入**: 在 Init 中提供生產環境實作為預設值，僅在測試時注入 Mock。
- **錯誤模擬**: 在 Mock 實作中加入可配置的 `error` 屬性，以驗證異常路徑。

---
*註：僅對邊界（如系統 API）進行 Mock，內部邏輯應優先進行整合測試。*
