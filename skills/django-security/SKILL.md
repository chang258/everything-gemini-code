---
name: django-security
description: Django 安全最佳實踐。包含身份驗證、授權、CSRF 保護、SQL 注入防範、XSS 防範以及安全生產環境配置。
---

# Django Security Best Practices

此技能提供了一套完整的 Django 安全指南，確保應用程式能抵禦常見的 Web 攻擊。

## 核心安全設定 (Production settings)
- **DEBUG = False**: 生產環境絕不開啟。
- **SECURE_SSL_REDIRECT**: 強制 HTTPS 重定向。
- **SESSION_COOKIE_SECURE**: 僅透過 HTTPS 發送 Session。
- **CSRF_COOKIE_HTTPONLY**: 防止 JavaScript 存取 CSRF Token。

## 防範常見攻擊
- **SQL 注入**: 始終使用 Django ORM 或在 raw SQL 中使用參數化查詢。
- **XSS 防範**: 利用 Django 模板自動跳脫，謹慎使用 `|safe`。
- **CSRF 保護**: 確保表單包含 `{% csrf_token %}`，並配置 `CSRF_TRUSTED_ORIGINS`。

---
*註：安全性是一個持續的過程，應定期執行安全審計與依賴項更新。*
