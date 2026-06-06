# Sultan Defense — Yapılacaklar (yeni frontend / migration sonrası)

> 🟢 **2026-06-06:** Bu liste önce **eski frontend** (artık `_frontend/`, pasif) içindi. Frontend artık
> bereketfide tabanlı yeni `frontend/`'e geçiyor (bkz. [FRONTEND_SWAP_PLAN.md](FRONTEND_SWAP_PLAN.md)).
> Aşağıdaki maddeler **yeni frontend** üzerinde **migration tamamlandıktan sonra** doğrulanacak/yapılacak.
> Salt eski-frontend stiline ait bug'lar (örn. eski Footer/Header kontrastı) yeni kod tabanında **tekrar
> doğrulanmalı** — yeni frontend kendi bileşenlerine sahip, sorun çözülmüş ya da farklı yerde olabilir.
> Tek branch: `main`. Her madde bitince `[x]` işaretle.

## 🔁 Migration sonrası doğrulama (yeni frontend)
> Bunlar eski frontend'de bilinen sorun/istekti; yeni frontend'de **kontrol et**, gerekiyorsa uygula.
- [ ] **Teklif (RFQ) formu uçtan uca** — gönderim → backend kaydı (`source=sultandefense`) → mail. Çalışmıyorsa düzelt.
      (yeni `frontend` `teklif` sayfası + `src/features/offer` + backend `modules/offer`.)
- [ ] **Arama (search)** çalışıyor mu — yeni frontend'de `arama/` sayfası ve `lib/site-search.ts` (`module_key=sultandefense`) ile sonuç geliyor mu.
- [ ] **İstatistik bölümü dinamik** — "15+ Yıl / 100+ Ürün / 50+ …" değerleri hardcoded ise `site_settings`'ten admin panelden ayarlanabilir yap.
- [ ] **Hamburger / mega menü** — "Ürünler" altına ürün-kategori alt listesi (yeni `Header` `getMegaColumns` muadili).
- [ ] **Dark mode kontrast** — teklif CTA bölümü ve footer firma adı ("Sultan Defense Ltd., Co.") koyu zeminde okunur olsun.
- [ ] **Hero video** — placeholder/404 durumu: montaj üret / video gönder / kapat (karar bekliyor).

## 🔌 Entegrasyon / Ayar (frontend-bağımsız, secret gerektirir — `docs/SECRET_ROTATION.md`)
- [ ] **reCAPTCHA** site+secret key → form spam koruması
      (backend `RECAPTCHA_SECRET_KEY`, frontend `NEXT_PUBLIC_RECAPTCHA_SITE_KEY`, `RECAPTCHA_ENABLED=1`).
- [ ] **E-posta (SMTP)** ayarları → iletişim/teklif maili
      (backend `SMTP_HOST/PORT/USER/PASS`, `MAIL_FROM=info@sultandefense.com`).
- [ ] **Analytics** — GA/GTM/Google Ads ID'leri (eski bereketfide hesapları temizlendi) → sultandefense hesabıyla doldur veya boş bırak.

## 🚀 Deploy (yeni frontend canlıya alınınca)
- [ ] Yeni frontend deploy edilince canlı site eski (`_frontend`) yerine yeni build'i sunsun (PM2/nginx — `deploy/`).
- [ ] Canlı **Lighthouse + SEO** denetimi (yeni frontend ile).

---
**Notlar:**
- reCAPTCHA + SMTP + Analytics harici hesap/anahtar gerektirir (kullanıcı sağlayacak).
- Eski `_frontend/` arşiv olarak duruyor; deploy/build kapsamı dışında.
