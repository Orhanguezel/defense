# AGENTS.md — Sultan Defense (Codex & diger ajanlar)

Bu repo vistainsaat'ten klonlandi, **sultandefense.com** defans katalog sitesine donusturuluyor.

## 🟢 STRATEJI DEGISIKLIGI — FRONTEND (2026-06-06, Claude) — CODEX DIKKAT

> **Eski `frontend/` (vistainsaat) PASIFE alindi → `_frontend/`.** Yerine bereketfide icin hazirlanmis
> daha zengin frontend (`frontend copy/` → yeni `frontend/`) sultandefense'e donusturuluyor.
>
> - **Frontend icin `docs/CODEX_PROMPT.md`'deki "frontend'i yerinde rebrand" yonergesi ARTIK GECERSIZ.**
> - Frontend isi: master plan **[FRONTEND_SWAP_PLAN.md](FRONTEND_SWAP_PLAN.md)** + Codex briefi
>   **[docs/CODEX_FRONTEND_BRIEF.md](docs/CODEX_FRONTEND_BRIEF.md)**.
> - Is bolumu: Faz 0/1/4 (dizin swap, .env, tema/logo) **Claude**; Faz 2/3/5/6-build **Codex**.
> - Backend (Faz 2-3) + admin panel (Faz 4) rebrand isi asagidaki "Codex'in yapacagi (Faz 2-7)" + docs/CODEX_PROMPT.md sirasiyla AYNEN gecerli.

## 🔴 BRANCH KURALI — KESIN

> **Sadece `main` branch. Baska branch ACMA.**
>
> - Tum degisiklikler dogrudan `main`'e commit edilir.
> - Calismadan once: `git pull --rebase origin main`
> - Is bittikce: kucuk commit + `git push origin main`
> - Ayni dosyada ayni anda baska ajan calisiyorsa bekle.

## Yapilacak is

Marka temizligi: kod tabanindan tum **vistainsaat / vista / insaat** (ve frontend'de **bereketfide**)
referanslarini kaldir, sultandefense kimligiyle degistir. Faz/checklist:
- **Frontend** (yeni bereketfide tabanli): **[FRONTEND_SWAP_PLAN.md](FRONTEND_SWAP_PLAN.md)** + **[docs/CODEX_FRONTEND_BRIEF.md](docs/CODEX_FRONTEND_BRIEF.md)**.
- **Backend + admin panel:** asagidaki "Codex'in yapacagi (Faz 2-7)" bolumu + **[docs/CODEX_PROMPT.md](docs/CODEX_PROMPT.md)**.

## Kurallar

- Bun runtime. `bun install`, `bun run dev`.
- `.env` dosyalari commit EDILMEZ (gitignore'da). Secret'lar regenerate edilecek.
- DB: lokal'de `ALTER TABLE` yasak; seed sql dosyalarini duzenle, `db:seed:*:fresh` calistir.
- TypeScript strict.
- Mimari/plan kararlari Claude Code'a aittir; uygulama (implement) Codex'e.

---

## 🟡 MARKA GUNCELLENDI (2026-06-04, Claude) — DIKKAT CODEX

> **Tema artik "İmparatorluk Zırhı":** Antrasit `#1A1A1D` + Titanyum `#2D3134` zemin,
> **Mat Osmanlı Altını `#C5A880`** ana vurgu, **Derin Bordo `#7A1B22`** ikincil detay.
> **Çelik & Cyan (cyan `#2BD4D9`) ARTIK GECERSIZ.** Guncel degerler: `docs/brand/tokens.css`.
>
> **Logo degisti:** resmi **wordmark** logo (`docs/brand/logo/sultandefense-logo-{dark,light}.png`),
> favicon/apple-touch/icon-192/512 + `sultandefense-mark.svg` (SD amblem) HAZIR.
> Eski kalkan+SD cyan SVG'leri SILINDI.
>
> **Codex yapmasi gereken (onceki cyan implementasyonu uzerine):**
> - Admin/frontend global CSS / tema tokenlarini `docs/brand/tokens.css` (altin/antrasit/bordo) ile guncelle.
> - `admin_panel/public/logo/` ve `frontend/public/logo/` icine kopyaladigin **cyan kalkan** logolari
>   `docs/brand/logo/` wordmark + favicon/apple-touch ile DEGISTIR.
> - cyan hex (`#2BD4D9`, `#0D1B2A`, vb.) gecen yerleri altin/antrasit yap.

## 📌 MEVCUT DURUM & DEVIR (Claude → Codex, 2026-06-04)

### Tamamlanan
- **Faz 0 (altyapi):** repo klonlandi, git/main + origin `defense.git`, secret-koruyan `.gitignore`.
- **Faz 1 (kimlik/config/port):** TAMAMLANDI ve push'landi (kimlik/config/port).
  - **PORTLAR (KESIN):** backend **8090** · frontend **3040** · admin **3041**.
  - package.json name'ler, ecosystem (PM2 isim+cwd+port), .env.example x3, next.config x2,
    project.portfolio.json, kod port fallback'lari (8086→8090) yapildi.
- **Marka karari:** `docs/brand/` — tema **Çelik & Cyan** (Deep Navy `#0D1B2A` + Tactical Cyan `#2BD4D9`),
  koyu+açık, logo **kalkan + SD monogram**. Tokenlar `docs/brand/tokens.css`, logolar `docs/brand/logo/*.svg`.
- **Coming-soon** sayfasi yeni marka ile CANLI (sunucu 187.77.79.59, nginx). Repo: `deploy/coming-soon/`.

### Codex'in yapacagi (Faz 2-7) — REBRAND_CHECKLIST sirasiyla
1. **Faz 0 secret rotation** (lokal `.env`/`.env.production`, gitignore'da — commit etme): JWT/COOKIE/DB/
   Cloudinary/OAuth/SMTP yenile. `MAIL_FROM` su an `info@koenigsmassage.com` (yanlis) → `info@sultandefense.com`.
2. **Faz 2+3 birlikte (KRITIK KUPLAJ):**
   - Seed profili `--profile=vistainsaat` → `sultandefense` (backend/package.json scriptleri + seed loader).
   - **`module_key=vistainsaat`** + **`prefix=vistainsaat__`** + **`vistainsaat_blog`** → `sultandefense*`.
     Bu anahtar backend seed verisi ILE frontend API cagrilarinda (`src/lib/utils.ts`, services) AYNI ANDA
     degismeli, yoksa veri gelmez. Once tum kullanim yerlerini `grep -rn "module_key\|vistainsaat__"` ile cikar.
   - `backend/src/db/seed/sql/*_vistainsaat_*` (30 dosya): SEMA dosyalari isim/yorum temizligi; ICERIK
     (`300_*`..`317_*`) defans verisiyle DOLDUR — kaynak: **`docs/content/site-content-en.md`** (tum sayfa
     metinleri, 10 kategori) + repo kokundeki `sultandefense.com/` gorsel klasorleri (10 kategori = birebir).
   - `backend/src/core/vista-mail.ts` (dosya adi+icerik), `core/env.ts`, modul controller/schema vistainsaat str.
   - DB adi `sultandefense`, sonra `bun run build && bun run db:seed:*:fresh` (ALTER YASAK).
3. **Faz 4 (admin panel):** DIKKAT — admin panel **Ensotek**'ten turedi. `src/app/globals.css` Ensotek
   `--logo-coral` tokenlari + `src/styles/presets/*` var. Bunlari `docs/brand/tokens.css` (cyan) ile degistir.
   Logolar `public/logo/vista-logo-*` → `docs/brand/logo/` kalkan logosu. Locale `src/locale/{tr,en,de}.json`.
4. **Faz 5 (frontend):** tema `vista-construction` (gold `#b8a98a`, Syne/DM Sans) → `sultandefense-tactical`
   (cyan, Oswald/Inter). `src/styles/globals.css` + `src/theme/templates.ts`. Logo/favicon/OG, 19 dil
   `public/locales/*.json`, `public/media/*` (vistainsaat insaat gorselleri → defans). Icerik: `docs/content/`.
5. **Faz 6 (deploy):** sunucu 187.77.79.59 — nginx reverse proxy (8090/3040/3041), MySQL+seed, PM2, Cloudflare
   alt domain (api./admin.). `frontend/nginx-vistainsaat.conf` → sultandefense.
6. **Faz 7 (temizlik):** repo kokundeki ic `sultandefense.com/` gorsel klasorunu duzenli yere tasi; kokte
   bibirikmis `SAVRONIK_*_premium.{jpg,png}` dosyalarini dogru yere al; final `grep -ri "vista\|insaat"` = 0.

### Onemli notlar
- node_modules KOPYALANMADI; her app'te once `bun install`, sonra `bun run build`.
- **Kör sed/replace YAPMA** (`vista`/`insaat` cok genel; degisken adlari/3.parti string bozar). Dosya bazli, anlamli.
- Her fazdan sonra: ilgili app `bun run build` + commit (main) + push.
- Site icerigi tek dogru kaynak: `docs/content/` (README'de sayfa→slug haritasi + sirket bilgileri).

### Orkestrasyon (4 arac)
Claude tasarla → **Codex implement** → **Antigravity gorsel QA** ([`docs/antigravity-qa.md`](docs/antigravity-qa.md))
→ Copilot cilala. Codex her fazı bitirince Antigravity o fazin gorsel dogrulamasini yapar; bulgular Codex'e
geri beslenir (Claude review). Ayni dosyada ayni anda iki arac calismaz.
