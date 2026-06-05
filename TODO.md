# Sultan Defense — Yapılacaklar (post-launch)

> Site canlı (https://sultandefense.com). Bunlar sonradan yapılacak iyileştirme/düzeltmeler.
> Tek branch: `main`. Her madde bitince `[x]` işaretle.

## 🎨 Tema / Kontrast (dark mode)
- [ ] **Teklif CTA bölümü** dark mode kontrast — "Talebiniz İçin Ücretsiz Keşif ve Teklif Hazırlayalım /
      Savunma tedariki, ihracat kapsamı, hedef ülke ve teslimat beklentilerinizi..." bölümü dark'ta okunur olsun.
      (Anasayfa offer-CTA section; metin/zemin kontrastı.)
- [ ] **Footer firma adı** "Sultan Defense Ltd., Co." dark mode'da kontrast — koyu zeminde soluk kalıyor,
      okunur renge çek. (`frontend/src/components/layout/Footer.tsx` — `<h3>` company_name.)

## 📊 Dinamik içerik (admin panelden)
- [ ] **İstatistik bölümü dinamik olsun** — "15+ Yıllık Deneyim / 100+ Tamamlanan Ürün / 50+ ..." değerleri
      şu an sabit (hardcoded). Admin panelden (site_settings) ayarlanabilir hale getir.
      (Anasayfa stats section; sayı + etiketler DB'den okunsun, admin'de düzenlenebilsin.)

## 🧭 Navigasyon
- [ ] **Hamburger mega menü** — açılan büyük menüde **"Ürünler"** linkinin altına ürün/kategori listesinin
      bir kısmı sıralansın (alt linkler). (`frontend/src/components/layout/Header.tsx` — `getMegaColumns`,
      şu an "Ürünler" sütunu kategori linklerini gösteriyor; ürün alt-listesi eklenecek/düzenlenecek.)

## 🔌 Entegrasyon / Ayar (secret gerektirir — `docs/SECRET_ROTATION.md`)
- [ ] **reCAPTCHA** site+secret key gir → form spam koruması aktif et
      (backend `RECAPTCHA_SECRET_KEY`, frontend `NEXT_PUBLIC_RECAPTCHA_SITE_KEY`, `RECAPTCHA_ENABLED=1`).
- [ ] **E-posta (SMTP) ayarları** gir → iletişim/teklif formu maili gönderebilsin
      (backend `SMTP_HOST/PORT/USER/PASS`, `MAIL_FROM=info@sultandefense.com`).

## ✅ Fonksiyon kontrolü / hata
- [ ] **Teklif formu çalışıyor mu?** uçtan uca test (gönderim → backend kaydı/mail). Çalışmıyorsa düzelt.
      (`frontend/.../teklif` + `frontend/src/features` + backend `modules/offer`.)
- [ ] **Arama (search) çalışmıyor** → düzelt. Header'daki arama kutusu sonuç getirmiyor.
      (`frontend/src/components/layout/Header.tsx` arama input + arama sayfası/endpoint kontrolü.)

---
**Notlar:**
- reCAPTCHA + SMTP harici hesap/anahtar gerektirir (kullanıcı sağlayacak).
- Hero video hâlâ placeholder (404) — ayrı karar: montaj üret / video gönder / kapat.
