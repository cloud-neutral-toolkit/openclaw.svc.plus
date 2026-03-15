# Vibe Coding Reference

This repository is a platform application with multiple user-facing integrations and should document product boundaries and extension surfaces.

Use this page to align AI-assisted coding prompts, repo boundaries, safe edit rules, and documentation update expectations.

## Current code-aligned notes

- Documentation target: `openclaw.svc.plus`
- Repo kind: `platform-app`
- Manifest and build evidence: package.json (`openclaw`)
- Primary implementation and ops directories: `src/`, `scripts/`, `test/`, `packages/`
- Package scripts snapshot: `android:assemble`, `android:format`, `android:install`, `android:lint`, `android:lint:android`, `android:run`

## Existing docs to reconcile

- `cli/agent.md`
- `cli/agents.md`
- `concepts/agent-loop.md`
- `concepts/agent-workspace.md`
- `concepts/agent.md`
- `concepts/multi-agent.md`
- `concepts/system-prompt.md`
- `concepts/typing-indicators.md`

## What this page should cover next

- Describe the current implementation rather than an aspirational future-only design.
- Keep terminology aligned with the repository root README, manifests, and actual directories.
- Link deeper runbooks, specs, or subsystem notes from the legacy docs listed above.
- Review prompt templates and repo rules whenever the project adds new subsystems, protected areas, or mandatory verification steps.
