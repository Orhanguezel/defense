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
| `sultandefense-logo-dark.png` | Koyu zeminde tam logo |
| `sultandefense-logo-light.png` | Açık zeminde tam logo |
| `sultandefense-mark.svg` | SD amblemi — favicon, dar alan |
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

## 📋 Faz 4 — Admin Panel Durum Raporu (2026-06-04)

### ✅ Tamamlananlar

- [x] **`admin_panel/src/app/globals.css`** — `--logo-coral*` token isimleri korundu (legacy Ensotek isimleri), ancak **değerleri İmparatorluk Zırhı altın paleti** (`#C5A880`, `#D4B996`, `#1A1A1D` vb.) olarak güncellendi. `--primary` → `var(--logo-coral)` (mat altın).
- [x] **`admin_panel/public/logo/`** — `sultandefense-logo-dark.png`, `sultandefense-logo-light.png`, `sultandefense-mark.svg` mevcut. Eski cyan SVG logoları silindi.
- [x] **`admin_panel/public/`** — `favicon.ico`, `apple-touch-icon.png`, `icon-192.png`, `icon-512.png` kopyalandı.
- [x] **`admin_panel/src/app/(main)/auth/_components/auth-brand-panel.tsx`** — Login sol panel tamamen yeniden yazıldı: antrasit zemin + altın gradient overlay + `login-bg.png` arka plan + altın glassmorphic kart + wordmark logo fallback.
- [x] **`admin_panel/src/config/app-config.ts`** — `app_name`, `theme_color` (`#1A1A1D`), OG görseli (`sultandefense-logo-light.png`) güncellendi. Tüm "Sultan Defense" olarak temiz.
- [x] **`frontend/public/logo/`** — Wordmark PNG logolar + `sultandefense-mark.svg` mevcut. SVG kalkanlı eski logolar silindi.
- [x] **`frontend/public/`** — `favicon.ico`, `apple-touch-icon.png`, `icon-192.png`, `icon-512.png` kopyalandı.
- [x] **`frontend/src/styles/globals.css`** — Primitive token isimleri `--cyan-*` / `--navy-*` (legacy alias) korundu, **değerleri tamamen altın/antrasit paletine** dönüştürüldü. Koyu tema, açık tema, glass efektler, CTA yüzeyleri, animasyonlar — hepsi İmparatorluk Zırhı paleti.
- [x] **`frontend/src/theme/templates.ts`** — `sultandefense-imperial-armor` template aktif.

---

### ⚠️ Kalan Sorunlar — Codex'e Bildir

#### P2 — İç Kod Temizliği (görsel etkisi yok ama rebrand tutarlılığı için gerekli)

1. **`admin_panel/src/navigation/sidebar/sidebar-items.ts`** — Sidebar item key'leri hâlâ `vista_*` prefix kullanıyor (`vista_insaat`, `vista_projects`, `vista_categories` vb.). Bunlar **iç TypeScript key isimleri** olduğu için ekranda görünmüyor (labels ayrı), ancak Faz 7 temizliğinde `sultandefense_*` olarak yeniden adlandırılmalı.
   - Etkilenen: `sidebar-items.ts` satır 102–168, `adminUi.ts` satır 74–170+

2. **`admin_panel/src/app/(main)/admin/(admin)/site-settings/…`** — `VISTA_BRAND`, `VISTA_PREFIX` değişken isimleri `SD_BRAND`, `SD_PREFIX` olarak yeniden adlandırılmalı (değerleri zaten `'sultandefense'` / `'sultandefense__'`).
   - Dosya: `admin-site_settings-detail-client.tsx` satır 462–471

3. **`admin_panel/src/integrations/`** — Dosya başlık yorumlarında `// Ensotek –` ibareleri mevcut (50+ dosya). Bunlar sadece yorum satırı; görsel etkisi **sıfır**. Faz 7 toplu temizlik.

#### ❓ Görsel QA Bekliyor (Admin panel çalışır durumda olmadan doğrulanamaz)

- [ ] Login sayfası gerçek tarayıcıda render edildi mi? (`login-bg.png` yükleniyor mu?)
- [ ] Sidebar logo: wordmark PNG görünüyor mu? (Sidebar logo bileşeni ayrıca kontrol gerektirir)
- [ ] Dashboard dark/light toggle çalışıyor mu?
- [ ] `--logo-coral` token değerleri canlıda doğru render ediliyor mu?
- [ ] `public/logo/png/vista_logo_512.png` hâlâ `admin_panel/public/logo/png/` içinde duruyor — silinmeli veya kullanılmıyorsa Faz 7'ye ertelenmeli.

---

## 📋 Faz 5 — Frontend Durum Raporu

### ✅ Tamamlananlar (CSS/Token Seviyesinde)

- [x] `frontend/src/styles/globals.css` — İmparatorluk Zırhı palet tamam.
- [x] `frontend/src/theme/templates.ts` — `sultandefense-imperial-armor` aktif.
- [x] `frontend/public/logo/` — Wordmark PNG + mark.svg mevcut.
- [x] `frontend/public/` — Favicon/icon seti mevcut.

### ❌ Henüz Yapılmamış (Codex — Faz 5 devam)

- [ ] Frontend sayfalarının **içerik** rebrand'ı tamamlanmadı (seed verisi henüz defans verisi değil → backend Faz 2+3 önce bitmeli).
- [ ] 19 dil `public/locales/*.json` — "vistainsaat / inşaat / construction" içerik temizliği.
- [ ] `public/media/*` — İnşaat görselleri → defans görselleriyle değiştirilmedi.
- [ ] Locale switch ve tüm sayfaların görsel QA'sı yapılmadı (backend + seed hazır olunca).

---

## Kontrol listesi (her sayfa için — frontend görsel QA)

### Renk & Tema
- [ ] Zemin antrasit `#1A1A1D` (koyu) veya parşömen `#F4F1EC` (açık)
- [ ] Vurgu/CTA mat altın `#C5A880` — cyan YOK
- [ ] Hover altın `#D4B996` — cyan-bright YOK
- [ ] İkincil detaylarda bordo `#7A1B22`
- [ ] Eski vista gold `#b8a98a` YOK
- [ ] Dark/light toggle çalışıyor

### Logo & Kimlik
- [ ] Logo: wordmark PNG (`-dark.png` veya `-light.png`) doğru
- [ ] Favicon: `sultandefense-mark.svg` / `favicon.ico`
- [ ] Eski kalkan+SD cyan SVG GÖRÜNMÜYOR
- [ ] `vista-logo-*` GÖRÜNMÜYOR

### İçerik & Metin
- [ ] "vista / vistainsaat / inşaat / construction / ensotek / koenig" YOK
- [ ] Mail: `@sultandefense.com` (yoksa `@koenigsmassage.com` P1)

### Tipografi
- [ ] Başlıklar Oswald
- [ ] Gövde Inter

### Görseller & Medya
- [ ] Kırık `img` yok
- [ ] İnşaat görseli kalmamış; defans görseli var

### Responsive
- [ ] 360 px — taşma yok
- [ ] 768 px — layout sağlam
- [ ] 1280 px — tam görünüm doğru

### Lokalizasyon
- [ ] Locale switch çalışıyor
- [ ] Metin ilgili dilde

---

## Doğrulanacak sayfalar (frontend — port 3040)

Slug haritası: [`docs/content/README.md`](content/README.md)

`/` · `/about-us` · `/products` + 10 kategori · `/services` · `/certifications` ·
`/faq` · `/contact` · `/privacy-policy` · `/terms-and-conditions` · `/cookie-policy`

---

## Rapor formatı (her faz sonrası)

```
## Faz [N] Görsel QA Raporu — [Tarih]

### [Sayfa / Bileşen]
- ✅ GEÇTİ / ⚠️ SORUN (P2) / ❌ KRİTİK (P1)
- Açıklama (1 satır) + dosya:satır tahmini
- Ekran görüntüsü: artifacts/qa-faz[N]-[slug].png
```

- P1 = blokör (cyan kaldı, logo yanlış, vista metni görünüyor) → Codex'e git, bekle.
- P2 = kozmetik (hafif spacing, opacity) → not al, toplu gönder.
- **Kör düzeltme yapma** — sadece `docs/brand/tokens.css` tokenlarını kullan.

---

## Sıra (Codex fazlarıyla eşleşir)

| Faz | Kapsam | Durum |
|-----|--------|-------|
| Faz 4 | Admin panel CSS/logo/login | ✅ Implement tamamlandı — görsel QA bekliyor (canlı test) |
| Faz 2+3 | Backend seed + module_key rebrand | ⏳ Codex devam ediyor |
| Faz 5 | Frontend içerik + locale + medya | ⏳ Faz 2+3 bittikten sonra |
| Faz 6 | Canlı smoke testi (`https://sultandefense.com`) | ⏳ Deploy sonrası |
