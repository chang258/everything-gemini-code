---
name: visa-doc-translate
description: 簽證文件翻譯助手 v2.0。支援圖片與多頁 PDF 輸入，自動產出交錯對照的雙語英文翻譯 PDF。
---

# Visa Document Translation Assistant (Multi-page Support)

此技能現在支援將多頁的 PDF 證明文件或單張圖片，一鍵翻譯為專業的英文對照 PDF。

## 核心能力
- **格式相容**: 支援 `.jpg`, `.png`, `.pdf`。
- **逐頁處理**: 針對 PDF 輸入，自動逐頁執行 OCR 與翻譯。
- **對照佈局**: 產出「原頁 - 譯文」交錯排版的 PDF，方便核對。

## 管理指令 (CLI)
```powershell
# 翻譯單張圖片
python "$HOME\.gemini\skills\everything-gemini-code\skills\visa-doc-translate\scripts\translator.py" "path/to/image.jpg"

# 翻譯多頁 PDF
python "$HOME\.gemini\skills\everything-gemini-code\skills\visa-doc-translate\scripts\translator.py" "path/to/document.pdf"
```

## 環境依賴
`pip install easyocr deep-translator reportlab pillow pymupdf`

---
*註：PDF 輸入會以 200 DPI 進行採樣以確保 OCR 精確度。*
