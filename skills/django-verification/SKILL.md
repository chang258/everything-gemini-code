---
name: django-verification
description: Django 專案驗證流程。涵蓋資料庫遷移檢查、代碼風格掃描、具備覆蓋率的測試、安全性掃描及部署前的發佈就緒檢查。
---

# Django Verification Loop

此技能提供了一套系統化的驗證流程，建議在提交 Pull Request 前、重大變更後或部署至生產環境前執行。

## 驗證階段

### 1. 環境與配置檢查
- 驗證 Python 版本與虛擬環境。
- 檢查關鍵環境變數（如 `DJANGO_SECRET_KEY`）是否正確配置。

### 2. 代碼品質與格式 (Linting)
- 使用 `ruff` 進行代碼檢查。
- 使用 `black` 統一代碼格式。
- 使用 `mypy` 進行型別檢查。
- 執行 `python manage.py check --deploy` 進行部署前置檢查。

### 3. 資料庫遷移 (Migrations)
- 檢查是否有未套用的遷移。
- 檢查是否存在模型變更但尚未建立遷移的情況。
- 驗證遷移衝突。

### 4. 測試與覆蓋率 (Tests & Coverage)
- 執行 `pytest` 並產生覆蓋率報告。
- 設定各組件的目標覆蓋率（如 Models > 90%, Views > 80%）。

### 5. 安全性掃描 (Security)
- 使用 `pip-audit` 檢查依賴項漏洞。
- 使用 `bandit` 進行代碼安全性靜態分析。
- 檢查是否誤開 `DEBUG = True`。

### 6. 效能與 N+1 檢查
- 透過 Debug Toolbar 監測查詢次數。
- 檢查是否缺少必要的資料庫索引。

---
*註：自動化驗證是確保交付品質的第一道防線，但不應取代人工的 Code Review。*
