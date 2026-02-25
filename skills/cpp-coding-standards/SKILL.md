---
name: cpp-coding-standards
description: 基於 C++ Core Guidelines 的編碼標準。涵蓋 RAII、資源管理、類別設計、異常處理與併發安全。
---

# C++ Coding Standards (Modern C++)

此技能強制執行現代、安全且具備高效能的 C++ 編碼慣例。

## 核心哲學
- **RAII 無處不在**: 資源必須由物件管理。
- **預設不可變性**: 優先使用 `const` 與 `constexpr`。
- **類型安全**: 避免 C 風格強制轉換與魔術數字。
- **值語義優先**: 優先於指針語義。

## 關鍵準則
- **資源管理**: 嚴禁裸 `new` / `delete`。使用 `unique_ptr` 或 `shared_ptr`。
- **類別設計**: 遵循「零法則 (Rule of Zero)」或「五法則 (Rule of Five)」。
- **函數設計**: 便宜複製的類型按值傳遞，其餘按 `const&`。
- **錯誤處理**: 使用異常表示失敗，避免輸出參數 (Out-parameters)。

---
*註：優先參考 isocpp.github.io 的最新標準。*
