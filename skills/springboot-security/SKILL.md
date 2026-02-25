---
name: springboot-security
description: Spring Security 安全最佳實踐。涵蓋 JWT/OAuth2 身份驗證、方法級授權、CSRF 防範、機密管理、速率限制與 SQL 注入保護。
---

# Spring Boot Security Review

此技能提供 Spring Boot 應用的安全紅線檢查，確保系統具備現代化的安全防禦。

## 安全防禦重點
- **身份驗證**: 優先使用無狀態的 JWT 或具備撤銷機制的 Opaque Token。
- **授權控制**: 啟用 `@EnableMethodSecurity` 並在敏感路徑使用 `@PreAuthorize` 守衛。
- **輸入驗證**: 結合 Bean Validation 與 HTML 清洗 (Sanitization)。
- **機密管理**: 嚴禁將密碼寫入 `application.yml`，應透過環境變數或 Vault 注入。

## 網路安全
- **CORS**: 在 Security Filter 層級嚴格限制 Allowed Origins。
- **速率限制**: 針對高成本端點（如登入、上傳）實施 Throttling。

---
*註：安全配置應遵循「預設拒絕 (Deny by default)」原則。*
