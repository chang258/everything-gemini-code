---
name: verification-loop
description: 綜合驗證循環系統。在 PR 或部署前執行全方位的品質門檻檢查，包含建置、型別、Lint、測試、安全與 Diff 審查。內建 Windows 自動化腳本。
---

# Verification Loop (品質門檻檢查)

此技能提供一套完整的「品質門戶 (Quality Gates)」，確保每一次交付都符合生產標準。當使用 `/verify` 指令或啟用此技能時，請遵循以下步驟。

## 自動化工具 (Windows One-Click)
技能內建了 `verify.ps1`，能自動辨識 Node.js/Python 環境並執行全量檢查。

### 執行方式
```powershell
powershell -File "$HOME\.gemini\skills\everything-gemini-code\skills\verification-loop\scripts\verify.ps1"
```

## 核心驗證流程 (Verification Order)

請嚴格依照此順序執行驗證：

1.  **全域項目結構驗證 (Structure Validation)**：調用 `scripts/ci/` 下的驗證器，確保技能、指令、鉤子與規則的目錄結構正確且具備必要的 `SKILL.md`。
2.  **建置檢查 (Build Check)**：執行項目的 `build` 指令。失敗即中止驗證並報告錯誤。
3.  **型別檢查 (Type Check)**：執行 TypeScript 或對應語言的型別檢查。報告所有錯誤及其位置。
4.  **Lint 檢查 (Lint Check)**：執行程式碼風格檢查。回報所有警告與錯誤。
5.  **測試套件 (Test Suite)**：執行全量測試套件。回報通過/失敗計數及覆蓋率。
6.  **日誌稽核 (Console.log Audit)**：調用 `scripts/hooks/check-console-log.js` 搜尋原始碼中殘留的 `console.log` 並回報位置。
7.  **Git 狀態檢查 (Git Status)**：顯示未提交的變更及自上次提交以來修改的檔案。

## 執行參數 (Arguments)

*   `quick`: 僅執行「建置 + 型別檢查」。
*   `full`: (預設) 執行所有檢查。
*   `pre-commit`: 專注於與本次提交相關的檢查。
*   `pre-pr`: 包含全量檢查及安全性掃描。

## 標準驗證報告格式

完成驗證後，請產生以下格式的報告：

```
VERIFICATION: [PASS/FAIL]

Build:    [OK/FAIL]
Types:    [OK/X 錯誤]
Lint:     [OK/X 議題]
Tests:    [X/Y 通過, Z% 覆蓋率]
Secrets:  [OK/X 發現]
Logs:     [OK/X 殘留 console.logs]

Ready for PR: [YES/NO]
```

---
*註：長對話建議每 15 分鐘執行一次核心驗證流程。*
