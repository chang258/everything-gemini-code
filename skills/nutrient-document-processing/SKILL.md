---
name: nutrient-document-processing
description: 使用 Nutrient (DWS) API 處理文件。支援 PDF/Office 轉換、OCR 文字識別、隱私遮蔽 (Redaction) 與數位簽章。
---

# Nutrient Document Processing

此技能提供使用 Nutrient Processor API 進行企業級文件處理的整合模式。

## 支援功能
- **格式轉換**: PDF, DOCX, XLSX, HTML 與圖片間的互轉。
- **數據提取**: 從 PDF 中提取純文字、表格或表單欄位。
- **OCR 識別**: 支援 100+ 種語言的掃描檔辨識。
- **安全處理**: 自動偵測並遮蔽機密資訊（如 SSN, Email）。

## 整合方式
- **REST API**: 透過 `multipart/form-data` 發送指令。
- **MCP Server**: 支援 Gemini CLI 直接調用 DWS 服務。

---
*註：敏感資料應在處理後立即清理，確保符合隱私規範。*
