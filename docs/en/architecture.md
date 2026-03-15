# Architecture

This repository is a platform application with multiple user-facing integrations and should document product boundaries and extension surfaces.

Use this page as the canonical bilingual overview of system boundaries, major components, and repo ownership.

## Current code-aligned notes

- Documentation target: `openclaw.svc.plus`
- Repo kind: `platform-app`
- Manifest and build evidence: package.json (`openclaw`)
- Primary implementation and ops directories: `src/`, `scripts/`, `test/`, `packages/`
- Package scripts snapshot: `android:assemble`, `android:format`, `android:install`, `android:lint`, `android:lint:android`, `android:run`

## Existing docs to reconcile

- `concepts/architecture.md`
- `start/onboarding-overview.md`
- `zh-CN/concepts/architecture.md`

## What this page should cover next

- Describe the current implementation rather than an aspirational future-only design.
- Keep terminology aligned with the repository root README, manifests, and actual directories.
- Link deeper runbooks, specs, or subsystem notes from the legacy docs listed above.
- Keep diagrams and ownership notes synchronized with actual directories, services, and integration dependencies.
