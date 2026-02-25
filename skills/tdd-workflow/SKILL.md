---
name: tdd-workflow
description: 測試驅動開發 (TDD) 工作流。強制執行「先測試、後代碼」原則，內建腳手架工具快速產生開發樣板。
---

# Test-Driven Development Workflow

此技能確保所有的功能開發均遵循 TDD 原則，內建自動化工具加速開發起步。

## 快速腳手架 (Scaffolding Tool)
技能內建了 `new-feature.ps1`，能一鍵產生符合 TDD 規範的原始碼與測試樣板。

### 執行方式
```powershell
powershell -File "$HOME\.gemini\skills\everything-gemini-code\skills\tdd-workflow\scripts\new-feature.ps1" -Name "您的功能名稱"
```

## 標準步驟
1. **紅 (Red)**: 根據需求撰寫失敗測試。
2. **綠 (Green)**: 實施最小化代碼使測試通過。
3. **重構 (Refactor)**: 在測試保護下優化架構與命名。
4. **驗證**: 檢查覆蓋率報告（目標 80%+）。

---
*註：測試不只是檢查錯誤，更是代碼行為的正式規格說明。*
