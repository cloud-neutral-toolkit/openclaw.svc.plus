# Developer Guide

This repository is a platform application with multiple user-facing integrations and should document product boundaries and extension surfaces.

Use this page to document local setup, project structure, test surfaces, and contribution conventions tied to the current codebase.

## Current code-aligned notes

- Documentation target: `openclaw.svc.plus`
- Repo kind: `platform-app`
- Manifest and build evidence: package.json (`openclaw`)
- Primary implementation and ops directories: `src/`, `scripts/`, `test/`, `packages/`
- Package scripts snapshot: `android:assemble`, `android:format`, `android:install`, `android:lint`, `android:lint:android`, `android:run`

## Existing docs to reconcile

- `gateway/openai-http-api.md`
- `gateway/openresponses-http-api.md`
- `gateway/tools-invoke-http-api.md`
- `help/testing.md`
- `install/development-channels.md`
- `platforms/mac/dev-setup.md`
- `providers/claude-max-api-proxy.md`
- `reference/api-usage-costs.md`

## What this page should cover next

- Describe the current implementation rather than an aspirational future-only design.
- Keep terminology aligned with the repository root README, manifests, and actual directories.
- Link deeper runbooks, specs, or subsystem notes from the legacy docs listed above.
- Keep setup and test commands tied to actual package scripts, Make targets, or language toolchains in this repository.
