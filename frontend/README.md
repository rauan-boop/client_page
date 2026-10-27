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

## Build and static hosting

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
signed PDF. The legacy site also records device/IP metadata, which has not yet
been ported.

The current system also displays the stored signing code on the same page. This
behavior is retained for compatibility in this stage; it is not an independent
identity check. For production use, deliver a one-time code through a separate
channel and verify it through a trusted backend endpoint.
