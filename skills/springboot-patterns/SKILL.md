---
name: springboot-patterns
description: Spring Boot 架構開發模式。包含 REST API 設計、Controller-Service-Repository 分層、資料存取優化、非同步處理與全域異常處理。
---

# Spring Boot Development Patterns

此技能定義了建構生產級 Spring Boot 服務的核心架構模式。

## 核心層級設計
- **Controller**: 保持薄層 (Thin)，僅負責請求轉發與 DTO 轉換。使用 `@Validated` 執行輸入驗證。
- **Service**: 封裝業務邏輯與 `@Transactional` 事務邊界。
- **Repository**: 利用 Spring Data JPA 進行資料存取，避免在邏輯層拼接 SQL。

## 最佳實踐
- **DTO 模式**: 使用 `record` 實作不可變的請求與回應物件。
- **異常處理**: 透過 `@ControllerAdvice` 實現集中式的錯誤回應標準化。
- **快取策略**: 善用 `@Cacheable` 減少重覆的高成本計算。

---
*註：優先採用構造函數注入 (Constructor Injection)，避免使用欄位注入 (@Autowired)。*
