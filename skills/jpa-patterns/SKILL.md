---
name: jpa-patterns
description: JPA/Hibernate 實體設計與效能優化模式。涵蓋 N+1 預防、抓取策略 (Fetch strategies)、投影、交易管理與 HikariCP 配置。
---

# JPA/Hibernate Patterns

此技能提供在 Spring Boot 中使用 JPA 進行高效能資料建模與存取的最佳實踐。

## 核心模式
- **實體設計**: 使用 `@Table` 索引與 `@EntityListeners` 實現自動審計 (Auditing)。
- **N+1 預防**: 預設採用延遲加載 (Lazy loading)，在查詢時使用 `JOIN FETCH` 或 DTO 投影。
- **交易管理**: 使用 `@Transactional(readOnly = true)` 優化唯讀路徑。

## 效能調優
- **連線池**: 推薦配置 `maximum-pool-size=20` 與適當的超時設定。
- **批次處理**: 啟用 `hibernate.jdbc.batch_size` 提升寫入效率。

---
*註：優先使用 Flyway 或 Liquibase 管理資料庫遷移，嚴禁在生產環境依賴 Hibernate auto DDL。*
