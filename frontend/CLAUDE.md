# CLAUDE.md — Sultan Defense Frontend

## Proje Özeti

`sultandefense-frontend`, Sultan Defense Ltd., Co. için geliştirilen Next.js tabanlı defans/savunma sanayi
ürün katalog ve teklif (RFQ) toplama frontend'idir. Ana hedefler:

- Premium, otoriter, "zırh/metal" estetiği (İmparatorluk Zırhı)
- Teknik SEO uyumlu sayfa yapısı
- Çok dilli içerik (ürün kataloğu: 10 defans kategorisi)
- Token tabanlı tema yönetimi (sultandefense-imperial-armor)
- Dark / Light mode desteği

> İçerik kaynağı: `docs/content/` (sayfa metinleri, 10 kategori, şirket bilgisi).
> NOT: Rotalar hâlâ inşaat dönemi (projeler/hizmetler); defans slug'larına (products/services) geçiş Faz 5.

## Sayfa Yapısı (URL Rotaları)

```
/[locale]/                → Anasayfa
/[locale]/projeler        → Proje portföyü listesi
/[locale]/projeler/[slug] → Proje detay
/[locale]/hizmetler       → Faaliyetler listesi
/[locale]/hizmetler/[slug]→ Faaliyet detay
/[locale]/galeri          → Galeri
/[locale]/galeri/[slug]   → Galeri detay
/[locale]/haberler        → Blog / Haberler
/[locale]/haberler/[slug] → Blog yazı detay
/[locale]/hakkimizda      → Hakkımızda
/[locale]/iletisim        → İletişim
/[locale]/teklif          → Teklif formu
/[locale]/legal/[slug]    → Yasal sayfalar
```

## Tema Kontratı — "İmparatorluk Zırhı"

- Template: `sultandefense-imperial-armor`
- Intent: `imperial-armor-anthracite-gold-bordeaux`
- Kaynak: `src/styles/globals.css`, `src/theme/templates.ts` · Marka: `docs/brand/`

### Kural Özeti

- Component dark/light bilmez — `dark:bg-*` YASAK
- Semantic token kullan: `bg-[var(--color-bg)]`
- Dark section: `surface-dark-heading`, `surface-dark-text`, `surface-dark-panel`
- Brand rengi **mat altın**: `--color-brand` = `#C5A880`; zemin antrasit `#1A1A1D`; ikincil **bordo** `#7A1B22`
- NOT: primitive ölçek isimleri (`--cyan-*` / `--navy-*`) **legacy**; değerleri altın/antrasit (isimleri değiştirme)
- Tipografi: Oswald (--font-heading) + Inter (--font-body)

## Zorunlu Çalışma Kuralları

- Her yeni sayfa veya section önce mevcut SEO pattern'i ile hizalanır.
- Metadata, canonical, hreflang, robots ve JSON-LD mantığı helper seviyesinde tekrar kullanılır.
- Query parametreli indeks riski olan URL'lerde canonical temiz path'e döner; gerekiyorsa `noindex,follow` kullanılır.
- Her locale aynı component pattern'ini kullanır; locale bazlı fark yalnızca veri ve mesaj katmanında olur.

## SEO Pattern Kontratı

Her indekslenebilir sayfa için aşağıdakiler kontrol edilmeden iş tamamlanmış sayılmaz:

- `generateMetadata` — `buildPageMetadata()` kullanılır (`src/seo/helpers.ts`)
- canonical
- hreflang + `x-default`
- uygun `robots`
- Open Graph / Twitter alanları
- JSON-LD şeması (sayfa tipine göre)
- Boş veri durumunda kontrollü fallback UI

**Varsayılan pattern:**

```ts
// Listing sayfası
buildPageMetadata({ locale, pathname: '/projeler', title, description })

// Detay sayfası
buildPageMetadata({ locale, pathname: '/projeler/[slug]', title, description, ogImage })

// Filtreli / query-driven sayfa
buildPageMetadata({ ..., noIndex: true })
```

**JSON-LD şemaları** (`src/seo/jsonld.ts`):

- Anasayfa: `Organization` + `LocalBusiness`
- Proje detay: `CreativeWork` + `BreadcrumbList`
- Faaliyet detay: `Service` + `BreadcrumbList`
- İletişim: `LocalBusiness` (adres, tel, openingHours)

## API Endpoint Şablonu

```
GET /api/projects?module_key=sultandefense&locale=tr&is_active=1
GET /api/projects/by-slug/[slug]?locale=tr
GET /api/services?module_key=sultandefense&locale=tr
GET /api/galleries?module_key=sultandefense&locale=tr
GET /api/custom_pages?module_key=sultandefense_blog&locale=tr
GET /api/site_settings/[key]?prefix=sultandefense__
```

## Media SEO Kontratı

- `alt` metni title-only fallback olarak bırakılmaz; `src/lib/media-seo.ts` içindeki helper ile anlamsal fallback üretilir.
- `caption` varsa title tekrar etmez.
- Görsel `width` ve `height` API'den geliyorsa kullanılır; gelmiyorsa tek bir merkezi fallback uygulanır.
- Yeni görseller kebab-case dosya adı ile yüklenir: `bosphorus-residence-dis-cephe-01.jpg`

## Test

```bash
npm run build          # Build kontrol
npm run type-check     # TypeScript kontrol
npm run test:theme     # Tema token kontrol (raw hex, bg-white, dark: yok)
npm run test:seo       # SEO smoke test (canonical, hreflang, robots, sitemap)
npm run test:media     # Media alt/caption kontrol
npm run audit:crawl    # Tam site tarama raporu
npm run audit:lighthouse # Lighthouse CI
```

## Kritik Dosyalar

| Dosya                            | Amaç                    |
| -------------------------------- | ----------------------- |
| `src/styles/globals.css`         | Renk token'ları         |
| `src/theme/templates.ts`         | Template adı            |
| `src/lib/utils.ts`               | SITE_URL, API_BASE_URL  |
| `src/seo/helpers.ts`             | buildPageMetadata()     |
| `src/seo/jsonld.ts`              | JSON-LD builder'ları    |
| `src/lib/content-fallbacks.ts`   | Offline fallback içerik |
| `src/lib/navigation-fallback.ts` | Fallback nav linkleri   |
| `public/locales/tr.json`         | TR çeviriler            |
| `public/locales/en.json`         | EN çeviriler            |

## Delivery Kuralı

Aşağıdaki dosyalar birbirinden kopuk güncellenmez:

- `CLAUDE.md`
- `PLAN.md` (proje kökünde)
- `THEMA.md` (proje kökünde)
- `src/styles/globals.css`
- `src/theme/templates.ts`
