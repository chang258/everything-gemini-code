# 簽證文件翻譯技術指南 (Technical Guide)

此指南提供簽證文件翻譯工具的環境配置與運作細節。

## 環境需求

### Python 必備庫
執行以下指令安裝圖像處理與 PDF 生成庫：
```bash
pip install pillow reportlab
```

### OCR 引擎配置 (三選一)

**1. macOS (推薦方案)**:
利用系統內建的 Vision 框架，速度最快：
```bash
pip install pyobjc-framework-Vision pyobjc-framework-Quartz
```

**2. 跨平台方案 (EasyOCR)**:
```bash
pip install easyocr
```

**3. Tesseract (傳統方案)**:
```bash
brew install tesseract tesseract-lang
pip install pytesseract
```

## 運作流程
1. **格式轉換**: 若為 HEIC 則轉為 PNG。
2. **校正旋轉**: 根據 EXIF 自動旋轉圖片。
3. **文字提取**: 自動嘗試可用的 OCR 方法。
4. **專業翻譯**: 將內容翻譯為符合簽證標準的英文。
5. **生成 PDF**: 產出包含原圖與譯文的雙頁 PDF。

---
*註：針對各國（美、英、澳、加、歐盟）的簽證申請，建議優先使用 macOS 內建 OCR 以獲得最高精確度。*
