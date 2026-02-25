---
name: springboot-tdd
description: Spring Boot 測試驅動開發策略。使用 JUnit 5, Mockito 與 Testcontainers 實作單元測試、Web 層測試與持久層整合測試。
---

# Spring Boot TDD Workflow

此技能提供系統化的 Spring Boot 測試方案，旨在達成 80% 以上的高品質覆蓋率。

## 測試類型
- **單元測試**: 使用 Mockito 隔離依賴，測試 Service 邏輯。
- **Web 層測試**: 使用 `@WebMvcTest` 與 MockMvc 驗證 Controller 路由與驗證邏輯。
- **整合測試**: 使用 `@SpringBootTest` 搭配 **Testcontainers**，在真實的資料庫環境中執行測試。

## 覆蓋率門檻
- 使用 **JaCoCo** 監測覆蓋率。
- 關鍵商務邏輯建議達成 100% 覆蓋。

---
*註：測試行為而非測試實作。確保測試是隔離且具備高度確定性的。*
