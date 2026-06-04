# Marka Temizligi & Rebrand Checklist — → Sultan Defense

> Kod tabani **vistainsaat** (insaat) projesinden klonlandi; admin panel ise **Ensotek**'ten turedi.
> Hedef: **sultandefense.com** — defans / savunma sanayi ürün katalog sitesi.
> Repo: `https://github.com/Orhanguezel/defense.git` · **Tek branch: `main`.**

> 🎨 **Marka (GUNCEL — 2026-06-04): "İmparatorluk Zırhı"** — Antrasit `#1A1A1D` + Titanyum `#2D3134`
> zemin, **Mat Osmanlı Altını `#C5A880`** vurgu, **Derin Bordo `#7A1B22`** ikincil. Koyu+açık.
> Kaynak: [`docs/brand/`](docs/brand/) (tokens.css, logo/, brand-guidelines.md). Logo: resmi **wordmark**.
> _(Eski "Çelik & Cyan" ve "kalkan+SD" GECERSIZ.)_
>
> 📄 **Site içerik kaynagi:** [`docs/content/`](docs/content/) — tum sayfa metinleri, 10 kategori, sirket bilgileri.

---

## 📊 DURUM ÖZETİ (2026-06-04)

**✅ Tamamlanan:**
- Faz 0 altyapi (git/main/origin, .gitignore secret koruma, branch kurali)
- Faz 1 kimlik/config/port (8090/3040/3041, package.json, ecosystem, .env.example, next.config, portfolio)
- Marka kimligi (İmparatorluk Zırhı tokens + resmi wordmark logo + favicon/apple-touch paketi)
- Tema uygulama: frontend `globals.css` + admin `globals.css` cyan→altin, icon/og/manifest/splash
- Logolar: admin+frontend `public/logo` gercek wordmark; eski cyan/vista logolari silindi
- Seed SQL **dosya adlari** → `*_sultandefense_*` (27 dosya); `vista-mail.ts` yenilendi; media görselleri
- Gorsel QA: admin login + frontend home (altin/antrasit dogrulandi); kritik CSS bug fix

**⏳ Kalan (asagidaki fazlar):** ensotek izleri (83 dosya!), vista/insaat icerik (~46), secret rotation,
seed **icerik** doldurma (defans), locale icerikleri (19 dil), nginx conf, Faz 6 deploy, final dogrulama.

---

## 👥 İŞ BÖLÜMÜ

| Alan | Sorumlu |
|------|---------|
| Bulk string temizligi (ensotek/vista/insaat/kompozit/koenig → sultandefense) src icinde | **Codex** |
| Seed **icerik** doldurma (defans ürün/kategori/sayfa) `docs/content` + ürün gorsellerinden | **Codex** |
| Locale icerikleri (19 dil) inşaat→defans metin | **Codex** |
| Kalan SEO/meta/component copy | **Codex** |
| Proje dokumanlari (CLAUDE.md x2, admin CLAUDE.md) rebrand | **Claude** |
| Faz 6 deploy (sunucu/nginx/Cloudflare/PM2) | **Claude** |
| Secret rotation iskelesi + rehber | **Claude** |
| Codex ciktisinin review + final `grep=0` dogrulama + Lighthouse | **Claude** |

> Codex prompt'u: [`docs/CODEX_PROMPT.md`](docs/CODEX_PROMPT.md). **Kör sed/replace YASAK** (bkz. altta).

---

## Faz 0 — Secret Rotation (Claude iskele + kullanici degerleri)
- [ ] `JWT_SECRET`, `COOKIE_SECRET` (yeni rastgele)
- [ ] `DB_PASSWORD` (sultandefense DB)
- [ ] `CLOUDINARY_*`, `GOOGLE_CLIENT_ID/SECRET`, `RECAPTCHA_*`, `GROQ_API_KEY`
- [ ] `SMTP_*` + `MAIL_FROM` → `info@sultandefense.com` (kopyada `koenigsmassage.com` kalmis)
- [ ] lokal `.env` / `.env.production` (gitignore'da) sultandefense degerleriyle

## Faz 1 — Kimlik / Config / Port ✅ TAMAMLANDI
> Portlar: backend `8090` · frontend `3040` · admin `3041`
- [x] package.json name'ler, ecosystem (PM2+port+cwd), .env.example x3, next.config x2, portfolio.json
- [ ] Analytics ID'leri (`NEXT_PUBLIC_GA_ID`, `GTM_*`) — vistainsaat hesaplari → sultandefense/kaldir **(Codex)**

## Faz 2 — Backend Kod **(Codex)**
- [x] `vista-mail.ts` yenilendi · seed dosya adlari sultandefense
- [ ] `backend/src` icindeki kalan `vistainsaat`/`ensotek`/`kompozit` stringleri (28 ensotek dosyasi backend/src)
- [ ] `core/env.ts` default'lari, modul controller/schema/validation marka stringleri
- [ ] **`module_key` / `prefix`** kuplaji: `vistainsaat`/`ensotek` → `sultandefense` (backend seed ↔ frontend API ESZAMANLI)

## Faz 3 — Seed İÇERİK doldurma **(Codex)**
> Dosya adlari hazir. Simdi DATA defans icerigiyle doldurulacak (kaynak: `docs/content` + ürün gorselleri).
- [ ] `300_categories`, `306_products`, `307_gallery`, `310_brand_references` → 10 defans kategorisi
- [ ] `301/311/313/314 settings/branding` → sultandefense (logo=wordmark, renk=altin/antrasit, iletisim)
- [ ] `304_blog`,`305_pages`,`302_menu`,`303_footer`,`312_seo_pages` → defans (veya bos + admin'den)
- [ ] DB `sultandefense` ile `bun run build && bun run db:seed:sultandefense:fresh` (ALTER YASAK)

## Faz 4 — Admin Panel ✅ kismen (tema/logo) — **kalan: ensotek (Codex)**
- [x] Logolar wordmark; `globals.css` altin/antrasit; login paneli rebrand
- [ ] **Ensotek izleri: admin_panel/src 48 dosya** — `--logo-coral` isimleri legacy (deger altin), comment/string/CLAUDE.md
- [ ] Locale `src/locale/{tr,en,de}.json` marka metni; sidebar-items; fetch-branding; product_admin.types
- [ ] Browser title/manifest/favicon (app-config done; dogrula)

## Faz 5 — Frontend (Site) **(Codex)** — tema ✅, içerik kalan
- [x] Tema/token altin; icon/apple-icon/og/twitter/manifest/splash; logo
- [ ] **i18n locale (19 dil)** `public/locales/*.json` — "inşaat/construction" → defans metin (hero: tr.json "LİDER İNŞAAT FİRMASI")
- [ ] Gereksiz dilleri sadelestir (karar — defans icin hangi diller?)
- [ ] `src/features/projects/products.service.ts` + ürün/proje bilesenleri, SEO meta/JSON-LD (Organization)
- [ ] `carbon-fiber.jpg` (frontend kokunde) + diger kompozit/insaat artiklari sil

## Faz 6 — Deploy / Altyapi **(Claude)**
- [ ] `frontend/nginx-vistainsaat.conf` → `nginx-sultandefense.conf` (server_name/port/root)
- [ ] Sunucu `187.77.79.59`: nginx reverse proxy (8090/3040/3041), MySQL+seed, PM2, `pm2 save`
- [ ] Cloudflare alt domain (api./admin.) + SSL (Full strict icin origin cert)

## Faz 7 — Temizlik / Final **(Claude)**
- [ ] Kok `sultandefense.com/` ürün gorsel klasoru → mantikli yer; kokteki `SAVRONIK_*_premium.*` duzenle
- [ ] vistainsaat/ensotek md/dok gozden gecir (CLAUDE.md x2 — Claude)
- [ ] **Final tarama:** `grep -riE "vista|insaat|ensotek|kompozit|koenig" --exclude-dir=node_modules` → 0
- [ ] Lighthouse + SEO denetimi (canli)

---

## ⚠️ Yontem — toplu degisim DIKKATLI
`vista`/`insaat`/`ensotek` cok genel; **kör sed/replace YAPMA** (degisken adi `vistaButton`, 3.parti string,
`--logo-coral` gibi token isimleri kod tarafindan referanslanir → kirar). Dosya bazli, anlamli degisim.
Her fazdan sonra ilgili app `bun run build` + commit (main) + push. `*/` iceren CSS yorumlarindan kacin.
