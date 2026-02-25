---
name: django-patterns
description: 生產級 Django 開發模式。包含專案結構佈局、自訂 QuerySet、DRF ViewSet 模式、服務層 (Service Layer) 以及效能優化策略。
---

# Django Development Patterns

此技能定義了可擴展且易於維護的 Django 架構模式。

## 專案結構
- 建議將設定拆分為 `base.py`, `development.py`, `production.py`。
- 業務邏輯應封裝在 `services.py` 或自訂 `QuerySet` 中，而非寫在 View 裡。

## 模型與 ORM 優化
- **select_related**: 用於外鍵 (Foreign Key) 優化。
- **prefetch_related**: 用於多對多 (Many-to-Many) 關係優化。
- **Index**: 針對頻繁查詢的欄位建立資料庫索引。

---
*註：遵循「厚模型、薄視圖 (Fat Models, Thin Views)」原則，並適度引入 Service Layer 以處理複雜業務邏輯。*
