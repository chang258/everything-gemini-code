# 安全指南 (Security Guidelines)

## 強制性安全檢查 (Mandatory Checks)

**提交前必須勾選**：
- [ ] **無硬編碼機密**：不存儲 API keys, 密碼, tokens 在源碼中。
- [ ] **輸入驗證**：所有使用者輸入均已驗證（使用 Zod/Pydantic 等）。
- [ ] **SQL 注入防護**：使用參數化查詢 (Parameterized Queries)，嚴禁字串拼接。
- [ ] **XSS 防護**：在渲染前淨化 HTML/JSX (DOMPurify)。
- [ ] **CSRF 防護**：在狀態變更端點 (POST/PUT/DELETE) 啟用防護。
- [ ] **認證與授權**：確保每個受保護的路徑都有權限檢查。
- [ ] **頻率限制 (Rate Limiting)**：所有 API 端點均有節流機制。
- [ ] **日誌稽核**：錯誤訊息不洩露系統內部細節或使用者機密。

## 機密管理 (Secret Management)

- **嚴禁**在代碼中寫死機密資訊。
- **必須**使用環境變數 (`process.env`) 或秘密管理工具 (Secret Manager)。
- 在啟動時驗證必要的機密是否存在。
- 若機密疑似洩露，**必須**立即停用並輪換 (Rotate)。

## 安全應變協議 (Security Response Protocol)

若發現安全問題：
1. **立即中止**當前實作。
2. 啟動 **security-reviewer** 代理人進行全量審查。
3. 在繼續前修復所有 CRITICAL 與 HIGH 問題。
4. 針對已暴露的機密執行輪換。
5. 全域搜尋是否存在類似漏洞。

---
*註：安全性是軟體品質的基石。*
