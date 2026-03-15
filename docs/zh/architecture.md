# 架构

该仓库是一个平台型应用，包含多个用户侧集成，文档需要明确产品边界与扩展面。

本页作为系统边界、核心组件与仓库职责的双语总览入口。

## 与当前代码对齐的说明

- 文档目标仓库: `openclaw.svc.plus`
- 仓库类型: `platform-app`
- 构建与运行依据: package.json (`openclaw`)
- 主要实现与运维目录: `src/`, `scripts/`, `test/`, `packages/`
- `package.json` 脚本快照: `android:assemble`, `android:format`, `android:install`, `android:lint`, `android:lint:android`, `android:run`

## 需要继续归并的现有文档

- `concepts/architecture.md`
- `start/onboarding-overview.md`
- `zh-CN/concepts/architecture.md`

## 本页下一步应补充的内容

- 先描述当前已落地实现，再补充未来规划，避免只写愿景不写现状。
- 术语需要与仓库根 README、构建清单和实际目录保持一致。
- 将上方列出的历史 runbook、spec、子系统说明逐步链接并归并到本页。
- 随着目录结构、服务关系和集成依赖变化，持续同步图示与职责说明。
