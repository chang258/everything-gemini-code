---
name: regex-vs-llm-structured-text
description: 結構化文本解析的決策框架。提供在 Regex 與 LLM 之間選擇的邏輯，旨在平衡成本、準確性與系統效能。
---

# Regex vs LLM for Structured Text

此技能協助決定何時應使用傳統的正規表達式 (Regex)，以及何時應引入 LLM 來處理文本提取任務。

## 決策矩陣 (Decision Framework)

### 1. 優先使用 Regex
- **條件**: 文本格式具備高度一致性（>90% 遵循特定模式）。
- **優點**: 納秒級響應、零 Token 成本、100% 確定性。

### 2. 混合管道 (Hybrid Pattern) - 推薦方案
- **邏輯**: 先用 Regex 處理 95% 的標準情況。針對 Regex 解析失敗或低置信度的「邊緣情況」，才調用 LLM 進行處理。

### 3. 直接使用 LLM
- **條件**: 文本高度可變、自由形式（如會議紀錄、語意提取）。
- **優點**: 具備語義理解能力，容錯率高。

---
*註：不要用 LLM 來做 Regex 擅長的事，避免不必要的成本與延遲。*
