---
name: cpp-testing
description: C++ 測試最佳實踐。涵蓋 GoogleTest, CTest, 模擬 (Mocking)、測試覆蓋率與記憶體消毒器 (Sanitizers) 配置。
---

# C++ Testing & Quality Assurance

此技能專注於建立健全的 C++ 測試流水線，確保代碼具備回歸保護。

## 測試架構
- **工具**: 優先選用 GoogleTest (gtest) 與 CTest。
- **佈局**: `tests/unit` (單元), `tests/integration` (整合), `tests/testdata` (測試數據)。

## TDD 工作流程
- **紅 (Red)**: 撰寫失敗測試。
- **綠 (Green)**: 實施最小代碼使測試通過。
- **重構 (Refactor)**: 清理結構。

## 質量守衛
- **消毒器 (Sanitizers)**: 必須啟用 ASan (記憶體) 與 UBSan (未定義行為)。
- **不穩定測試防護**: 嚴禁使用 `sleep`。使用同步原語或模擬時間。

---
*註：在 CI 環境中應強制執行消毒器檢查與覆蓋率門檻。*
