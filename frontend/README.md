# R-CORE client document site

This React/Vite frontend is the replacement UI for the Flutter client site.
The CRM backend and document records remain in Supabase.

## Local setup

1. Install Node.js 20.19+ or 22.12+.
2. Copy `.env.example` to `.env.local`.
3. Set `VITE_SUPABASE_URL` and `VITE_SUPABASE_ANON_KEY`.
4. Run `npm install`, then `npm run dev`.

The Supabase anon key is public configuration, not a server secret. Keep Row
Level Security enabled and ensure the existing client-link access policies only
allow access to the intended document. Never put a Supabase service-role key in
this frontend.

## Docker deployment

From the repository root, copy `frontend/.env.example` to `.env`, set the
Supabase values, then run:

```sh
docker compose up --build -d
```

The site will be available on port `8080` by default. Set `PORT` in the root
`.env` to select another host port. To stop the service, run
`docker compose down`.

## Manual build and static hosting

Run `npm run build`; publish the generated `dist` directory to Nginx, Caddy, or
another static web server. Configure the web server to serve `index.html` for
unknown paths (SPA fallback), so existing links such as `/contract?id=...`
continue to work.

## Migration notes

Existing links and Supabase tables are mapped in `src/documents.ts`. This first
migration stage can load records, show already-generated PDFs, and navigate the
document types used by existing links. Signing is intentionally disabled until
the legacy PDF generators and the associated Supabase updates are ported and
tested; this avoids marking a document as signed without producing its required
signed PDF. Database reads request only the fields needed by the client pages;
signing codes are never fetched or displayed. The legacy site also records
device/IP metadata, which has not yet been ported.

For design review without database credentials, use these sample URLs with the
development server:

- `/contract?id=preview&preview=1`
- `/glavnayaStranica?id=preview&preview=1`
- `/dop?id=preview&preview=1`

The development preview uses sample data only and cannot change database
records. Before enabling signing in production, verify the existing Supabase
Row Level Security policies and implement code verification and PDF generation
through a trusted backend endpoint.
