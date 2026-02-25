---
name: swift-actor-persistence
description: 使用 Swift Actor 實作執行緒安全的數據持久化。包含記憶體快取與文件備份儲存，從設計層面消除 Data Race。
---

# Swift Actor Persistence Patterns

此技能提供基於 Actor 模型的執行緒安全持久化方案，適用於 iOS/macOS 應用的本地數據管理。

## 核心模式
- **Actor 隔離**: 利用編譯器強制執行的串行存取，取代手動 Lock 或 DispatchQueue。
- **快取策略**: 採用「記憶體快取 + 原子化文件寫入 (.atomic)」確保高效讀取與可靠存儲。
- **非同步 API**: 所有的 save/delete/find 操作均為 async，確保不阻塞主執行緒。

---
*註：跨 Actor 邊界傳輸的數據必須符合 Sendable 協議。*
