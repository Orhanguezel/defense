# Codex Görev Brief'i — Yeni Frontend Geçişi (bereketfide → Sultan Defense)

> **Bu brief, frontend için `docs/CODEX_PROMPT.md`'nin yerini alır.** Eski "frontend'i yerinde rebrand et"
> planı GEÇERSİZ. Yeni durum: bereketfide için hazırlanmış zengin frontend, sultandefense'e dönüştürülüyor.
> Master plan + faz/checklist: **[../FRONTEND_SWAP_PLAN.md](../FRONTEND_SWAP_PLAN.md)**.

## Bağlam (kısa)
- Repo: `github.com/Orhanguezel/defense.git` · **TEK BRANCH `main`** (başka branch açma).
- Çalışmadan önce `git pull --rebase origin main`; iş bittikçe **küçük commit + `git push`**.
- Hedef: **sultandefense.com** — defans **tedarik/ihracat** B2B katalog + **RFQ (teklif)** sitesi (üretici DEĞİL, kuruluş 1996).
- Frontend kaynağı **bereketfide** (tarım/fide). Tüm marka/sektör izleri temizlenecek.
- Portlar (KESIN): backend **8090** (`/api`, v1 yok), frontend **3040**, admin **3041**.
- Marka: "İmparatorluk Zırhı" — Antrasit `#1A1A1D`, Titanyum `#2D3134`, Mat Altın `#C5A880`, Bordo `#7A1B22`. Token: `docs/brand/tokens.css`.
- İçerik tek doğru kaynak: `docs/content/site-content-en.md` + `docs/content/README.md` (sayfa→slug, 10 kategori, şirket bilgisi).

## 🔴 KURALLAR
1. **Kör `sed`/global replace YASAK.** `bereket`/`fide` değişken adı / 3. parti string / token isminde geçebilir. Dosya bazlı, anlamlı değişim.
2. Anahtar **adlarını** değil **değerlerini** değiştir (`module_key`, `item_type`, `prefix`, `site_id`, `source`).
3. Her faz sonunda `bun run build` + `bun run dev` ile çalıştığını doğrula + commit + push.
4. `*/` içeren CSS yorumu yazma (frontend'i kırar). `.env*` commit etme (gitignore).
5. **Faz 0 (dizin swap), Faz 1 (.env), Faz 4 (tema/logo) → CLAUDE yapar.** Sen Faz 2, 3, 5, 6 (build) yaparsın. Tema token/logo dosyalarına dokunma.

---

## SENİN FAZLARIN

### Faz 2 — Backend ayrım anahtarları (KRİTİK — veri akışının kalbi)
`bereketfide` → `sultandefense`, `bereketfide__` → `sultandefense__`. Önce `grep -rn "bereketfide" src/`.
- `src/features/projects/products.service.ts` — `item_type` (2 yer).
- `src/features/categories/categories.service.ts`, `src/features/galeri/gallery.service.ts` — `module_key`.
- `src/features/contact/contact.service.ts`, `offer/offer.service.ts`, `newsletter/newsletter.service.ts` — `source`.
- `src/components/sections/{ContactForm,OfferForm,NewsletterForm}.tsx`, `src/app/api/monitoring/seo-issues/route.ts` — `source`.
- `src/features/site-settings/index.ts`, `src/i18n/locale-settings.ts`, `src/i18n/server.ts` — `prefix`, `site_id`, `module_key`.
- `src/lib/related-content.ts`, `src/lib/site-search.ts`, `src/app/sitemap.ts` — modül anahtarları.
- ⚠️ **Backend kuplajı:** Backend seed'inde `sultandefense` profili dolu olmalı (REBRAND_CHECKLIST Faz 2-3). İçerik gelmiyorsa burası.

### Faz 3 — Desteksiz sayfa/modül silme
Backend desteği yok + içerik planında yok. Sade B2B katalog+RFQ hedefi.
- **Sil (route, `src/app/[locale]/`):** `(bayi)/`, `bayi-girisi/`, `bayi-kayit/`, `bayi-odeme/`, `bayi-agi/`, `kataloglar/`, `kampanya/`, `fiyat-listesi/`, `bilgi-bankasi/`, `ekim-takvimi/`, `insan-kaynaklari/`.
- **Sil (modül):** `src/modules/bayi/`, `src/modules/dealer-network/`.
- **Sil (tarımsal):** `src/lib/bereketfide-product-agronomy.ts`, `components/sections/HalPriceTicker*.tsx`, `components/widgets/FrostWarningWidget.tsx`, `components/catalog/` (referanssızsa).
- **Link temizliği:** Header/Footer/widget hardcoded linkleri; `sitemap.ts` + `robots.ts`; footer ekosistem linkleri (vistaseeds/tarımiklim/tarımdabugun/tarımansiklopedisi).
- **TUT:** `/`, `urunler`(+`[slug]`), `hizmetler`(+`[slug]`), `hakkimizda`, `iletisim`, `teklif`, `galeri`(+`[slug]`), `referanslar`, `legal`(+`[slug]`), `blog`/`haberler`, `arama`.
- **YENİ EKLE:** `/certifications`, `/faq` (içerik planında var — statik veya `custom_pages`).
- Silme sonrası `bun run build` → kırık import/route yok.

### Faz 5 — İçerik & SEO (Faz 2 ve 3 bitince)
Kaynak: `docs/content/`.
- Display "Bereket Fide" → "Sultan Defense": `seo/helpers.ts`, `layout.tsx`, `[locale]/layout.tsx`, sayfa başlıkları.
- Domain `bereketfide.com.tr` → `sultandefense.com`: `next.config.ts` remotePatterns, JSON-LD `@id`, `OptimizedImage.tsx`, `public/llms.txt`, OG/twitter image.
- İletişim: `export@sultandefense.com`, `+90 545 552 75 35`, "Folkart Time 1, Kazımdirik, Kat 6/612, Bornova, 35100 İzmir", harita → İzmir.
- JSON-LD Organization: Sultan Defense Ltd. (1996, defans tedarik/ihracat partneri), `knowsAbout` → 10 kategori.
- i18n (`public/locales/tr|en|de.json`, `src/i18n/locales`): tarım → defans; `home.categories` → 10 kategori; tagline.
- `frontend/carbon-fiber.jpg` + tarım/kompozit görsel artıkları sil.
- Dil kararı (TR/EN + AR?) → Claude'a sor.

### Faz 6 — Doğrulama (build tarafı sende)
- `bun install && bun run build` temiz.
- `grep -rni "bereket\|fide\|tohum\|tarim\|tarım\|vistaseed\|sebze\|biber" src/ public/ next.config.ts` = **0**.
- Backend `:8090` açıkken `bun run dev` `:3040`: ürün/kategori/menü/footer/settings/galeri/referans **geliyor mu**; RFQ formu `source=sultandefense` ile düşüyor mu.
- Bitince commit + push; **Antigravity** görsel QA (`docs/antigravity-qa.md`), **Claude** review.

---

## 10 Defans Kategorisi (seed + i18n için referans)
Ballistic Protection · Communication & Command Electronics · Containerized Field Kitchen & Support Units ·
Field Support Logistics · Naval & Marine Systems · Power/Battery/Generator · Shield & Riot Control Solutions ·
Surveillance/Sensors/Security · Tactical Gear & Textile · Training & Simulation Software.

## Bitince
Her fazı commit + push. Sorun/karar gerektiren yer → Claude'a (mimar) bırak, ilerleme notu düş.
