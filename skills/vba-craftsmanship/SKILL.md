---
name: vba-craftsmanship
description: 高階 VBA 系統架構與代碼美化規範。強制執行 4-space 縮排、顯式邏輯展開、高 DPI 佈局校準以及自動化代碼整理。
---

# VBA Craftsmanship Standards

此技能旨在將 VBA 程式碼提升至企業級工藝標準，確保其具備高度的可讀性與可維護性。

## 核心規範
- **縮排**: 強制採用 **4 空格 (4-space)**。嚴禁使用 Tab。
- **邏輯展開**: 嚴禁單行 `If...Then`。所有邏輯分支必須具備標準的 `If...End If` 結構。
- **命名空間**: 涉及跨模組調用時，必須核對 `DataTypes.bas` 與 `FieldMapping` 表。
- **間距**: 函數與函數之間必須保持至少兩行空行。

## 自動化工具 (One-Click Formatting)
技能內建了 `vba_format.py` 腳本，可一鍵統一代碼風格。

### 執行方式
使用 `run_shell_command` 執行：
```powershell
python "$HOME\.gemini\skills\everything-gemini-code\skills\vba-craftsmanship\scripts\vba_format.py" "src/vba/"
```

## UI/UX 工藝
- **Twips 換算**: 遵循 20 twips/pt。
- **DPI 重繪**: 變動控制項後執行 `target.width = target.width +/- 0.75` 觸發 Layout Kick。
- **穩定性**: 啟動表單前執行 `AppActivate Application.Caption` 與 `DoEvents`。

---
*註：此技能內容優先於通用的編碼建議。*

