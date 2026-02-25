---
name: coding-standards
description: 通用的開發規範與最佳實踐。包含命名慣例、程式碼結構、錯誤處理、性能優化及測試標準。適用於 TypeScript/JavaScript、React 與 Node.js 開發。
---

# Coding Standards & Best Practices

此技能定義了跨專案通用的開發標準，旨在提升程式碼的可讀性、可維護性與一致性。

## 觸發時機
- 開始新專案或新模組的開發時。
- 進行程式碼審查 (Code Review) 之前。
- 對現有代碼進行重構以符合現代開發模式時。
- 設定 Linting、Formatting 或型別檢查規則時。

## 核心開發原則

### 1. 可讀性優先 (Readability First)
- 程式碼被閱讀的次數遠多於撰寫。
- 變數與函數命名必須具備描述性。
- 優先撰寫自我解釋 (Self-documenting) 的代碼，而非過多註解。

### 2. 簡潔原則 (KISS - Keep It Simple, Stupid)
- 採用最簡單且可行的解決方案。
- 避免過度工程 (Over-engineering) 與過早優化。

### 3. 不重複原則 (DRY - Don't Repeat Yourself)
- 將通用邏輯抽象化為函數或組件。
- 避免複製貼上程式碼。

### 4. 需求優先 (YAGNI - You Aren't Gonna Need It)
- 不要建立當前不需要的功能。
- 僅在必要時增加系統複雜度。

## 命名標準 (Naming Conventions)

### 變數命名
```typescript
// ✅ 優良：具描述性
const marketSearchQuery = 'election'
const isUserAuthenticated = true
const totalRevenue = 1000

// ❌ 差勁：命名不明
const q = 'election'
const flag = true
const x = 1000
```

### 函數命名 (動詞-名詞模式)
```typescript
// ✅ 優良
async function fetchMarketData(marketId: string) { }
function calculateSimilarity(a: number[], b: number[]) { }
function isValidEmail(email: string): boolean { }

// ❌ 差勁
async function market(id: string) { }
function similarity(a, b) { }
```

## 程式碼工藝

### 不可變動性 (Immutability Pattern)
```typescript
// ✅ 務必使用展開運算子 (Spread operator)
const updatedUser = {
    ...user,
    name: 'New Name'
}

const updatedArray = [...items, newItem]

// ❌ 嚴禁直接修改原始物件
user.name = 'New Name'
items.push(newItem)
```

### 異步處理最佳實踐
```typescript
// ✅ 優良：儘可能平行執行
const [users, markets, stats] = await Promise.all([
    fetchUsers(),
    fetchMarkets(),
    fetchStats()
])

// ❌ 差勁：無意義的序列執行
const users = await fetchUsers()
const markets = await fetchMarkets()
const stats = await fetchStats()
```

## 錯誤處理標準

```typescript
// ✅ 優良：具備防禦性檢查與完整的錯誤捕獲
async function fetchData(url: string) {
    try {
        const response = await fetch(url)

        if (!response.ok) {
            throw new Error(`HTTP ${response.status}: ${response.statusText}`)
        }

        return await response.json()
    } catch (error) {
        console.error('Fetch failed:', error)
        throw new Error('無法獲取資料')
    }
}
```

## 代碼異味監測 (Code Smell Detection)
- **過長函數**: 如果函數超過 50 行，請考慮拆分。
- **巢狀地獄**: 使用「提早返回 (Early Returns)」來減少 if 巢狀結構。
- **神奇數字 (Magic Numbers)**: 使用命名常數 (Constants) 代替字面量數值。

## 註解規範
- **解釋 WHY 而非 WHAT**: 說明「為什麼」要這樣寫，而非解釋程式碼「在做什麼」。
- **JSDoc**: 對於公共 API 與複雜函數，必須提供完整的 JSDoc 說明。

---
*註：此規範應與專案特定的 GEMINI.md 或開發規範配合使用。*
