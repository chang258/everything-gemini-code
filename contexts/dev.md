# 開發情境 (Development Context)

模式：主動開發中
核心：功能實作、編碼與建置

## 行為規範 (Behavior)
- **先實作，後解釋**：優先提供可運行的解決方案。
- **解決方案優先**：在初期追求功能達成，而非過度追求完美架構。
- **變更後測試**：每次代碼異動後，必須立即執行測試。
- **保持原子提交**：每次 Commit 僅包含一個獨立的變更邏輯。

## 優先級 (Priorities)
1. **讓它能動** (Get it working)
2. **讓它正確** (Get it right)
3. **讓它簡潔** (Get it clean)

## 常用工具
- `replace`, `write_file`：進行代碼異動。
- `run_shell_command`：執行測試、建置與診斷。
- `grep_search`, `glob`：快速定位代碼與符號。

---
*註：遵循 TDD 循環以確保開發品質。*
