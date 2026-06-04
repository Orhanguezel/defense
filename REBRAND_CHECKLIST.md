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

**🎉 REBRAND + DEPLOY ESASEN TAMAMLANDI (2026-06-05).** App `src`/`public` marka grep = **0**;
site **https://sultandefense.com** + **admin.sultandefense.com** CANLI; seed dolu, logo/görseller tamam.

**⏳ GERÇEKTE KALAN (post-launch, çoğu harici hesap gerektirir):**
1. **3. parti secret'lar** (boş/kapalı): Cloudinary (görsel yükleme), Google OAuth (login), SMTP (iletişim maili),
   reCAPTCHA, Groq (AI chat) → kullanıcı hesap/anahtar verince aktive edilir. `docs/SECRET_ROTATION.md`.
2. **Lighthouse + SEO** denetimi (canlı — henüz çalışmadı).
3. **Hero video** (placeholder, eksik) — montaj üret / video gönder / kapat (karar bekliyor).
4. (Opsiyonel) Cloudflare **Full strict** için Origin CA cert; Analytics GA/GTM ID'leri (şu an boş).

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
> Rehber: [`docs/SECRET_ROTATION.md`](docs/SECRET_ROTATION.md) (gercek secret icermez)
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

## Faz 6 — Deploy / Altyapi **(Claude)** ✅ CANLI (2026-06-05)
- [x] nginx prod config `deploy/nginx/sultandefense.conf` (3040/8090/admin 3041, origin cert)
- [x] Sunucu `187.77.79.59`: Node20/Bun/PM2/MariaDB kuruldu, DB+seed (58 tablo), PM2 x3 + `pm2 save`/startup
- [x] nginx cutover (coming-soon → app config), **https://sultandefense.com CANLI**, admin.sultandefense.com 200
- [x] Cloudflare `admin.` DNS + SSL Full (origin self-signed cert)
- [ ] Full **strict** icin Origin CA cert (opsiyonel sertlestirme)
- [ ] Gercek secret'lar (Cloudinary/Google/SMTP/reCAPTCHA) — su an bos/kapali (mail/upload/AI devre disi)

## Faz 7 — Temizlik / Final **(Claude)** ✅ esasen TAMAMLANDI
- [x] Kok ic `sultandefense.com/` ürün gorsel klasoru → `docs/product-images/` (SAVRONIK dahil)
- [x] vistainsaat/ensotek md/dok gozden gecirildi (CLAUDE.md x2, README, .gitignore, dev notlar; all-schemas.txt silindi)
- [x] **Final tarama:** app `src`/`public` + repo grep = **0** (vista/insaat/ensotek/kompozit)
      _(istisna: bilincli legacy notlar — admin globals.css/CLAUDE.md `--logo-coral`; ve doc rehber dosyalari)_
- [x] Kozmetik identifier: `VISTA_BRAND/PREFIX`→`BRAND_KEY/PREFIX`, `KompozitAdminRouteGate`→`AdminRouteGate`
- [ ] Lighthouse + SEO denetimi (canli — **deploy sonrasi**)

---

## ⚠️ Yontem — toplu degisim DIKKATLI
`vista`/`insaat`/`ensotek` cok genel; **kör sed/replace YAPMA** (degisken adi `vistaButton`, 3.parti string,
`--logo-coral` gibi token isimleri kod tarafindan referanslanir → kirar). Dosya bazli, anlamli degisim.
Her fazdan sonra ilgili app `bun run build` + commit (main) + push. `*/` iceren CSS yorumlarindan kacin.
