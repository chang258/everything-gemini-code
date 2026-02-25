---
name: frontend-patterns
description: 現代前端開發模式。涵蓋 React 組件組合 (Composition)、狀態管理、效能優化 (Memoization)、虛擬列表與無障礙網頁設計 (A11y)。
---

# Frontend Development Patterns

此技能定義了 React 與現代前端開發的核心模式，旨在提升組件的複用性、渲染效能與使用者體驗。

## 核心組件模式
- **組合優於繼承 (Composition over Inheritance)**: 使用 `children` 與插槽模式建立彈性 UI。
- **複合組件 (Compound Components)**: 透過 Context 共享狀態（如 Tabs, Select）。
- **自訂 Hook (Custom Hooks)**: 封裝邏輯，保持組件純粹。

## 效能與優化
- **Memoization**: 合理使用 `useMemo`, `useCallback` 與 `React.memo`。
- **虛擬化 (Virtualization)**: 針對超長列表使用 `@tanstack/react-virtual` 減少 DOM 節點。
- **代碼分割 (Code Splitting)**: 利用 `lazy` 與 `Suspense` 實作按需載入。

---
*註：前端開發應平衡工程複雜度與使用者體驗，優先考慮 A11y 與響應式佈局。*
