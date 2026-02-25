---
name: postgres-patterns
description: PostgreSQL 資料庫模式與優化指南。包含索引選擇策略 (GIN, BRIN)、Row Level Security (RLS)、UPSERT 語法與效能分析。
---

# PostgreSQL Patterns (Supabase Based)

此技能提供 PostgreSQL 的高效能開發模式，基於現代雲端資料庫的最佳實踐。

## 索引策略
- **B-tree**: 標準相等與範圍查詢。
- **GIN**: 適用於 JSONB 全文檢索。
- **BRIN**: 針對具備時間順序的大型數據集。
- **Partial Index**: 僅對符合條件（如 `deleted_at IS NULL`）的列建立索引以節省空間。

## 開發模式
- **UPSERT**: 利用 `ON CONFLICT DO UPDATE` 處理重複寫入。
- **分頁優化**: 優先使用「游標分頁 (Cursor Pagination)」而非 O(n) 的 OFFSET。
- **安全**: 實施 RLS 策略確保多租戶數據隔離。

---
*註：定期使用 `pg_stat_statements` 檢查慢查詢，並清理無效的 Foreign Key 索引。*
