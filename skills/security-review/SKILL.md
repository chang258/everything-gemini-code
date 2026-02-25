---
name: security-review
description: 全面的安全檢查清單。涵蓋身份驗證、輸入驗證、機密管理、API 安全、支付功能保護與敏感數據暴露防範。
---

# Security Review Checklist

此技能提供了開發過程中的安全紅線檢查，確保系統具備基本的安全防禦能力。

## 核心檢查項目
- **機密管理**: 嚴禁在代碼、Commit 或 Log 中包含金鑰與密碼。
- **輸入驗證**: 所有的使用者輸入必須經過驗證與過濾（白名單優先）。
- **SQL 注入**: 嚴禁字串拼接，必須使用參數化查詢或 ORM。
- **身份驗證**: 實施強密碼原則、MFA 與安全 Session 管理。
- **速率限制**: 所有的公共 API 必須配置 Throttling 防範爆破與 DDoS。

## 特殊領域
- **支付功能**: 嚴格驗證支付回調 (Webhooks) 的簽章與完整性。
- **敏感數據**: 確保 PII (個人識別資訊) 在存儲與傳輸時皆已加密。

---
*註：安全性不是產品，而是一個持續的流程。*

## 深度參考
- **雲端基礎設施安全**: 關於 AWS/GCP/CI-CD 的詳細檢查清單，請參閱 [references/cloud-infrastructure-security.md](references/cloud-infrastructure-security.md)。
