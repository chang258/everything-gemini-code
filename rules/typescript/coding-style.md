---
paths:
  - "**/*.ts"
  - "**/*.tsx"
  - "**/*.js"
  - "**/*.jsx"
---
# TypeScript/JavaScript 編碼風格 (Coding Style)

> 本文件擴充了 [通用編碼風格 (common/coding-style.md)](../common/coding-style.md) 的 TS/JS 特定內容。

## 不變性 (Immutability)

使用展開運算子 (Spread Operator) 進行不變性更新：

```typescript
// 錯誤：直接修改 (Mutation)
function updateUser(user, name) {
  user.name = name  // 直接修改原始物件！
  return user
}

// 正確：不變性更新 (Immutability)
function updateUser(user, name) {
  return {
    ...user,
    name
  }
}
```

## 錯誤處理 (Error Handling)

一律使用 `async/await` 配合 `try-catch`：

```typescript
try {
  const result = await riskyOperation()
  return result
} catch (error) {
  console.error('操作失敗:', error)
  throw new Error('提供使用者友善的錯誤訊息')
}
```

## 輸入驗證 (Input Validation)

使用 **Zod** 進行基於 Schema 的強型別驗證：

```typescript
import { z } from 'zod'

const schema = z.object({
  email: z.string().email(),
  age: z.number().int().min(0).max(150)
})

const validated = schema.parse(input)
```

## 日誌稽核 (Console.log)

- 嚴禁在生產環境代碼中留存 `console.log`。
- 應使用正式的日誌庫（如 Pino, Winston）。
- 詳見 `scripts/hooks` 以獲取自動化偵測規則。

---
*註：型別安全是 TypeScript 的靈魂。*
