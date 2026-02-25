---
name: cost-aware-llm-pipeline
description: LLM API 成本優化管道。包含智能模型路由、預算追蹤、提示快取 (Prompt Caching) 與防禦性重試邏輯。
---

# Cost-Aware LLM Pipeline

此技能旨在不影響品質的前提下，極大化 LLM API 的使用效率並降低支出。

## 優化策略

### 1. 智能模型路由 (Model Routing)
- **簡單任務**: 路由至 Flash 或 Haiku 等廉價模型。
- **複雜任務**: 路由至 Pro 或 Opus 等旗艦模型。

### 2. 預算保護 (Budget Tracking)
- 使用不可變的追蹤物件記錄累積成本。
- 達到預算上限時自動中止批次處理。

### 3. 提示快取 (Prompt Caching)
- 針對超過 1024 tokens 的系統提示 (System Prompt) 啟用快取。
- 避免在每個請求中重複支付靜態 Context 的費用。

### 4. 狹義重試 (Smart Retries)
- 僅針對 503 (過載) 或 429 (限流) 進行重試。
- 驗證錯誤 (400) 或權限錯誤 (401) 立即失效，避免浪費額外 Token。

---
*註：優先從最廉價的模型開始探測任務複雜度。*
