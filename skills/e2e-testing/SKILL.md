---
name: e2e-testing
description: Playwright 端對端 (E2E) 測試模式。包含頁面物件模型 (POM)、CI/CD 整合、不穩定測試 (Flaky tests) 處理策略及測試產出管理。
---

# E2E Testing Patterns

此技能提供了使用 Playwright 建立穩定、高效且易於維護的 E2E 測試套件的全面模式。

## 測試組織與架構
- **目錄結構**: 建議將測試分為 `e2e/auth`, `e2e/features`, `e2e/api` 等模組。
- **頁面物件模型 (Page Object Model)**: 將頁面元素與操作邏輯封裝在專屬類別中，提升測試代碼的可讀性與重用性。

## Playwright 配置最佳實踐
- **平行執行**: 預設開啟以縮短測試時間。
- **重試機制**: 僅在 CI 環境中開啟重試 (Retries)，以應對偶發的網路延遲。
- **產出管理**: 自動在測試失敗時捕捉截圖 (Screenshot)、影片 (Video) 與追蹤檔 (Trace)。

## 應對不穩定測試 (Flaky Tests)
- **自動等待 (Auto-waiting)**: 優先使用 Locator 內建的等待機制，而非硬編碼的 `sleep`。
- **網路狀態同步**: 確保在執行斷言前，網路請求（如 API 回應）已完成加載。
- **隔離測試**: 確保測試之間不具備依賴關係，支援以隨機順序執行。

---
*註：E2E 測試應專注於核心業務流程（Happy Path）與關鍵邊界情況，避免測試過於細碎的 UI 細節。*
