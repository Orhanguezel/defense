# Antigravity — Görsel QA Görevi (Sultan Defense Rebrand)

> **Rol:** Antigravity, Codex bir fazı implement ettikten sonra **görsel doğrulama** yapar
> (ekran görüntüsü al → markaya uygunluk + bozulma kontrolü → rapor). Kod yazmaz; sadece
> küçük görsel düzeltmeler gerekiyorsa işaret eder veya uygular.
>
> **Son güncelleme:** 2026-06-04 — Tema **"İmparatorluk Zırhı"** (Antrasit + Mat Osmanlı Altını + Derin Bordo).
> Eski Çelik & Cyan (`#0D1B2A` / `#2BD4D9`) **GEÇERSİZ**. Bu belgede cyan referansı kalmamıştır.

## 🔴 BRANCH KURALI
- Tek branch: **`main`**. Düzeltme commit'i gerekirse doğrudan main'e, önce `git pull --rebase origin main`.

## Ön koşul (uygulamayı ayağa kaldır)
```bash
# Backend (port 8090) — DB + seed gerekli
cd backend && bun install && bun run build && bun run dev
# Frontend (port 3040)
cd frontend && bun install && bun run dev      # http://localhost:3040
# Admin panel (port 3041)
cd admin_panel && bun install && bun run dev   # http://localhost:3041
```

## Marka referansı (bunlara göre doğrula)

Tam token listesi: [`docs/brand/tokens.css`](brand/tokens.css) — Kılavuz: [`docs/brand/brand-guidelines.md`](brand/brand-guidelines.md)

### Palet — "İmparatorluk Zırhı"

| Token | Hex | Kullanım |
|-------|-----|----------|
| Antrasit Siyah | `#1A1A1D` | Ana koyu zemin (`--bg`) |
| Titanyum Grisi | `#2D3134` | Kart / yüzey (`--surface`) |
| Mat Osmanlı Altını | `#C5A880` | **Ana vurgu**, CTA, link, buton (`--primary`) |
| Altın Hover | `#D4B996` | Hover durumu (`--primary-hover`) |
| Parlak Altın | `#D4AF37` | **Çok az** — küçük vurucu detay |
| Derin Bordo | `#7A1B22` | İkincil detay, menü alt çizgisi (`--secondary`) |
| Sıcak Kırık Beyaz | `#EDEAE3` | Ana metin (`--text`) |
| Parşömen | `#F4F1EC` | Açık tema zemin |

> ⚠️ **Aşağıdaki değerler artık YASAK:**
> `#2BD4D9` (tactical cyan), `#0D1B2A` (deep navy), `#1B263B` (gunmetal), `#b8a98a` (eski vista gold),
> `#4FE3E8` (cyan-bright), `#0E7C82` (açık tema cyan accent). Bunları görürsen **P1 hata** say.

### Logo — "Sultan Defense Wordmark" (resmi müşteri logosu)

| Dosya | Kullanım |
|-------|----------|
| `sultandefense-logo-dark.png` | Koyu zeminde tam logo (SULTAN altın + DEFENSE açık) |
| `sultandefense-logo-light.png` | Açık zeminde tam logo (SULTAN altın + DEFENSE antrasit) |
| `sultandefense-mark.svg` | SD amblemi — favicon, dar alan, avatar |
| `favicon.ico` | Tarayıcı sekmesi |
| `apple-touch-icon.png` | iOS/Android ana ekran |
| `icon-192.png`, `icon-512.png` | PWA / web manifest |

> Eski **kalkan + SD monogram cyan SVG** logoları silinmiştir. Herhangi bir yerde görünüyorsa P1 hata.
> Eski `vista-logo-*` dosyaları hiçbir yerde görünmemeli.

### Tipografi

| Rol | Font |
|-----|------|
| Başlıklar | **Oswald** veya Cinzel — büyük harf, `letter-spacing` geniş |
| Gövde | **Inter** / system-ui |

---

## Kontrol listesi (her sayfa için)

### Renk & Tema
- [ ] Zemin antrasit `#1A1A1D` (koyu tema) veya parşömen `#F4F1EC` (açık tema)
- [ ] Tüm vurgu/CTA rengi mat altın `#C5A880` — eski cyan (`#2BD4D9`) **YOK**
- [ ] Hover durumu altın `#D4B996` — eski cyan-bright (`#4FE3E8`) **YOK**
- [ ] İkincil detaylarda bordo `#7A1B22` doğru kullanılmış
- [ ] Eski VistaInsaat altın `#b8a98a` **YOK**
- [ ] Koyu/açık toggle çalışıyor; her iki modda kontrast yeterli (WCAG AA)

### Logo & Kimlik
- [ ] Logo: `sultandefense-logo-dark.png` veya `-light.png` (zemine göre) — wordmark doğru
- [ ] Favicon: `sultandefense-mark.svg` / `favicon.ico` — tarayıcı sekmesinde görünüyor
- [ ] Eski kalkan+SD cyan SVG logosu **GÖRÜNMÜYOR**
- [ ] Eski `vista-logo-*` **GÖRÜNMÜYOR**

### İçerik & Metin
- [ ] Görünür metinde **"vista / vistainsaat / inşaat / construction / ensotek / koenig"** **YOK**
- [ ] Site/uygulama adı "Sultan Defense" — eski isimler yok
- [ ] Mail/iletişim bilgilerinde `@koenigsmassage.com` **YOK** (olmalı: `@sultandefense.com`)

### Tipografi
- [ ] Başlıklar Oswald (condensed, uppercase, geniş letter-spacing)
- [ ] Gövde metni Inter / system-ui

### Görseller & Medya
- [ ] Görseller yükleniyor — kırık `img` yok
- [ ] İnşaat/mimari/yapı görselleri kalmamış; savunma/defans görseli var

### Responsive
- [ ] 360 px (mobil) — taşma/bozulma yok
- [ ] 768 px (tablet) — layout sağlam
- [ ] 1280 px (masaüstü) — tam görünüm doğru

### Lokalizasyon
- [ ] Locale switch çalışıyor; metin ilgili dilde
- [ ] Dil seçimi UI'da görünür

---

## Doğrulanacak sayfalar (frontend — port 3040)

Slug haritası: [`docs/content/README.md`](content/README.md)

**Öncelikli:**
`/` · `/about-us` · `/products` + 10 kategori detayı · `/services` · `/certifications` ·
`/faq` · `/contact` · `/privacy-policy` · `/terms-and-conditions` · `/cookie-policy`

---

## Admin panel (port 3041) — Faz 4

> Admin panel **Ensotek**'ten türedi; `globals.css`'de eski coral (`--logo-coral`) tokenlar ve
> `src/styles/presets/` dizininde Ensotek stilleri bulunabilir. Hepsinin temizlendiğini doğrula.

### Admin kontrol listesi
- [ ] Giriş (login) sayfası: antrasit zemin + altın CTA (Ensotek coral **YOK**)
- [ ] Dashboard / sidebar: sultandefense wordmark logosu, altın vurgu
- [ ] Liste, form, JSON tab'ları: dark+light her iki modda görsel olarak sağlam
- [ ] Sidebar'da "Vista" / "Ensotek" / "Koenig" metin referansı **YOK**
- [ ] `globals.css`'de `--logo-coral` veya Ensotek-kaynaklı token **YOK**
- [ ] `public/logo/` klasörü: sultandefense logoları var, `vista-logo-*` **YOK**

---

## Rapor formatı (her faz sonrası)

```
## Faz [N] Görsel QA Raporu — [Tarih]

### [Sayfa / Bileşen]
- ✅ GEÇTI / ⚠️ SORUN / ❌ KRİTİK
- Açıklama (1 satır) + dosya:satır tahmini (varsa)
- Ekran görüntüsü: [artifacts/qa-faz[N]-[slug].png]
```

- Bulguları Codex'e geri besle (Claude review ister).
- **Kör düzeltme yapma** — marka tokenı dışına çıkma, sadece `docs/brand/tokens.css` kullan.
- P1 = blokör (cyan kaldı, logo yanlış, vista metni görünüyor) → Codex'e git, bekle.
- P2 = kozmetik (hafif spacing, opacity) → not al, toplu gönder.

---

## Sıra (Codex fazlarıyla eşleşir)

| Faz | Kapsam | Durum |
|-----|--------|-------|
| Faz 4 | **Admin panel** görsel QA | ⏳ Codex biter bitmez |
| Faz 5 | **Frontend** görsel QA (en kapsamlı) | ⏳ Faz 4'ten sonra |
| Faz 6 | Canlı `https://sultandefense.com` smoke testi (gerçek cihaz/responsive) | ⏳ Deploy sonrası |
