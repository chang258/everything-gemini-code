---
name: django-tdd
description: Django 測試驅動開發 (TDD) 策略。使用 pytest, factory_boy 與 DRF 測試工具，建立高覆蓋率的測試套件。
---

# Django Test-Driven Development

此技能提供系統化的 Django 測試方案，確保程式碼具備高度的回歸保護。

## TDD 工作流程
- **紅 (Red)**: 撰寫失敗測試（捕獲需求）。
- **綠 (Green)**: 實施最小化代碼。
- **重構 (Refactor)**: 在測試保護下優化代碼。

## 測試工具箱
- **pytest-django**: 核心測試運行器。
- **factory_boy**: 取代 Fixtures 建立測試數據，靈活性更高。
- **Mocking**: 用於隔離外部 API 或不穩定服務。

---
*註：維持 80% 以上的測試覆蓋率，並在 CI 流程中強制執行。*
