# User Guide

This repository is a platform application with multiple user-facing integrations and should document product boundaries and extension surfaces.

Use this page to document primary user/operator tasks, everyday workflows, and navigation to existing how-to material.

## Current code-aligned notes

- Documentation target: `openclaw.svc.plus`
- Repo kind: `platform-app`
- Manifest and build evidence: package.json (`openclaw`)
- Primary implementation and ops directories: `src/`, `scripts/`, `test/`, `packages/`
- Package scripts snapshot: `android:assemble`, `android:format`, `android:install`, `android:lint`, `android:lint:android`, `android:run`

## Existing docs to reconcile

- `cli/acp.md`
- `cli/agent.md`
- `cli/agents.md`
- `cli/approvals.md`
- `cli/browser.md`
- `cli/channels.md`
- `cli/clawbot.md`
- `cli/completion.md`

## What this page should cover next

- Describe the current implementation rather than an aspirational future-only design.
- Keep terminology aligned with the repository root README, manifests, and actual directories.
- Link deeper runbooks, specs, or subsystem notes from the legacy docs listed above.
- Prefer workflow-oriented examples and keep screenshots or terminal snippets aligned with the latest UI or CLI behavior.
