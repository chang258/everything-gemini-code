---
name: verification-loop
description: 綜合驗證循環系統。在 PR 或部署前執行全方位的品質門檻檢查，包含建置、型別、Lint、測試、安全與 Diff 審查。內建 Windows 自動化腳本。
---

# Verification Loop (品質門檻檢查)

此技能提供一套完整的「品質門戶 (Quality Gates)」，確保每一次交付都符合生產標準。

## 自動化工具 (Windows One-Click)
技能內建了 `verify.ps1`，能自動辨識 Node.js/Python 環境並執行全量檢查。

### 執行方式
```powershell
powershell -File "$HOME\.gemini\skills\everything-gemini-code\skills\verification-loop\scripts\verify.ps1"
```

## 驗證階段
- **Phase 1: 建置**: 確保項目可正確 Build。
- **Phase 2: 型別與 Lint**: 消除所有的 Type Errors 與風格警告。
- **Phase 3: 測試套件**: 執行全量測試並驗證覆蓋率達標。
- **Phase 4: 安全掃描**: 檢查是否存在洩漏的機密（如 `sk-`, `api_key`）。
- **Phase 5: 差異審查**: 檢核 `git diff` 排除不必要的變更。

---
*註：長對話建議每 15 分鐘執行一次核心驗證流程。*
