---
paths:
  - "**/*.py"
  - "**/*.pyi"
---
# Python 編碼風格 (Python Coding Style)

> 本文件擴充了 [通用編碼風格 (common/coding-style.md)](../common/coding-style.md) 的 Python 特定內容。

## 標準與規範

- 嚴格遵循 **PEP 8** 命名與排版慣例。
- 所有公開函數簽章**必須**包含類型提示 (Type Annotations)。

## 不變性 (Immutability)

優先使用不變性的資料結構來防止意外變動：

```python
from dataclasses import dataclass

@dataclass(frozen=True)
class User:
    name: str
    email: str

from typing import NamedTuple

class Point(NamedTuple):
    x: float
    y: float
```

## 格式化與工具

- 使用 **black** 進行代碼格式化。
- 使用 **isort** 進行 Import 排序。
- 使用 **ruff** 進行靜態分析與 Lint 檢查。

## 參考資料

詳見技能：`python-patterns` 以獲取完整的 Pythonic 慣用語、Django 模式與效能優化建議。
