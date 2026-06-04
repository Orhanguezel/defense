# AGENTS.md — Sultan Defense (Codex & diger ajanlar)

Bu repo vistainsaat'ten klonlandi, **sultandefense.com** defans katalog sitesine donusturuluyor.

## 🔴 BRANCH KURALI — KESIN

> **Sadece `main` branch. Baska branch ACMA.**
>
> - Tum degisiklikler dogrudan `main`'e commit edilir.
> - Calismadan once: `git pull --rebase origin main`
> - Is bittikce: kucuk commit + `git push origin main`
> - Ayni dosyada ayni anda baska ajan calisiyorsa bekle.

## Yapilacak is

Marka temizligi: kod tabanindan tum **vistainsaat / vista / insaat** referanslarini kaldir,
sultandefense kimligiyle degistir. Tam liste ve sira: **[REBRAND_CHECKLIST.md](REBRAND_CHECKLIST.md)**.

## Kurallar

- Bun runtime. `bun install`, `bun run dev`.
- `.env` dosyalari commit EDILMEZ (gitignore'da). Secret'lar regenerate edilecek.
- DB: lokal'de `ALTER TABLE` yasak; seed sql dosyalarini duzenle, `db:seed:*:fresh` calistir.
- TypeScript strict.
- Mimari/plan kararlari Claude Code'a aittir; uygulama (implement) Codex'e.
