---
name: golang-testing
description: Go 測試最佳實踐。涵蓋表格驅動測試 (Table-driven tests)、並行子測試、模糊測試 (Fuzzing)、基準測試 (Benchmark) 與模擬 (Mocking)。
---

# Go Testing Patterns

此技能提供 Go 語言的原生測試方案，遵循 TDD 工作流程並利用標準庫的強大功能。

## 測試技術
- **表格驅動測試**: Go 測試的標準模式，易於擴展邊界情況。
- **並行測試**: 呼叫 `t.Parallel()` 加速獨立測試執行。
- **Golden Files**: 針對複雜輸出（如 JSON/HTML）比對 `testdata/` 中的預期檔案。

## 進階分析
- **Fuzzing**: 自動產生隨機輸入以探測邊界崩潰。
- **Benchmark**: 測量納秒級效能與記憶體分配 (allocs/op)。
- **Coverage**: 維持核心業務邏輯 100% 覆蓋。

---
*註：測試即文件。好的 Go 測試應展示代碼的正確使用方式。*
