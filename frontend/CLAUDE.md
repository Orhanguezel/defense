# CLAUDE.md — Sultan Defense Frontend

## Proje Özeti

`sultandefense-frontend`, Sultan Defense için Next.js tabanlı **B2B defans tedarik/ihracat** ürün katalog +
**RFQ (teklif)** frontend'idir. Bu kod tabanı bereketfide frontend'inden uyarlandı (bkz. kök
[`FRONTEND_SWAP_PLAN.md`](../FRONTEND_SWAP_PLAN.md)). Hedefler:

- Kurumsal, güven veren, "askeri/imparatorluk" hissi veren koyu tasarım
- Teknik SEO uyumlu sayfa yapısı, çok dilli içerik (TR/EN)
- Token tabanlı tema (sultan-imperial-armor), koyu varsayılan + açık toggle

## Sayfa Yapısı (Faz 3 sadeleştirmesi sonrası hedef)

```
/[locale]/                → Anasayfa (hero, A-Z capabilities, FAQ, CTA)
/[locale]/urunler         → Ürün katalog listesi (10 defans kategorisi)
/[locale]/urunler/[slug]  → Ürün detay
/[locale]/hizmetler       → Hizmetler / tedarik süreci
/[locale]/galeri[/slug]   → Galeri
/[locale]/referanslar     → Referanslar
/[locale]/haberler[/slug] → Blog / Haberler (custom_pages module_key=news) — opsiyonel
/[locale]/hakkimizda      → Hakkımızda
/[locale]/iletisim        → İletişim (İzmir/Bornova)
/[locale]/teklif          → RFQ / teklif talebi
/[locale]/legal/[slug]    → Yasal sayfalar (privacy / terms / cookie)
/[locale]/certifications  → Sertifikalar & uyumluluk (eklenecek)
/[locale]/faq             → SSS (eklenecek)
```

> KALDIRILDI (backend desteksiz, içerik planı dışı): bayi portalı (bayi-girisi/kayit/odeme/agi/dashboard/
> panel/finans), kataloglar, kampanya, fiyat-listesi, bilgi-bankasi, ekim-takvimi, insan-kaynaklari.

## Tema Kontratı — "İmparatorluk Zırhı"

- Template: `sultan-imperial-armor` · Intent: `imperial-armor-anthracite-gold`
- **Koyu varsayılan** (ana his) + açık toggle. Kaynak: `src/styles/globals.css`, `src/theme/templates.ts`.
- Renkler: Antrasit `#1A1A1D` (zemin) · Titanyum `#2D3134` (yüzey) · **Mat Osmanlı Altını `#C5A880`** (ana
  vurgu/CTA) · Derin Bordo `#7A1B22` (ikincil/küçük vurgu). Token referansı: `docs/brand/tokens.css`.

### Kural Özeti

- Component dark/light bilmez — `dark:bg-*` YASAK. Semantic token kullan: `bg-(--color-bg)`, `text-(--color-text-primary)`.
- Marka: `--color-brand` = mat altın. İkincil: `--color-accent` = bordo.
- Primitive ramplar: `--gold-*` (altın), `--green-*` (= bordo değerleri), `--soil-*` + `--anthracite-*` (antrasit/titanyum).

## Logo / Marka Asset Kontratı

- Kare amblem (şeffaf): `public/logo/sultandefense-emblem.png` — header'da amblem + HTML "SULTAN DEFENSE"
  wordmark olarak kullanılır (menüye sığan yatay lockup; ayrı raster gerekmez).
- Tam logo (şeffaf, koyu zemin): `public/logo/sultandefense-logo-transparent.png` — footer/OG.
- Favicon / apple-touch / PWA: koyu (#1A1A1D) kutucuklu amblem — `public/favicon.ico`, `public/apple-touch-icon.png`,
  `public/icons/icon-{192,512}.png`, `maskable-512.png`. icon.tsx/apple-icon.tsx kaynak: `public/logo/sultandefense-{favicon,apple-touch-icon}.png`.
- Kaynak: `docs/brand/logo/sultandefense-logo-source-v2.png` (resmi logo).

## API Endpoint Şablonu (sultandefense backend, port 8090, path `/api` — v1 YOK)

```
GET /api/products?item_type=sultandefense&locale=tr&is_active=1
GET /api/products/by-slug/[slug]?item_type=sultandefense&locale=tr
GET /api/categories?module_key=sultandefense&locale=tr
GET /api/galleries?module_key=sultandefense&locale=tr
GET /api/services?module_key=sultandefense&locale=tr
GET /api/custom-pages?module_key=news&locale=tr            # blog/haberler
GET /api/site_settings/[key]?prefix=sultandefense__
GET /api/menu-items?site_id=sultandefense  ·  /api/footer-sections?site_id=sultandefense
POST /api/offers  (source=sultandefense)  ·  /api/contacts  ·  /api/newsletter/subscribe
```

## SEO Pattern Kontratı

Her indekslenebilir sayfa: `generateMetadata` → `buildPageMetadata()` (`src/seo/helpers.ts`), canonical,
hreflang + `x-default`, robots, OG/Twitter, JSON-LD (Organization = Sultan Defense Ltd., 1996, defans
tedarik/ihracat partneri — üretici DEĞİL). Boş veride kontrollü fallback UI.

## Kritik Dosyalar

| Dosya | Amaç |
| --- | --- |
| `src/styles/globals.css` | Renk token'ları (sultan-imperial-armor) |
| `src/theme/templates.ts` | Template adı |
| `src/lib/utils.ts` | SITE_URL, API_BASE_URL |
| `src/lib/sultandefense-palette-hex.ts` | OG/manifest için hex paleti |
| `src/seo/helpers.ts` / `src/seo/jsonld.ts` | Metadata + JSON-LD |
| `public/locales/{tr,en}.json` | Çeviriler |

## Test

```bash
bun install && bun run build      # type + build
bun run dev                       # :3040 (backend :8090 açık olmalı)
```

## Delivery Kuralı

Bunlar kopuk güncellenmez: `CLAUDE.md`, `src/styles/globals.css`, `src/theme/templates.ts`,
kök `FRONTEND_SWAP_PLAN.md`.
