---
name: python-testing
description: Python 測試策略。使用 pytest 進行測試驅動開發 (TDD)，涵蓋 Fixtures、Mocking、參數化測試與 80% 覆蓋率門檻。
---

# Python Testing & TDD Strategy

此技能提供 Python 專案的測試方案，確保程式碼具備健全的防禦性與回歸保護。

## TDD 工作流程
- **紅 (Red)**: 撰寫失敗測試以擷取需求。
- **綠 (Green)**: 實施最少代碼使測試通過。
- **重構 (Refactor)**: 在測試保護下清理結構。

## pytest 最佳實踐
- **Fixtures**: 用於建立重用的測試環境與數據。
- **參數化 (@pytest.mark.parametrize)**: 簡潔地測試多組輸入。
- **Mocking**: 使用 `unittest.mock` 隔離外部系統（如 API, Filesystem）。

## 質量指標
- **目標覆蓋率**: 全域 80% 以上，核心商務邏輯 100%。

---
*註：測試不只是檢查錯誤，更是對代碼行為的正式文件說明。*
