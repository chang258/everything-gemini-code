---
name: java-coding-standards
description: Java 17+ 編碼標準。專注於 Spring Boot 服務、不可變性 (Records)、Optional 使用規範、串流 (Streams) 最佳實踐及專案結構。
---

# Java Coding Standards (Spring Boot)

此技能定義了在 Spring Boot 生態系中編寫可讀、可維護且現代的 Java 代碼標準。

## 核心準則
- **不可變優先**: 優先使用 `record` 與 `final` 欄位。
- **失敗提早 (Fail Fast)**: 拋出具備明確業務語義的自訂異常。
- **防禦性程式碼**: 嚴格處理 Null，輸入驗證使用 Bean Validation (`@NotNull`)。

## 慣用語法
- **Optional**: 僅在 `find*` 方法的回傳值使用。避免使用 `.get()`，優先選用 `.map()` 或 `.orElseThrow()`。
- **Streams**: 保持 Pipeline 短小精悍。複雜邏輯應拆回循環以利於偵錯。
- **型別安全**: 嚴禁使用原始型別 (Raw Types)，善用泛型邊界。

---
*註：一致性的命名與結構優於微小的效能優化。*
