# CLAUDE.md — Sultan Defense

Bu proje **vistainsaat** kod tabanindan klonlanmis ve **sultandefense.com** (defans/savunma sanayi katalog sitesi) icin yeniden markalanmaktadir.

Repo: `https://github.com/Orhanguezel/defense.git`

## 🔴 BRANCH KURALI — KESIN (tum ajanlar icin)

> **Tek branch ile calisilir: `main`.**
>
> - Tum commit'ler dogrudan `main` branch'ine yazilir. **Feature/dev branch ACILMAZ.**
> - Bu kural Claude Code, Codex, Copilot, Antigravity ve diger tum ajanlar icin gecerlidir.
> - Cakisma onleme: calismaya baslamadan **once `git pull --rebase origin main`**, is bittikce **kucuk commit + hemen `git push`**.
> - Ayni dosyada ayni anda iki ajan calismaz (workspace orkestrasyon kurali gecerli).
> - Uzun surecek isten once kisa bir "su an X dosyasinda calisiyorum" notu birak.

## Stack

- **Frontend:** Next.js 16, React 19, TS strict, Tailwind v4, next-intl (i18n)
- **Admin panel:** Next.js, Shadcn/Radix
- **Backend:** Fastify + Bun + Drizzle ORM + MySQL
- **Deploy:** sunucu `187.77.79.59` (srv1731955, Ubuntu 24.04), nginx, Cloudflare proxy

## Onemli — Marka Temizligi Devam Ediyor

Kod tabaninda hala **vistainsaat / vista / insaat** izleri var (125+ dosya).
Yapilacaklar: [REBRAND_CHECKLIST.md](REBRAND_CHECKLIST.md). Her tamamlanan maddeyi isaretle.

## DB Schema Kurali (workspace genel kurali gecerli)

- Lokal'de **`ALTER TABLE` YASAK**. Sema degisikligi `src/db/seed/sql/0XX_*_schema.sql` icine
  dogrudan eklenir, sonra `bun run build && bun run db:seed:*:fresh`.

## Portlar (rebrand sonrasi netlesecek — REBRAND_CHECKLIST'e bak)

- Sunucuda 80/443 su an "Cok Yakinda" statik sayfasi (nginx). Uygulama portlari deploy asamasinda belirlenecek.
