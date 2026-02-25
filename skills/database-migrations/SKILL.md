---
name: database-migrations
description: 安全的資料庫遷移模式。涵蓋零停機變更、模式與資料遷移分離、並發索引建立及 PostgreSQL/MySQL 的遷移檢查清單。
---

# Database Migration Patterns

此技能提供在生產環境中執行安全、可逆的資料庫變更模式。

## 核心原則
1. **模式與資料分離**: 絕不在同一個遷移中混用 DDL（結構）與 DML（數據）。
2. **零停機變更**: 使用「擴展-收縮 (Expand-Contract)」模式處理破壞性變更。
3. **安全操作**: 
   - 建立索引時使用 `CONCURRENTLY` (PostgreSQL)。
   - 新增 `NOT NULL` 欄位時應先提供預設值。

## 批次數據遷移
- 處理大數據時，應採用批次處理 (Batch Update) 以避免長時間鎖定資料表。

---
*註：一旦部署，遷移檔案即為不可變。回滾應透過新的向前遷移執行。*
