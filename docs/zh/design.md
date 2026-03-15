# 设计

该仓库是一个平台型应用，包含多个用户侧集成，文档需要明确产品边界与扩展面。

本页用于汇总设计决策、类似 ADR 的权衡记录，以及与路线图相关的实现说明。

## 与当前代码对齐的说明

- 文档目标仓库: `openclaw.svc.plus`
- 仓库类型: `platform-app`
- 构建与运行依据: package.json (`openclaw`)
- 主要实现与运维目录: `src/`, `scripts/`, `test/`, `packages/`
- `package.json` 脚本快照: `android:assemble`, `android:format`, `android:install`, `android:lint`, `android:lint:android`, `android:run`

## 需要继续归并的现有文档

- `design/kilo-gateway-integration.md`
- `experiments/plans/acp-persistent-bindings-discord-channels-telegram-topics.md`
- `experiments/plans/acp-thread-bound-agents.md`
- `experiments/plans/acp-unified-streaming-refactor.md`
- `experiments/plans/browser-evaluate-cdp-refactor.md`
- `experiments/plans/discord-async-inbound-worker.md`
- `experiments/plans/openresponses-gateway.md`
- `experiments/plans/pty-process-supervision.md`

## 本页下一步应补充的内容

- 先描述当前已落地实现，再补充未来规划，避免只写愿景不写现状。
- 术语需要与仓库根 README、构建清单和实际目录保持一致。
- 将上方列出的历史 runbook、spec、子系统说明逐步链接并归并到本页。
- 当行为、API 或部署契约发生变化时，把一次性实现笔记提升为可复用设计记录。
