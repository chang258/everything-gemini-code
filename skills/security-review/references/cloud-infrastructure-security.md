# 雲端與基礎設施安全參考手冊 (Cloud & Infrastructure Security)

此文件提供雲端環境部署、CI/CD 管線及基礎設施配置的安全最佳實踐。

## 1. IAM 與存取控制
- **最小權限原則 (PoLP)**: 僅授予執行任務所需的最小權限。
- **強制 MFA**: 針對所有具備管理權限的帳號強制啟用多因素驗證。
- **避免長期憑證**: 優先使用 IAM Roles (OIDC) 取代存取金鑰 (Access Keys)。

## 2. 機密管理 (Secrets Management)
- **使用 Secrets Manager**: 嚴禁將金鑰硬編碼在 `env` 或代碼中。
- **自動輪換**: 為資料庫密碼與 API 金鑰設定自動輪換機制。

## 3. 網路安全
- **VPC 隔離**: 資料庫與內部服務不應具備公網 IP。
- **安全性群組 (Security Groups)**: 遵循「預設拒絕」原則，僅開放必要的 Port 與 IP 範圍。

## 4. CI/CD 安全
- **機密掃描**: 在 Pipeline 中整合 TruffleHog 或 Gitleaks。
- **依賴審計**: 使用 `npm audit` 或 `pip-audit` 檢查已知漏洞。

## 5. 備份與災難復原
- **自動化備份**: 針對 RDS 或存儲服務啟用每日自動備份。
- **刪除保護**: 啟用 Deletion Protection 防範人為誤刪。

---
*註：雲端配置錯誤是資料洩露的主要原因。部署前務必對照此清單執行全量掃描。*
