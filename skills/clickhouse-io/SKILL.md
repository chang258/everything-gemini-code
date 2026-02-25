---
name: clickhouse-io
description: ClickHouse 高效能分析與資料工程實踐。包含表引擎選擇 (MergeTree 系列)、查詢優化、物化視圖、大數據攝取模式及即時儀表板分析。
---

# ClickHouse Analytics & Engineering Patterns

此技能提供 ClickHouse 特有的高效能分析工作負載與資料工程模式，旨在發揮極速的列式存取與大規模並行處理 (MPP) 能力。

## 觸發時機
- 設計新的 ClickHouse 資料表或 MergeTree 引擎結構時。
- 優化複雜的 OLAP 分析查詢（聚合、視窗函數）時。
- 實作即時資料分析、時間序列分析或漏斗分析時。
- 需要處理大規模批次插入 (Batch Insert) 或 Kafka 串流整合時。
- 建立物化視圖 (Materialized Views) 進行即時預聚合時。

## 表格設計模式 (Table Design)

### MergeTree 引擎選擇
- **MergeTree**: 通用的高效能引擎。
- **ReplacingMergeTree**: 用於處理具備更新語義的重複數據（去重）。
- **AggregatingMergeTree**: 結合 `AggregateFunction` 實現自動聚合。
- **SummingMergeTree**: 自動對重複的主鍵進行數值累加。

### 排序鍵與分區 (Order By & Partition)
- **ORDER BY**: 決定資料在磁碟上的存儲順序與主索引。應包含最常用的過濾欄位。
- **PARTITION BY**: 決定資料分片。通常按「月」或「天」分區，以利於舊資料刪除與掃描範圍裁剪。

## 查詢優化模式 (Query Optimization)

### 高效過濾與聚合
- **欄位裁剪**: 只選擇需要的欄位，絕對不要使用 `SELECT *`。
- **PREWHERE**: 利用 ClickHouse 特有的過濾優化，提前排除不符合條件的列。
- **聚合函數優化**: 使用 `count()` 代替 `count(column)`；利用 `uniqCombined` 進行高效的估計去重。

### 物化視圖 (Materialized Views)
- 利用物化視圖在寫入時即完成計算（即時聚合），將 O(N) 的查詢轉換為 O(1)。

## 資料攝取模式 (Data Ingestion)

### 批次插入 (Batching)
- 避免頻繁的小型插入。建議每秒或每萬列執行一次批次寫入。
- 利用快取層或隊列緩衝寫入壓力。

### 同步與遷移
- **PostgreSQL/MySQL 遷移**: 使用 `MySQL` 或 `PostgreSQL` 資料庫引擎進行直接同步或分析整合。

## 分析查詢範例
- **時間序列**: 使用 `toStartOfHour`, `toStartOfDay` 進行桶裝分析。
- **同期群分析 (Cohort Analysis)**: 利用 `groupArray` 與位元圖 (Bitmap) 進行留存分析。

---
*註：ClickHouse 是為了「讀」而優化的系統。所有的設計（尤其是 Sorting Key）都應以終端分析需求為導向。*
