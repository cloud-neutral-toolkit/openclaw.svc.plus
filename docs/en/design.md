# Design

This repository is a platform application with multiple user-facing integrations and should document product boundaries and extension surfaces.

Use this page to consolidate design decisions, ADR-style tradeoffs, and roadmap-sensitive implementation notes.

## Current code-aligned notes

- Documentation target: `openclaw.svc.plus`
- Repo kind: `platform-app`
- Manifest and build evidence: package.json (`openclaw`)
- Primary implementation and ops directories: `src/`, `scripts/`, `test/`, `packages/`
- Package scripts snapshot: `android:assemble`, `android:format`, `android:install`, `android:lint`, `android:lint:android`, `android:run`

## Existing docs to reconcile

- `design/kilo-gateway-integration.md`
- `experiments/plans/acp-persistent-bindings-discord-channels-telegram-topics.md`
- `experiments/plans/acp-thread-bound-agents.md`
- `experiments/plans/acp-unified-streaming-refactor.md`
- `experiments/plans/browser-evaluate-cdp-refactor.md`
- `experiments/plans/discord-async-inbound-worker.md`
- `experiments/plans/openresponses-gateway.md`
- `experiments/plans/pty-process-supervision.md`

## What this page should cover next

- Describe the current implementation rather than an aspirational future-only design.
- Keep terminology aligned with the repository root README, manifests, and actual directories.
- Link deeper runbooks, specs, or subsystem notes from the legacy docs listed above.
- Promote one-off implementation notes into reusable design records when behavior, APIs, or deployment contracts change.
