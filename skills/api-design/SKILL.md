---
name: api-design
description: REST API 設計模式與最佳實踐。包含資源命名、HTTP 方法、狀態碼規範、分頁、過濾、錯誤處理與版本控制。適用於設計一致且具備擴展性的後端服務。
---

# REST API Design Patterns

此技能提供了一套系統化的 API 設計指南，旨在建立一致、易於使用且具備專業水準的 RESTful 服務。

## 觸發時機
- 設計新的 API 端點時。
- 審查現有的 API 規格或契約時。
- 實作分頁、過濾或排序功能時。
- 規劃 API 版本控制策略時。
- 需要標準化系統錯誤回應格式時。

## 資源設計與命名 (Resource Design)

### URL 結構規範
- **名詞化**: 資源路徑應使用名詞而非動詞。
- **複數形式**: 統一使用複數形式（如 `/users` 而非 `/user`）。
- **小寫與橫線**: 使用小寫與 `kebab-case`。

| 動作 | HTTP 方法 | 範例 URL |
| :--- | :--- | :--- |
| 列表 | `GET` | `/api/v1/users` |
| 詳情 | `GET` | `/api/v1/users/:id` |
| 建立 | `POST` | `/api/v1/users` |
| 替換 | `PUT` | `/api/v1/users/:id` |
| 更新 | `PATCH` | `/api/v1/users/:id` |
| 刪除 | `DELETE` | `/api/v1/users/:id` |

- **子資源**: 用於表示關係，如 `GET /api/v1/users/:id/orders`。
- **特殊動作**: 僅在無法對應 CRUD 時使用動詞，如 `POST /api/v1/orders/:id/cancel`。

## HTTP 方法語義

- `GET`: 讀取資源（冪等且安全）。
- `POST`: 建立資源或執行非冪等操作。
- `PUT`: 完整替換現有資源。
- `PATCH`: 部分更新資源欄位。
- `DELETE`: 移除資源。

## 狀態碼規範 (Status Codes)

- **2xx (成功)**: `200 OK`, `201 Created` (建立成功), `204 No Content` (刪除成功)。
- **4xx (客戶端錯誤)**:
    - `400 Bad Request`: 參數錯誤。
    - `401 Unauthorized`: 未驗證。
    - `403 Forbidden`: 權限不足。
    - `404 Not Found`: 資源不存在。
    - `409 Conflict`: 資源衝突（如重複註冊）。
    - `422 Unprocessable Entity`: 驗證失敗。
    - `429 Too Many Requests`: 觸發速率限制。
- **5xx (伺服器錯誤)**: `500 Internal Server Error` (僅用於未預期的崩潰)。

## 資料呈現 (Data Presentation)

### 分頁 (Pagination)
- **Offset-based**: 適用於小規模數據集。`?page=2&per_page=20`。
- **Cursor-based**: 適用於大型數據集或無限捲動。`?cursor=abc&limit=20`。

### 過濾與排序
- **過濾**: `?status=active&category=electronics`。
- **比較**: `?price[gte]=100`。
- **排序**: `?sort=-created_at,price`（`-` 表示倒序）。
- **稀疏欄位**: `?fields=id,name`（僅回傳需要的欄位）。

## 版本控制 (Versioning)
- **建議採用 URL 版本化**: `/api/v1/...`。
- 非破壞性變更（加欄位）不需要升級版本；破壞性變更（改名、刪欄位）則必須提供新版本。

## API 設計清單 (Checklist)
- [ ] URL 是否為複數名詞？
- [ ] 是否使用了正確的 HTTP 方法？
- [ ] 錯誤回應是否包含一致的 `error` 物件與代碼？
- [ ] 是否實作了分頁（針對列表端點）？
- [ ] 是否進行了輸入驗證（如 Zod, Pydantic）？
- [ ] 是否已移除敏感的系統細節（如 SQL 錯誤訊息）？

---
*註：一致性是 API 設計的核心。優先遵循專案已有的命名風格（camelCase vs snake_case）。*
