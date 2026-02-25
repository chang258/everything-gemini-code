---
name: python-patterns
description: Python 慣用語、PEP 8 標準與型別提示。涵蓋 EAFP 原則、列表推導式、上下文管理器與可維護的 Python 套件設計。
---

# Python Development Patterns

此技能定義了 Python 語言的慣用法 (Pythonic) 與最佳實踐，旨在提升程式碼的可讀性與穩定性。

## 核心原則
- **可讀性至上**: 代碼被閱讀的次數遠多於撰寫。
- **明確優於隱晦**: 避免使用 `from module import *` 或模糊的命名。
- **EAFP**: 「更容易請求原諒而非許可」(Easier to ask for forgiveness than permission)。

## 代碼風格規範
- **PEP 8**: 縮排使用 4 個空格，變數與函數使用 `snake_case`。
- **型別提示 (Type Hinting)**: 所有的公共 API 必須標註型別。
- **上下文管理器**: 處理資源（如檔案、資料庫連線）務必使用 `with` 語句。

---
*註：遵循 Zen of Python (PEP 20)，保持邏輯簡單且直接。*
