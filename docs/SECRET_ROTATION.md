# Secret Rotation — Sultan Defense (Faz 0)

> Kod tabanı vistainsaat'ten klonlandığı için `.env` / `.env.production` dosyalarında **vistainsaat'in
> canlı secret'ları** geldi. Yeni proje için **hepsi yenilenmeli.** Bu dosya **gerçek secret İÇERMEZ**
> (git'e secret commit edilmez); sadece ne yapılacağını ve nasıl üretileceğini anlatır.

## 🔴 Kurallar
- `.env*` dosyaları gitignore'da — **commit etme** (sadece `.env.example` izinli).
- Secret'ları sadece sunucudaki/lokaldeki `.env` dosyalarına yaz.
- Eski vistainsaat secret'larını **geçersiz say** (paylaşıldıysa ilgili serviste iptal et).

## 1. Lokalde üretilenler (hemen yapılabilir)
```bash
# JWT ve COOKIE secret (her biri ayrı çalıştır)
openssl rand -hex 32     # -> JWT_SECRET
openssl rand -hex 32     # -> COOKIE_SECRET
# Geçici admin / DB şifresi (gerekiyorsa)
openssl rand -base64 24
```
`backend/.env` içine yaz: `JWT_SECRET=...`, `COOKIE_SECRET=...`

## 2. Kimlik / DB / URL (lokal `.env`)
| Değişken | Yeni değer |
|----------|-----------|
| `DB_NAME` | `sultandefense` |
| `PORT` (backend) | `8090` |
| `FRONTEND_URL` | `http://localhost:3040` (prod: `https://sultandefense.com`) |
| `PUBLIC_URL` / `PUBLIC_API_BASE` | `http://localhost:8090` (prod: `https://sultandefense.com`) |
| `CORS_ORIGIN` | `http://localhost:3040,http://localhost:3041` (prod: domainler) |
| `MAIL_FROM` | `info@sultandefense.com` ⚠️ (kopyada `info@koenigsmassage.com` kalmış — DÜZELT) |
| `AUTH_ADMIN_EMAILS` / `SEED_ADMIN_EMAIL` | sultandefense admin mailleri |

## 3. 3. parti servisler (yeni hesap/anahtar gerekir — kullanıcı/Claude)
| Servis | Yapılacak |
|--------|-----------|
| **Cloudinary** | sultandefense hesabı/folder; `CLOUDINARY_CLOUD_NAME/API_KEY/API_SECRET`, `CLOUDINARY_FOLDER=sultandefense` |
| **Google OAuth** | Yeni OAuth Client; redirect URI = `https://sultandefense.com/...`; `GOOGLE_CLIENT_ID/SECRET` |
| **reCAPTCHA** | `sultandefense.com` domaini için yeni site+secret key; `RECAPTCHA_SECRET_KEY`, FE `NEXT_PUBLIC_RECAPTCHA_SITE_KEY` |
| **SMTP** | sultandefense mail kutusu; `SMTP_HOST/PORT/USER/PASS`, `SMTP_SECURE` |
| **Groq** (AI destek) | Gerekiyorsa yeni `GROQ_API_KEY` (yoksa `AI_SUPPORT_ENABLED=0`) |
| **Analytics** | `NEXT_PUBLIC_GA_ID`, `NEXT_PUBLIC_GTM_*` → sultandefense hesabı veya kaldır |

## 4. Prod (`.env.production` — sunucuda)
- Lokaldeki ile aynı yapı; URL'ler `https://sultandefense.com`, DB prod kullanıcı/şifre.
- Sunucuya **scp** ile gönder, repoya koyma.

## Durum
- [ ] JWT_SECRET / COOKIE_SECRET üretildi (lokal + prod)
- [ ] DB_NAME=sultandefense, portlar, URL'ler, CORS güncel
- [ ] MAIL_FROM düzeltildi
- [ ] Cloudinary / Google / reCAPTCHA / SMTP / Groq yeni anahtarlar
- [ ] Analytics ID'leri
- [ ] Eski vistainsaat secret'ları geçersiz kılındı
