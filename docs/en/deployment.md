# Deployment

This repository is a platform application with multiple user-facing integrations and should document product boundaries and extension surfaces.

Use this page to standardize deployment prerequisites, supported topologies, operational checks, and rollback notes.

## Current code-aligned notes

- Documentation target: `openclaw.svc.plus`
- Repo kind: `platform-app`
- Manifest and build evidence: package.json (`openclaw`)
- Primary implementation and ops directories: `src/`, `scripts/`, `test/`, `packages/`
- Package scripts snapshot: `android:assemble`, `android:format`, `android:install`, `android:lint`, `android:lint:android`, `android:run`

## Existing docs to reconcile

- `cli/setup.md`
- `cli/uninstall.md`
- `install/ansible.md`
- `install/bun.md`
- `install/development-channels.md`
- `install/docker.md`
- `install/exe-dev.md`
- `install/fly.md`

## What this page should cover next

- Describe the current implementation rather than an aspirational future-only design.
- Keep terminology aligned with the repository root README, manifests, and actual directories.
- Link deeper runbooks, specs, or subsystem notes from the legacy docs listed above.
- Verify deployment steps against current scripts, manifests, CI/CD flow, and environment contracts before each release.
