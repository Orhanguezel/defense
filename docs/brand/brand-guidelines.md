# Sultan Defense — Marka Kılavuzu

> Güncelleme: 2026-06-04. Tema: **"İmparatorluk Zırhı" (Imperial Armor)** — Antrasit/Titanyum zemin +
> Mat Osmanlı Altını + Derin Bordo. Koyu (ana his) + açık (toggle). Logo: **müşteri logosu** (resmi marka).

## 1. Renk Paleti

### Marka sabitleri
| Token | Hex | Kullanim |
|-------|-----|----------|
| Mat Osmanlı Altını | `#C5A880` | **Ana vurgu**, CTA, butonlar, linkler (mat/eskitilmiş pirinç) |
| Altın Hover | `#D4B996` | Hover / hafif açılmış altın |
| Parlak Altın | `#D4AF37` | **Çok az** — vurucu küçük detay (parlak sarı genel kullanımda YOK) |
| Derin Bordo | `#7A1B22` | İkincil detay: menü altı çizgisi, ikon, küçük vurgu (Türk kimliği) |
| Antrasit Siyah | `#1A1A1D` | Ana koyu zemin |
| Titanyum Grisi | `#2D3134` | Kart / yüzey |

### Koyu tema (varsayilan — ana his)
- Zemin `#1A1A1D` · Yüzey `#2D3134` · Kenarlık `#3C4044`
- Metin `#EDEAE3` (sıcak kırık beyaz) · Soluk metin `#9A968C`
- Primary (altın) `#C5A880` (üzerine metin `#1A1A1D`) · Secondary (bordo) `#7A1B22`

### Açık tema
- Zemin `#F4F1EC` (parşömen) · Yüzey `#FFFFFF` · Kenarlık `#D9D4C9`
- Metin `#1A1A1D` · Soluk metin `#5C584F`
- Primary `#8C6F3F` (açık zeminde kontrast için koyulaştırılmış eskitilmiş altın) · Secondary `#7A1B22`

> Tüm değerler kod olarak: [`tokens.css`](tokens.css) (CSS custom properties).

## 2. Logo (HAZIR — resmi müşteri logosu)

Logo bir **wordmark**: "SULTAN" mat altın + "DEFENSE" açık/antrasit. Paket `docs/brand/logo/`:

| Dosya | Kullanım |
|-------|----------|
| `sultandefense-logo-dark.png` | Koyu zeminde tam logo (şeffaf; SULTAN altın + DEFENSE açık) |
| `sultandefense-logo-light.png` | Açık zeminde tam logo (şeffaf; SULTAN altın + DEFENSE antrasit) |
| `sultandefense-logo-onDark.png` | Solid antrasit zeminli (OG/sosyal paylaşım) |
| `sultandefense-logo-source.png` | Müşteri orijinali (arşiv) |
| `sultandefense-mark.svg` | **SD amblemi** (wordmark dar alana sığmaz; favicon/app-icon için) |
| `favicon.ico` | Tarayıcı sekmesi (16/32/48 gömülü) |
| `apple-touch-icon.png` (180) | iOS/Android ana ekran |
| `icon-192.png`, `icon-512.png` | PWA / web manifest |

**Kurallar:**
- Logoyu germe/eğme, marka dışı renk verme, gölge ekleme YAPILMAZ.
- Minimum boş alan: logo yüksekliğinin %25'i kadar her yönde.
- Koyu zeminde `-dark`, açık zeminde `-light` varyant kullanılır.
- Küçük/kare alan (favicon, avatar) için `mark.svg` (SD amblemi).

## 3. Tipografi

| Rol | Font | Not |
|-----|------|-----|
| Başlıklar | **Oswald** (alternatif: Cinzel) | Büyük harf, imparatorluk-askeri karakter |
| Gövde metni | **Inter** / system-ui | Okunabilir, nötr |

Başlık stili: `text-transform: uppercase`, `letter-spacing: .04–.16em`.

## 4. Görsel Dil

- Koyu antrasit/titanyum zeminler; **mat altın** vurgular; çok ufak **bordo** detaylar.
- Ağırbaşlı, premium, "zırh/metal" dokusu hissi. Parlak neon/sarı YOK.
- İnce altın çizgi aksanlar, ödül/madalya, kalkan/zırh motifleri.
- Ürün görselleri: müşterinin kategori klasörleri (Terms'e göre "temsilî" — telif notu sayfa altına).
- Ton: ciddi, otoriter, asil. Soğuk askeri sertlik + sultanlık asaleti.

## 5. Uygulama (rebrand'de)
- `tokens.css` → frontend & admin_panel global CSS / Tailwind v4 `@theme` değişkenlerine maplenir.
- Logolar → `frontend/public/logo/` ve `admin_panel/public/logo/` (eski `vista-logo-*` yerine).
- Favicon / apple-touch / opengraph → müşteri logosundan üretilir.
