# `docs-agent` Integration

`docs-agent` is the document-domain downstream agent for `docs.svc.plus`.

## Responsibilities

- Read Cloud-Neutral docs and blogs from `docs.svc.plus`
- Search document content and return structured matches
- Produce document update plans
- Apply document changes only after gateway confirmation

## Expected Routing

- `console.svc.plus` talks to the gateway
- gateway routes document-domain intents to `docs-agent`
- `docs-agent` talks to `docs.svc.plus /api/v1/agent/invoke`

## Required Policy

- `docs.search`, `docs.read_page`, `docs.list_collections`, `blogs.search`, `blogs.read_post`: read-only
- `docs.plan_update`: allowed without apply
- `docs.apply_update`: confirmation required
- `docs.reload`: service/admin only

## Security Notes

- Keep `docs-agent` limited to `knowledge/docs/**` and `knowledge/content/**`
- Do not expose `docs.svc.plus` directly to browsers
- Pass `X-Service-Token` on every service-to-service request
