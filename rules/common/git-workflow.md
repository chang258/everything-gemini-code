# Git 工作流規範 (Git Workflow)

## 提交訊息格式 (Commit Message Format)

遵循慣用提交 (Conventional Commits)：
```
<類型>: <描述>

[選填內容主體]
```

**類型 (Types)**：
- `feat`：新功能。
- `fix`：修復 Bug。
- `refactor`：代碼重構（不影響功能）。
- `docs`：更新文件。
- `test`：新增或修正測試。
- `chore`：維護任務（配置、構建腳本）。
- `perf`：效能優化。
- `ci`：CI 配置變動。

## 功能實作工作流 (Feature Implementation Workflow)

1. **規劃優先 (Plan First)**
   - 使用 `/plan` 指令或 **planner** 代理人。
   - 重述需求、識別風險、制定分階段計劃。
   - **必須**在使用者確認後才開始實作。

2. **測試驅動 (TDD Approach)**
   - 使用 `/tdd` 指令或 **tdd-guide** 代理人。
   - **紅 (RED)**：先寫失敗測試。
   - **綠 (GREEN)**：實作最小代碼使測試通過。
   - **重構 (REFACTOR)**：在測試保護下優化代碼。
   - **驗證**：確保測試覆蓋率達標 (80%+)。

3. **代碼審查 (Code Review)**
   - 寫完代碼後，立即使用 **code-reviewer** 進行自我審查。
   - 處理 CRITICAL 與 HIGH 等級的議題。

4. **全面驗證 (Verification)**
   - 提交前執行 `/verify` 指令。
   - 確保建置、型別、Lint、全量測試與日誌稽核全數通過。

5. **提交與推送 (Commit & Push)**
   - 撰寫詳盡的提交訊息。
   - 確保所有變更均符合慣用提交規範。

---
*註：禁止未經規劃與測試的代碼直接進入倉庫。*
