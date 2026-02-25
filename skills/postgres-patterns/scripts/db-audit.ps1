# Gemini PostgreSQL Database Auditor
# 功能：產出資料庫效能優化建議 SQL。

Write-Host "--- PostgreSQL 效能審計工具 ---" -ForegroundColor Cyan

$auditSQL = @"
-- 1. 尋找遺失索引的外鍵
SELECT conrelid::regclass AS table_name, a.attname AS column_name
FROM pg_constraint c
JOIN pg_attribute a ON a.attrelid = c.conrelid AND a.attnum = ANY(c.conkey)
WHERE c.contype = 'f'
  AND NOT EXISTS (
    SELECT 1 FROM pg_index i
    WHERE i.indrelid = c.conrelid AND a.attnum = ANY(i.indkey)
  )
LIMIT 10;

-- 2. 找出最耗時的 5 條查詢 (需開啟 pg_stat_statements)
-- SELECT query, mean_exec_time, calls FROM pg_stat_statements ORDER BY mean_exec_time DESC LIMIT 5;

-- 3. 檢查資料表膨脹 (Bloat) 情況
SELECT relname, n_dead_tup, last_vacuum FROM pg_stat_user_tables WHERE n_dead_tup > 1000 ORDER BY n_dead_tup DESC;
"@

$outputPath = "./db_audit_queries.sql"
$auditSQL | Out-File $outputPath -Encoding utf8

Write-Host "✅ 已產生審計 SQL 範本於: $outputPath" -ForegroundColor Green
Write-Host "💡 建議將此檔案內容貼入您的資料庫管理工具 (如 psql, DBeaver) 執行。" -ForegroundColor Gray
