---
name: visa-doc-translate
description: 簽證申請文件翻譯助手。將證明文件（存款、在職等）圖片轉換為專業英文，並生成包含原件與譯文的雙語 PDF。
---

# Visa Document Translation Assistant

此技能專門用於處理簽證申請文件的翻譯與格式化工作，確保輸出符合官方申請標準。

## 自動化流程
1. **圖片處理**: 自動轉換 HEIC 為 PNG，並根據 EXIF 自動校正旋轉。
2. **OCR 提取**: 自動嘗試多種 OCR 引擎（Vision, EasyOCR, Tesseract）提取完整內容。
3. **專業翻譯**: 採用簽證等級的術語，保留原件結構，精確翻譯日期與金額。
4. **PDF 生成**: 產出雙語 PDF（第一頁原件，第二頁帶格式的譯文），並附帶認證翻譯聲明。

## 支援文件類型
- 存款證明、收入證明、在職/退休證明、營業執照、房產證等。

---
*註：所有的個人隱私數據應在 PDF 生成後立即從臨時目錄清理。*

## 安裝與配置
- **環境需求與 OCR 設定**: 請參閱深度指南 [references/technical-guide.md](references/technical-guide.md)。
