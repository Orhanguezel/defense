# Antigravity — Görsel QA Görevi (Sultan Defense Rebrand)

> **Rol:** Antigravity, Codex bir fazı implement ettikten sonra **görsel doğrulama** yapar
> (ekran görüntüsü al → markaya uygunluk + bozulma kontrolü → rapor). Kod yazmaz; sadece
> küçük görsel düzeltmeler gerekiyorsa işaret eder veya uygular.

## 🔴 BRANCH KURALI
- Tek branch: **`main`**. Düzeltme commit'i gerekirse doğrudan main'e, önce `git pull --rebase origin main`.

## Ön koşul (uygulamayı ayağa kaldır)
```bash
# Backend (port 8090) — DB + seed gerekli
cd backend && bun install && bun run build && bun run dev
# Frontend (port 3040)
cd frontend && bun install && bun run dev      # http://localhost:3040
# Admin panel (port 3041)
cd admin_panel && bun install && bun run dev    # http://localhost:3041
```

## Marka referansı (bunlara göre doğrula)
- Kaynak: [`docs/brand/brand-guidelines.md`](brand/brand-guidelines.md), [`docs/brand/tokens.css`](brand/tokens.css)
- **Palet:** zemin Deep Navy `#0D1B2A`, yüzey Gunmetal `#1B263B`, vurgu Tactical Cyan `#2BD4D9`,
  açık tema zemin `#F4F6F8` + accent `#0E7C82`.
- **Logo:** kalkan + SD monogram + "SULTAN / DEFENSE" (Oswald). Eski `vista-logo-*` GÖRÜNMEMELI.
- **Tipografi:** başlıklar Oswald (condensed uppercase), gövde Inter.
- **UI modu:** koyu + açık toggle çalışmalı.

## Doğrulanacak sayfalar (frontend, her locale)
Slug haritası: [`docs/content/README.md`](content/README.md). Öncelik:
`/` · `/about-us` · `/products` + 10 kategori detayı · `/services` · `/certifications` ·
`/faq` · `/contact` · `/privacy-policy` · `/terms-and-conditions` · `/cookie-policy`

## Kontrol listesi (her sayfa için)
- [ ] Renkler markaya uygun (cyan vurgu, navy zemin) — eski **altın/gold** (`#b8a98a`) YOK
- [ ] Logo doğru (kalkan), favicon doğru
- [ ] Görünür metinde **"vista / vistainsaat / inşaat / construction / ensotek / koenig"** YOK
- [ ] Başlıklar Oswald, gövde Inter
- [ ] Koyu/açık toggle bozmuyor; her ikisinde kontrast yeterli (WCAG AA)
- [ ] Görseller yükleniyor (kırık img yok); insaat/mimari görsel kalmamış (defans görseli)
- [ ] Responsive: 360px (mobil), 768px (tablet), 1280px (masaüstü) — taşma/bozulma yok
- [ ] Locale switch çalışıyor; metin ilgili dilde
- [ ] Hover/CTA durumları (cyan-bright `#4FE3E8`) çalışıyor

## Admin panel (port 3041)
- [ ] Login + dashboard tema cyan/navy (Ensotek coral KALMAMIS)
- [ ] Sidebar/logo sultandefense
- [ ] Liste/form/JSON tab'ları görsel olarak sağlam (dark+light)

## Rapor formatı (her faz sonrası)
- Sayfa başına: ✅ geçti / ⚠️ sorun (ekran görüntüsü + 1 satır açıklama + dosya:satır tahmini)
- Bulguları Codex'e geri besle (Claude review ister). Kör düzeltme yapma; marka tokenı dışına çıkma.

## Sıra (Codex fazlarıyla eşleşir)
1. Faz 4 bitince → **admin panel** görsel QA
2. Faz 5 bitince → **frontend** görsel QA (en kapsamlı)
3. Faz 6 (deploy) sonrası → canlı `https://sultandefense.com` smoke (gerçek cihaz/responsive)
