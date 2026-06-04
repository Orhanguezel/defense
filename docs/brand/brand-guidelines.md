# Sultan Defense — Marka Kılavuzu

> Karar tarihi: 2026-06-04. Tema: **Çelik & Cyan (Defense)**, koyu + açık (toggle), logo: **kalkan + SD monogram**.

## 1. Renk Paleti

### Marka sabitleri
| Token | Hex | Kullanim |
|-------|-----|----------|
| Tactical Cyan | `#2BD4D9` | Ana vurgu, CTA, linkler, aksanlar |
| Cyan Bright | `#4FE3E8` | Hover / parlama |
| Steel Blue | `#5FA8D3` | Ikincil vurgu |
| Deep Navy | `#0D1B2A` | Koyu zemin / kalkan dolgusu |
| Gunmetal | `#1B263B` | Kart / yuzey |

### Koyu tema (varsayilan)
- Zemin `#0D1B2A` · Yuzey `#1B263B` · Kenarlik `#2C3E52`
- Metin `#E0E1DD` · Soluk metin `#8A97A6`
- Primary `#2BD4D9` (uzerine metin `#06222B`)

### Açık tema
- Zemin `#F4F6F8` · Yuzey `#FFFFFF` · Kenarlik `#D5DDE5`
- Metin `#0D1B2A` · Soluk metin `#51606F`
- Primary `#0E7C82` (acik zeminde kontrast icin koyulastirilmis cyan)

> Tum degerler kod olarak: [`tokens.css`](tokens.css) (CSS custom properties).

## 2. Logo

| Dosya | Kullanim |
|-------|----------|
| [`logo/sultandefense-logo-dark.svg`](logo/sultandefense-logo-dark.svg) | Koyu zeminde tam logo (kalkan + wordmark) |
| [`logo/sultandefense-logo-light.svg`](logo/sultandefense-logo-light.svg) | Acik zeminde tam logo |
| [`logo/sultandefense-mark.svg`](logo/sultandefense-mark.svg) | Sadece kalkan (favicon, app icon, kucuk alan) |

**Konsept:** Kalkan (koruma/guven) + üstte chevron (askeri rütbe/ileri hareket) + **SD** monogram. Yan
ında iki satir wordmark: **SULTAN** (kalin) / **DEFENSE** (cyan, genis takip), arada ince ayrac cizgisi.

**Kurallar:**
- Kalkan dolgusu daima Deep Navy `#0D1B2A` (her iki temada da). Sadece wordmark rengi temaya gore degisir.
- Minimum bos alan: kalkan yuksekliginin %25'i kadar her yonde.
- Cok kucuk boyutta sadece kalkan (`mark.svg`) kullanilir.
- Logoyu germe/egme, renk degistirme, golge ekleme YAPILMAZ.

## 3. Tipografi

| Rol | Font | Not |
|-----|------|-----|
| Basliklar / wordmark | **Oswald** (veya Rajdhani) | Condensed, askeri-teknik karakter, buyuk harf + genis takip |
| Govde metni | **Inter** / system-ui | Okunabilir, notr |
| Monogram | Geometrik bold sans (Arial Black fallback) | — |

Baslik stili: `text-transform: uppercase`, `letter-spacing: .04–.16em`.

## 4. Görsel Dil

- Koyu, çelik/lacivert zeminler; cyan ışık vurguları (referans ürün görselleriyle uyumlu).
- İnce çizgi/grid aksanlar, chevron, hedef/radar motifleri.
- Ürün görselleri: müşterinin kategori klasörleri (Terms'e göre "temsilî" — telif notu sayfa altına).
- Ton: ciddi, otoriter, yüksek-teknoloji. Abartılı parlama/neon'dan kaçın.

## 5. Uygulama (rebrand'de)
- `tokens.css` → frontend & admin_panel global CSS / Tailwind v4 `@theme` degiskenlerine maplenir.
- Logolar → `frontend/public/logo/` ve `admin_panel/public/logo/` (eski `vista-logo-*` yerine).
- Favicon / icon / opengraph → `mark.svg`'den uretilir.
