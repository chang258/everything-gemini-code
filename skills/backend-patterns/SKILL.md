---
name: backend-patterns
description: 後端架構模式與最佳實踐。包含 Repository 模式、Service 層設計、資料庫優化 (N+1 預防)、快取策略、中介軟體以及背景任務處理。適用於建構可擴展的伺服器端應用。
---

# Backend Development Patterns

此技能定義了後端開發的核心架構模式與最佳實踐，旨在提升系統的可擴展性、效能與穩定性。

## 觸發時機
- 設計複雜的後端業務邏輯或多層架構時。
- 優化資料庫查詢效能（如解決 N+1 問題）時。
- 實作快取機制（如 Redis, Memory Cache）時。
- 建立背景任務、工作隊列或異步處理流程時。
- 實作集中式錯誤處理與日誌記錄系統時。

## 架構層級模式

### 1. 儲存層模式 (Repository Pattern)
將資料存取邏輯與業務邏輯分離，提供抽象的資料操作介面。
```typescript
interface MarketRepository {
    findAll(filters?: MarketFilters): Promise<Market[]>
    findById(id: string): Promise<Market | null>
}
```

### 2. 服務層模式 (Service Layer)
封裝純粹的業務邏輯，協調不同的 Repository 與外部服務。
```typescript
class MarketService {
    constructor(private marketRepo: MarketRepository) {}
    
    async searchMarkets(query: string) {
        // 1. 產生向量嵌入 (Business Logic)
        // 2. 呼叫 Repository 獲取資料
        // 3. 處理並回傳結果
    }
}
```

### 3. 中介軟體模式 (Middleware)
用於請求/回應生命週期中的通用處理（如驗證、日誌、速率限制）。

## 資料庫優化模式

### N+1 查詢預防 (N+1 Query Prevention)
- **錯誤做法**: 在迴圈中執行查詢（產生 N 次資料庫調用）。
- **正確做法**: 使用批次讀取 (Batch Fetch) 或 `IN` 子句，將查詢次數降至 1 次。

### 交易模式 (Transaction)
確保多個資料庫操作的原子性（All or Nothing），適用於涉及金流或多表關聯的更新。

## 快取策略 (Caching)

### Cache-Aside 模式
1. 讀取時：先查快取，若命中則回傳；若失效則查資料庫並回填快取。
2. 寫入時：直接寫入資料庫，並使對應的快取失效 (Invalidate)。

## 錯誤處理與健壯性

### 集中式錯誤處理 (Centralized Error Handler)
建立統一的錯誤處理機制，根據錯誤類型回傳適當的 HTTP 狀態碼，並避免洩漏系統內部細節。

### 指數退避重試 (Exponential Backoff)
在呼叫外部不穩定服務時，使用重試機制並逐次增加延遲時間（如 1s, 2s, 4s...），以保護系統不被瞬間崩潰的外部服務拖垮。

## 速率限制與任務隊列
- **速率限制 (Rate Limiting)**: 基於 IP 或 User ID 保護 API 不受攻擊。
- **任務隊列 (Job Queue)**: 將耗時操作（如發送郵件、圖像處理）放入背景執行，立即回傳回應給使用者。

---
*註：後端開發應根據系統複雜度選擇適合的模式。避免為小型專案引入過度複雜的抽象層。*
