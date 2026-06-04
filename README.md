# Sultan Defense

Sultan Defense, savunma urunleri icin B2B katalog, tedarik talebi ve admin yonetim platformudur. 

## Proje Ozeti

- **Frontend:** Next.js 16, React 19, TypeScript, Tailwind CSS v4, next-intl
- **Backend:** Fastify, Bun, Drizzle ORM, MySQL
- **Admin panel:** Next.js, Radix/Shadcn tabanli yonetim arayuzu
- **Marka:** Sultan Defense, Imparatorluk Zirhi temasi (antrasit + mat altin + bordo)
- **Portlar:** backend `8090`, frontend `3040`, admin `3041`

## Klasorler

- `frontend/` — cok dilli kurumsal katalog sitesi
- `backend/` — API, seed, auth, teklif, katalog ve medya servisleri
- `admin_panel/` — icerik, katalog, teklif ve site ayarlari yonetimi
- `docs/content/` — resmi site icerigi ve sayfa haritasi
- `docs/brand/` — marka tokenlari ve logo varliklari
- `deploy/` — deploy ve coming-soon varliklari

## Calistirma

Her uygulamada Bun kullanilir.

```bash
cd backend
bun install
bun run build
bun run dev
```

```bash
cd frontend
bun install
bun run dev
```

```bash
cd admin_panel
bun install
bun run dev
```

## Seed

DB sema degisikliklerinde lokal `ALTER TABLE` kullanilmaz. Seed SQL dosyalari duzenlenir ve fresh seed calistirilir.

```bash
cd backend
bun run build
bun run db:seed:sultandefense:fresh
```

## Portfolio Metadata

Bu repo, `/home/orhan/Documents/Projeler/PROJECT_PORTFOLIO_STANDARD.md` standardina gore kokte `project.portfolio.json` dosyasi tasir. Portfolio seed generator bu dosyadan proje basligi, kategori, servisler, teknolojiler ve ozet bilgisini okur.

## Calisma Kurallari

- Sadece `main` branch kullanilir.
- Calismadan once `git pull --rebase origin main`.
- Is bittikce kucuk commit ve `git push origin main`.
- `.env` dosyalari commit edilmez.
- Marka temizligi icin ana takip dosyasi: `REBRAND_CHECKLIST.md`.
