---
name: postgres-patterns
description: PostgreSQL 資料庫模式與優化指南。內建資料庫審計工具，自動產出優化建議 SQL。
---

# PostgreSQL Patterns (Supabase Based)

此技能提供 PostgreSQL 的高效能開發模式，內建自動化工具協助診斷資料庫健康狀況。

## 資料庫審計工具 (Audit Tool)
技能內建了 `db-audit.ps1`，能自動產出針對索引、慢查詢與膨脹情況的診斷 SQL。

### 執行方式
```powershell
powershell -File "$HOME\.gemini\skills\everything-gemini-code\skills\postgres-patterns\scripts\db-audit.ps1"
```

## 核心模式
- **UPSERT**: 利用 `ON CONFLICT DO UPDATE` 處理重複寫入。
- **分頁優化**: 優先使用「游標分頁 (Cursor Pagination)」而非 OFFSET。
- **安全**: 實施 RLS 策略確保多租戶數據隔離。

---
*註：產出的 `db_audit_queries.sql` 建議定期在生產資料庫的副本上執行以監測效能。*
