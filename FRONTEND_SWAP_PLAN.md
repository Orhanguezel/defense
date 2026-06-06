# FRONTEND_SWAP_PLAN.md — Yeni Frontend Geçişi (bereketfide → Sultan Defense)

> **Strateji değişikliği (2026-06-06):** Eski `frontend/` (vistainsaat tabanlı) artık **pasife** alınıyor.
> Yerine, bereketfide için hazırlanmış daha zengin/iyi kurgulanmış `frontend copy/` getirilip
> **sultandefense.com defans B2B katalog + RFQ** sitesine dönüştürülüyor.
> Bu doküman, frontend için **REBRAND_CHECKLIST.md Faz 5'in yerini alır** (frontend kısmı).
> Backend (Faz 2-3) ve admin panel (Faz 4) rebrand işleri **REBRAND_CHECKLIST.md** sırasıyla geçerli kalır.

## 🔴 BRANCH & ORKESTRASYON KURALI
- **Tek branch: `main`.** Başka branch açma. Çalışmadan önce `git pull --rebase origin main`, iş bittikçe küçük commit + `git push`.
- Aynı dosyada aynı anda iki ajan çalışmaz. İş akışı: **Claude tasarla → Codex implement → Antigravity görsel QA → Copilot cilala**.
- Her fazdan sonra ilgili app `bun run build` + commit + push.

---

## 0. Karar Özeti (kullanıcı onayı — 2026-06-06)
- [x] Backend desteği olmayan zengin sayfalar **TAMAMEN KALDIRILIR** (sade B2B katalog + RFQ).
- [x] Bayi portalı (giriş/dashboard/sipariş/finans/ödeme/iyzico) **gelecekte de gerekmez** → tüm bayi kodu silinir.
- [x] Tema/marka tokenları **`docs/brand/tokens.css`**'ten uygulanır ("İmparatorluk Zırhı", koyu varsayılan).
- [~] **Varsayım (override edilebilir):** Logolar `sultandefense-*` adıyla taşınır (kod referansı daha temiz).
- [~] **Varsayım (override edilebilir):** Blog/haberler (`module_key=news`) **kalır** (custom_pages üzerinden, duyuru/haber için ucuz).

---

## 🧭 İş Bölümü (özet)

| Faz | Konu | Sahip | Bağımlılık |
|-----|------|-------|------------|
| **Faz 0** | Dizin swap (frontend↔_frontend) | **Claude** | — |
| **Faz 1** | `.env` hizalama (sultandefense backend) | **Claude** | Faz 0 |
| **Faz 2** | Backend ayrım anahtarları (`bereketfide`→`sultandefense`) | **Codex** | Faz 1 |
| **Faz 3** | Desteksiz sayfa/modül silme + link temizliği | **Codex** | Faz 0 |
| **Faz 4** | Tema tokenları + logo/favicon/manifest | **Claude** | Faz 0 |
| **Faz 5** | Display string + domain + i18n içerik (defans) | **Codex** | Faz 2,3 |
| **Faz 6** | Build + grep=0 + içerik akışı doğrulama | **Codex** (build) + **Claude** (review) + **Antigravity** (görsel QA) | Tümü |

> Codex briefi: **[docs/CODEX_FRONTEND_BRIEF.md](docs/CODEX_FRONTEND_BRIEF.md)** (Faz 2-3-5-6 detay görev tanımı).

---

## Faz 0 — Dizin İşlemleri (pasifleştirme) · Sahip: **Claude**
- [ ] Eski frontend'i pasife al: `frontend/` → `_frontend/` (rename; içerik silinmez, arşiv).
- [ ] Yeni frontend'i aktif et: `frontend copy/` → `frontend/` (boşluklu isim sorunu da çözülür).
- [ ] `_frontend/`'i deploy/build kapsamı dışında bırak (kök `.gitignore` / nginx yorumunu kontrol et — kod referansı yok, doğrulandı).
- [ ] `git status` ile rename'in temiz göründüğünü doğrula (node_modules/.next git-dışı).
- [ ] Commit: `chore(frontend): bereketfide tabanli yeni frontend'i aktif et, eskisini _frontend'e al`.

## Faz 1 — `.env` Hizalama (sultandefense backend'e bağla) · Sahip: **Claude**
> Eski frontend'in çalışan değerleri **altın referans**. Portlar (KESIN): backend **8090**, frontend **3040**.
- [ ] `NEXT_PUBLIC_API_URL=http://localhost:8090/api` — **`/api/v1` DEĞİL** (sultandefense backend `/api` kullanır).
- [ ] `NEXT_PUBLIC_SITE_URL` → local `http://localhost:3040`, prod `https://www.sultandefense.com`.
- [ ] `lib/utils.ts:9` fallback default `…/api/v1` → `…/api` (tutarsızlık giderme — `locale-settings.ts:4` zaten `/api`).
- [ ] `.env.example`, `.env.local`, `.env.production` → sultandefense değerleri; bereketfide'ye özel satırları temizle:
  - [ ] `NEXT_PUBLIC_GOOGLE_MAPS_API_KEY` (bayi haritası — kalkacak) → kaldır.
  - [ ] `NEXT_PUBLIC_GOOGLE_MAPS_EMBED_URL` → İzmir/Bornova koordinatına güncelle (iletişim haritası kalıyorsa) ya da boşalt.
  - [ ] `NEXT_PUBLIC_GA_ID` / `GTM_ID` / `GOOGLE_ADS_*` (bereketfide hesapları) → boşalt veya sultandefense hesabıyla doldur.
  - [ ] Bayi/ödeme feature flag'leri (`NEXT_PUBLIC_FEATURE_BANK_CARD_PAYMENT`, `_IYZICO_PAYMENT`) → kaldır.
- [ ] `.env*` **commit edilmez** (gitignore). Sadece `.env.example` izlenir.

## Faz 2 — Backend Ayrım Anahtarları (`bereketfide` → `sultandefense`) · Sahip: **Codex**
> **VERİ AKIŞININ KALBİ.** Yanlışsa hiçbir içerik gelmez. Değerleri değiştir, anahtar **adlarını** değil.
- [x] `item_type: 'bereketfide'` → `'sultandefense'` — `src/features/projects/products.service.ts` (2 yer).
- [x] `module_key: 'bereketfide'` → `'sultandefense'` — `categories.service.ts`, `gallery.service.ts`, `i18n/server.ts` (services), sayfa `page.tsx`'leri (hizmetler, galeri, referanslar).
- [x] `source: 'bereketfide'` → `'sultandefense'` — `contact.service.ts`, `offer.service.ts`, `newsletter.service.ts`, `ContactForm/OfferForm/NewsletterForm.tsx`, `monitoring/seo-issues/route.ts`.
- [x] `prefix: 'bereketfide__'` → `'sultandefense__'` — `site-settings/index.ts`, `i18n/locale-settings.ts:72`, `i18n/server.ts:28`.
- [x] `site_id=bereketfide` → `sultandefense` — `i18n/server.ts` (menu-items, footer-sections).
- [x] `related-content.ts` & `site-search.ts` içindeki `bereketfide` / `sultandefense_blog` modül anahtarları.
- [x] `sitemap.ts` (`item_type=bereketfide`, `module_key=bereketfide`).
- [x] Önce `grep -rn "bereketfide" src/` ile tüm kullanımları çıkar; tek tek anlamlı değiştir (kör replace YOK).

## Faz 3 — Desteksiz Sayfa/Modül Silme · Sahip: **Codex**
> Backend desteği yok + içerik planında yok → kaldır. Kalan sayfalar bozulmamalı.
- [x] **Sil (route):** `src/app/[locale]/` altında `(bayi)/`, `bayi-girisi/`, `bayi-kayit/`, `bayi-odeme/`, `bayi-agi/`, `kataloglar/`, `kampanya/`, `fiyat-listesi/`, `bilgi-bankasi/`, `ekim-takvimi/`, `insan-kaynaklari/`.
- [x] **Sil (modül):** `src/modules/bayi/`, `src/modules/dealer-network/`.
- [x] **Sil (tarımsal lib/component):** `lib/bereketfide-product-agronomy.ts`, `HalPriceTicker*.tsx`, `FrostWarningWidget.tsx`, ekim-takvimi yardımcıları, `components/catalog/` (kullanılmıyorsa).
- [x] **Link temizliği:** menü (`menu-items` backend'den gelir → seed'de yok, sorun değil), Header/Footer/widget'larda bu rotalara giden **hardcoded** linkleri kaldır.
- [x] `sitemap.ts` & `robots.ts` → silinen rotaları çıkar.
- [x] Footer ekosistem linkleri (vistaseeds/tarımiklim/tarımdabugun/tarımansiklopedisi) → kaldır.
- [x] **Tut:** `/` (home), `urunler` (+`[slug]`), `hizmetler` (+`[slug]`), `hakkimizda`, `iletisim`, `teklif` (RFQ), `galeri` (+`[slug]`), `referanslar`, `legal` (+`[slug]`), `blog`/`haberler`, `arama`.
- [x] **Yeni ekle (içerik planından):** `/certifications` ve `/faq` — basit statik veya `custom_pages` tabanlı.
- [x] Silme sonrası `bun run build` → kırık import/route kalmadığını doğrula.

## Faz 4 — Marka & Tema · Sahip: **Claude**
- [ ] `docs/brand/tokens.css` → `src/styles/globals.css` (koyu varsayılan; antrasit `#1A1A1D` + titanyum `#2D3134` + altın `#C5A880` + bordo `#7A1B22`).
- [ ] `src/lib/bereketfide-palette-hex.ts` → sultandefense paleti (dosya adı + değerler); import eden yerleri güncelle.
- [ ] `src/theme/templates.ts`: `THEME_TEMPLATE='bereket-harvest'` → `sultan-imperial-armor`, `THEME_INTENT` → defans.
- [ ] Logolar: `docs/brand/logo/*` → `public/logo/` (`bereket-*` → `sultandefense-*`); Header/Footer/`icon.tsx`/`apple-icon.tsx`/`opengraph-image.tsx`/`twitter-image.tsx` referansları.
- [ ] `public/manifest.json`: `name`/`short_name` → Sultan Defense, `theme_color` → `#1A1A1D` (veya `#C5A880`), `background_color`.
- [ ] favicon (`docs/brand/logo/favicon.ico`, `icon-192/512`, `apple-touch-icon.png`) → `public/`.
- [ ] Fontlar: marka rehberindeki font rolleriyle hizala (`globals.css` `--font-heading/--font-body`).
- [ ] `*/` içeren CSS yorumu yazma (yorumu erken kapatır).

## Faz 5 — İçerik & SEO (display + metin) · Sahip: **Codex**
> Kaynak: `docs/content/site-content-en.md` + `docs/content/README.md` (sayfa→slug, 10 kategori, şirket bilgisi).
- [x] Display: "Bereket Fide" → "Sultan Defense" — `seo/helpers.ts` (`DEFAULT_SITE_NAME`, suffix, strip regex), `layout.tsx`/`[locale]/layout.tsx` metadata, sayfa başlıkları.
- [x] Domain: `bereketfide.com.tr` → `sultandefense.com` — `next.config.ts` remotePatterns, JSON-LD `@id`, `OptimizedImage.tsx` domain check, `public/llms.txt`, OG/twitter image.
- [x] İletişim: `export@sultandefense.com`, Tel/WhatsApp `+90 545 552 75 35`, adres "Folkart Time 1, Kazımdirik, Kat 6/612, Bornova, 35100 İzmir", harita embed → İzmir.
- [x] JSON-LD Organization: Sultan Defense Ltd. (kuruluş **1996**, defans **tedarik/ihracat partneri** — üretici DEĞİL), `knowsAbout` → 10 defans kategorisi; telefon/adres güncelle.
- [x] i18n locale (`public/locales/tr|en|de.json` + `src/i18n/locales`): tarım kelimeleri (fide/tohum/sebze/biber/ekim) → defans; `home.categories` → 10 ürün kategorisi; tagline → "defans tedarik/ihracat partneri".
- [x] `kampanya/sebze-tohumu-biber-tohumu` artığı slug/metin kalmadığını doğrula (Faz 3'te silindi).
- [x] `frontend/carbon-fiber.jpg` ve diğer tarım/kompozit görsel artıkları sil.
- [ ] **Dil kararı:** Orta Doğu/Afrika/Türk Cumhuriyetleri odağı → TR/EN öncelikli; AR vb. ihtiyacını Claude'a sor.

## Faz 6 — Doğrulama · Sahip: **Codex (build) + Claude (review) + Antigravity (görsel QA)**
- [x] `bun install && bun run build` temiz (tip + build hatasız).
- [x] `grep -rni "bereket\|fide\|tohum\|tarim\|tarım\|vistaseed\|sebze\|biber" src/ public/ next.config.ts` = **0**.
- [ ] Backend (`:8090`) ayağa kalkık iken `bun run dev` (frontend `:3040`): ürün listesi, kategoriler, menü, footer, site_settings, galeri, referanslar **geliyor mu** (module_key/prefix doğru mu). _(Codex notu: 2026-06-06'da lokal backend `:8090` kapalıydı; frontend `/tr`, `/tr/faq`, `/tr/certifications` 200 doğrulandı.)_
- [ ] Teklif (RFQ) formu `source=sultandefense` ile backend'e düşüyor mu; iletişim/newsletter aynı. _(Backend `:8090` kapalı olduğu için canlı kayıt doğrulanmadı.)_
- [ ] Koyu tema varsayılan, altın vurgu, logo doğru render; mobil + light toggle (`docs/antigravity-qa.md`).
- [ ] `project.portfolio.json` (frontend) + kök `README.md` güncelle; `_frontend` arşiv notu.
- [ ] Final commit + push.

---

## Notlar / Riskler
- **node_modules kopyalanmadı** sayılmaz: `frontend copy/` içinde node_modules var; rename sonrası gerekirse `bun install` ile tazele.
- **Kör sed/replace YASAK:** `bereket`/`fide` bazı 3. parti/değişken adlarında geçebilir; dosya bazlı anlamlı değişim.
- **Kuplaj (Faz 2 ↔ backend seed):** Frontend `module_key=sultandefense` gönderir; backend seed'inde de `sultandefense` profili dolu olmalı (REBRAND_CHECKLIST Faz 2-3 / Codex). İçerik gelmiyorsa ilk bakılacak yer burası.
- **Eski plan farkı:** `docs/CODEX_PROMPT.md` & `AGENTS.md`'deki "eski frontend'i yerinde rebrand et" yönergesi **GEÇERSİZ**; frontend için bu doküman + `docs/CODEX_FRONTEND_BRIEF.md` esas alınır.
