# Codex Görev Prompt'u — Sultan Defense Rebrand (bulk + içerik)

> Bu dosya Codex'e verilecek görev tanımıdır. Claude (mimar) tema/logo/deploy'u üstlendi;
> **Codex bulk string temizliği + seed/locale içerik doldurmayı** yapar.

---

## Bağlam
- Repo: `github.com/Orhanguezel/defense.git` · **TEK BRANCH: `main`** (feature branch açma).
- Çalışmadan önce `git pull --rebase origin main`; iş bittikçe **küçük commit + `git push`**.
- Kod tabanı **vistainsaat** (inşaat) + admin panel **Ensotek** kökenli. Hedef: **sultandefense.com** defans katalog.
- Marka: **"İmparatorluk Zırhı"** — Antrasit `#1A1A1D`, Titanyum `#2D3134`, Mat Altın `#C5A880`, Bordo `#7A1B22`.
  Token kaynağı: `docs/brand/tokens.css`. Logo: `docs/brand/logo/` (wordmark + favicon).
- İçerik kaynağı (tek doğru): `docs/content/site-content-en.md` + `docs/content/README.md` (sayfa→slug, 10 kategori, şirket bilgisi).
- Tema/logo ZATEN BİTTİ (Claude). **Renk/token'a dokunma**; sadece string/içerik/marka temizliği.

## 🔴 KURALLAR
1. **Kör `sed`/replace YASAK.** `vista`/`insaat`/`ensotek` çok genel — değişken adı (`vistaButton`),
   3. parti string, `--logo-coral` gibi **kod tarafından referanslanan token isimleri** bozulabilir.
   Dosya bazlı, anlamlı değişim yap. Token İSİMLERİNİ değiştirme (değerleri zaten altın).
2. Her fazdan sonra ilgili app `bun run build` (veya `type-check`) **+ `bun run dev` ile çalıştığını doğrula** + commit + push.
3. `*/` içeren CSS yorumu yazma (yorumu erken kapatır — frontend'i kırar).
4. `.env*` commit etme (gitignore'da). Secret üretme — Claude/kullanıcı yapacak.
5. DB: **`ALTER TABLE` YASAK**; seed `*.sql` dosyalarını düzenle, `db:seed:sultandefense:fresh`.

## Görevler (REBRAND_CHECKLIST sırasıyla)

### 1. Backend kod (Faz 2)
- `backend/src` içindeki kalan `vistainsaat` / `ensotek` / `kompozit` stringleri (≈28 ensotek dosyası backend/src).
- `core/env.ts` default'ları; `modules/{products,offer,services,gallery}` controller/schema/validation marka stringleri.
- **KRİTİK kuplaj:** `module_key` / `prefix` değerleri (`vistainsaat` / `ensotek` → `sultandefense`).
  Backend seed verisi ILE frontend API çağrıları (`frontend/src/lib`, services) **AYNI ANDA** değişmeli.
  Önce `grep -rn "module_key\|prefix.*=\|vistainsaat__\|ensotek"` ile tüm kullanımları çıkar.

### 2. Seed İÇERİK (Faz 3) — dosya adları hazır, DATA doldurulacak
- `300_categories`, `306_products`, `307_gallery`, `310_brand_references` → **10 defans kategorisi**
  (Ballistic Protection, Communication & Command Electronics, Containerized Field Kitchen,
  Field Support Logistics, Naval & Marine Systems, Power/Battery/Generator, Shield & Riot Control,
  Surveillance/Sensors/Security, Tactical Gear & Textile, Training & Simulation Software).
  Metin: `docs/content/site-content-en.md` (her kategorinin overview + key solutions'ı var).
  Görsel: repo kökü `sultandefense.com/<Kategori>/...` klasörleri (birebir eşleşir).
- `301/311/313/314` settings/branding → sultandefense (logo=wordmark, renk=altın/antrasit, iletişim:
  export@sultandefense.com, +90 545 552 75 35, İzmir adresi — README'de).
- `304_blog`,`305_pages`,`302_menu`,`303_footer`,`312_seo_pages` → defans içerik veya boş + admin'den.
- Sonra: DB `sultandefense` ile `bun run build && bun run db:seed:sultandefense:fresh` çalıştır, doğrula.

### 3. Admin panel ensotek temizliği (Faz 4)
- `admin_panel/src` 48 dosyada `ensotek` izi: comment, string, `admin_panel/CLAUDE.md` HARİÇ (Claude yapıyor).
- `src/locale/{tr,en,de}.json` marka metni; `sidebar-items.ts`; `server/fetch-branding.ts`; `product_admin.types.ts`.
- `--logo-coral` token İSMİNİ DEĞİŞTİRME (değer zaten altın); sadece yorum/açıklama netleştir.

### 4. Frontend içerik (Faz 5)
- `public/locales/*.json` (19 dil) — "inşaat/construction" metinleri → defans. Hero örneği: `tr.json`
  içinde "TÜRKİYE'NİN LİDER İNŞAAT FİRMASI" → defans tedarik mesajı (`docs/content` homepage).
- Hangi dillerin kalacağına karar (defans B2B için TR/EN + Orta Doğu/Afrika dilleri öncelikli — Claude'a sor).
- `src/features/projects/products.service.ts` + ürün/proje bileşenleri; SEO meta/JSON-LD (Organization → Sultan Defense Ltd.).
- `frontend/carbon-fiber.jpg` + kompozit/inşaat artıklarını sil.

## Bitince
- Her fazı commit + push; `docs/antigravity-qa.md`'ye göre Antigravity görsel QA yapacak.
- `REBRAND_CHECKLIST.md`'de tamamladığın maddeyi `[x]` işaretle.
- Takıldığın mimari karar (module_key, dil seti, seed yapısı) → Claude'a bırak.
