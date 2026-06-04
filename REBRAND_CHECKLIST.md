# Marka Temizligi & Rebrand Checklist — vistainsaat → Sultan Defense

> Bu kod tabani **vistainsaat** (insaat sirketi) projesinden klonlandi.
> Hedef: **sultandefense.com** — defans / savunma sanayi ürün katalog sitesi.
> Repo: `https://github.com/Orhanguezel/defense.git` · **Tek branch: `main`.**

**Tarama ozeti (2026-06-04):** `vistainsaat` → 125 dosya · `vista` → 188 · `insaat`/`İnşaat` → ~127
Dagilim: 35 `.ts`, 30 `.sql` (seed), 29 `.tsx`, 7 `.json`, 6 `.mjs`, 3 `.cjs`, 3 `.production`, 2 `.py`, ...

> 📄 **Site içerik kaynagi (resmi metin):** [`docs/content/`](docs/content/) — tum sayfa metinleri,
> meta title/description, 10 ürün kategorisi, sirket bilgileri. Seed/locale/page doldururken bunu kullan.

Her madde tamamlaninca `[ ]` → `[x]`. Onceliklendirilmis; **Faz 0 bloke edicidir.**

---

## ✅ Faz 0 — Altyapi & Guvenlik (TAMAMLANDI / devam)

- [x] 3 repo kopyalandi (backend, admin_panel, frontend) — node_modules/.next/uploads haric
- [x] Root `.gitignore` — tum `.env*` (sadece `.env.example` haric), secret koruması
- [x] `git init` + remote `origin = defense.git`, `main` branch, LICENSE uzlastirildi
- [x] Branch kurali yazildi: `CLAUDE.md`, `AGENTS.md`, `.github/copilot-instructions.md`
- [ ] **Secret rotation** — vistainsaat'ten gelen TUM secret'lar gecersiz sayilmali, yenisi uretilmeli:
  - [ ] `JWT_SECRET`, `COOKIE_SECRET` (yeni rastgele uret)
  - [ ] `DB_PASSWORD` (sultandefense DB icin yeni)
  - [ ] `CLOUDINARY_*` (sultandefense hesabi/folder)
  - [ ] `GOOGLE_CLIENT_ID/SECRET` (yeni OAuth app, redirect URI = sultandefense)
  - [ ] `RECAPTCHA_*` (yeni site key — sultandefense.com domaini)
  - [ ] `GROQ_API_KEY` (AI destek — gerekirse)
  - [ ] `SMTP_*` ve `MAIL_FROM` — **kopyada `info@koenigsmassage.com` kalmis (yanlis), duzelt**

---

## Faz 1 — Kimlik, Config, Portlar

- [ ] `package.json` `name` alanlari: `vistainsaat-{backend,admin-panel,frontend}` → `sultandefense-*`
- [ ] **Portlar** (vistainsaat: backend `8086`, frontend `3030`, admin `3004`) → sultandefense portlari belirle ve uygula:
  - [ ] `backend/.env` PORT, `backend/ecosystem.config.cjs`
  - [ ] `frontend/ecosystem.config.cjs` (PORT 3030)
  - [ ] `admin_panel/ecosystem.config.cjs` (PORT 3004)
- [ ] **PM2 app isimleri** (`ecosystem.config.cjs` x3): `vistainsaat-*` → `sultandefense-*`
- [ ] **Domain/URL** tum env + config:
  - [ ] `PUBLIC_URL`, `FRONTEND_URL`, `PUBLIC_API_BASE`, `CORS_ORIGIN`
  - [ ] `NEXT_PUBLIC_API_URL`, `NEXT_PUBLIC_SITE_URL` (admin + frontend `.env`)
  - [ ] `vistainsaat.com` → `sultandefense.com`
- [ ] `frontend/next.config.ts` & `admin_panel/next.config.mjs`: image `remotePatterns`/domains, rewrites
- [ ] `frontend/project.portfolio.json` → sultandefense metadata (PROJECT_PORTFOLIO_STANDARD'a uygun)
- [ ] Analytics: `NEXT_PUBLIC_GA_ID`, `NEXT_PUBLIC_GTM_*` (vistainsaat hesaplari → sultandefense veya kaldir)

---

## Faz 2 — Backend Kod

- [ ] `backend/src/core/env.ts` — vistainsaat default/referanslari
- [ ] `backend/src/core/vista-mail.ts` — dosya adi + icerik (mail sablonu, gonderen kimligi, logo)
- [ ] `backend/package.json` (name + varsa repo/desc)
- [ ] Modul controller/schema/validation icindeki `vistainsaat` stringleri:
      `modules/products`, `modules/offer`, `modules/services`, `modules/gallery`
- [ ] `DB_NAME=vistainsaat` → `sultandefense` (env + varsa kod referansi)

---

## Faz 3 — Veritabani / Seed (30 SQL dosyasi)

> `backend/src/db/seed/sql/` altinda `*_vistainsaat_*` dosyalari. **Sema vs Icerik ayrimi onemli:**

**Sema (yapisal — yeniden kullanilabilir, sadece isim/yorum temizligi):**
- [ ] `008_*_catalog_schema.sql`, `009_*_products_schema.sql`, `010_*_references_schema.sql`,
      `299_*_gallery_schema.sql` — tablo yapilari kalir, `vistainsaat` isim/yorum temizle

**Icerik (vistainsaat'e ozel DATA — defans icerigiyle DEGISTIRILECEK):**
- [ ] `300_categories`, `306_products`, `310_brand_references`, `307_gallery` →
      **müsterinin defans ürün kategorileriyle doldur** (kaynak: repo icindeki ürün gorselleri klasoru —
      Ballistic Protection, Naval Marine Systems, Tactical Gear, Surveillance, Power/Battery, vb.)
- [ ] `301_site_settings`, `311_admin_settings`, `313_general_settings`, `314_branding_storage` →
      sultandefense logo/renk/iletisim/SEO
- [ ] `304_blog`, `310_news`, `309_news_categories`, `305_pages`, `302_menu_items`,
      `303_footer_sections`, `312_seo_pages` → defans icerigi (veya bos baslat, admin'den gir)
- [ ] `315_hero_video`, `316_offers/offer_settings`, `317_smtp_sync`, `131_storage_assets` → sultandefense
- [ ] Tum dosya adlarini `*_sultandefense_*` olarak yeniden adlandir (seed loader sirasini koru)
- [ ] DB adi `sultandefense` ile `bun run build && bun run db:seed:*:fresh` test

---

## Faz 4 — Admin Panel

- [ ] Logolar: `admin_panel/public/logo/vista-logo-{light,dark}.svg`, `png/vista_logo_512.png`
      → sultandefense logosu (dosya adlari + referanslar)
- [ ] Locale dosyalari (marka metni): `src/locale/{tr,en,de}.json` — vistainsaat/vista/insaat metinleri
- [ ] `src/navigation/sidebar/sidebar-items.ts`, `src/server/fetch-branding.ts`
- [ ] `src/integrations/shared/product_admin.types.ts`, `useAdminLocales.ts`
- [ ] Browser title/manifest/favicon

---

## Faz 5 — Frontend (Site)

- [ ] **i18n locale dosyalari (19 dil!):** `frontend/public/locales/*.json`
      (tr, en, de, fr, it, es, pt, nl, ru, uk, ar, ja, zh, pl, da, sv, ...) — tüm marka metinleri
- [ ] vistainsaat dil seti defans icerigine uygun mu? Gereksiz dilleri sadelestir (karar)
- [ ] Logo / favicon / `icon.tsx` / `apple-icon.tsx` / `opengraph-image.tsx`
- [ ] `frontend/public/media/` — vistainsaat gorselleri (hero-video.mp4 ~10MB, news/* insaat fotograflari)
      → defans gorselleri ile degistir
- [ ] `src/features/projects/products.service.ts` ve urun/proje bilesenleri
- [ ] `index.html`, `manifest.ts`, `robots.ts`, sitemap — sultandefense
- [ ] SEO meta: title/description/OG/JSON-LD (Organization → Sultan Defense)
- [ ] `src/i18n/locale-settings.ts`, `app/api/monitoring/seo-issues/route.ts`
- [ ] `carbon-fiber.jpg` ve diger karbonkompozit/insaat artiklari temizle

---

## Faz 6 — Deploy / Altyapi

- [ ] `frontend/nginx-vistainsaat.conf` → `nginx-sultandefense.conf` (server_name, port, root)
- [ ] Sunucuda (`187.77.79.59`) deploy: su an 80/443 statik "Cok Yakinda" sayfasi
      → uygulama devreye alininca nginx reverse proxy (frontend+admin+backend)
- [ ] DB kurulumu (MySQL) + seed
- [ ] Cloudflare: gerekli alt domainler (admin., api.) + SSL (Full strict icin origin cert)
- [ ] PM2 ile 3 servis, `pm2 save`

---

## Faz 7 — Temizlik / Organizasyon

- [ ] Repo kokundeki ic `sultandefense.com/` ürün gorselleri klasorunu mantikli yere tasi
      (or. `assets/urun-kaynak/` veya backend uploads seed kaynagi) ve adlandirmayi netlestir
- [ ] `__MACOSX/` sil (zip cöpü — gitignore'da ama diskten de sil)
- [ ] vistainsaat'e ozel md/dok dosyalari gözden gecir
- [ ] Final tarama: `grep -ri "vista\|insaat" --exclude-dir=node_modules` → 0 olmali
- [ ] Lighthouse + SEO denetimi (sultandefense.com)

---

## Onerilen Yontem (toplu degisim DIKKATLI)

`vista`/`insaat` cok genel; **kör sed/replace YAPMA** (kod bozar, `vistaButton` gibi degisken adlari, üçüncü parti string'ler olabilir). Yontem:
1. Once **config + env + isim** (Faz 1-2) — düsük riskli, net.
2. Sonra **icerik/seed/locale** (Faz 3-5) — dosya dosya, anlamli degisim.
3. Her fazdan sonra `bun run build` + calistir + commit (main) + push.
