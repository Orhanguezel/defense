-- =============================================================
-- FILE: 317_sultandefense_home_media.seed.sql
-- Sultan Defense — Anasayfa medya ayarlari (yeni frontend semasi)
--   * hero_video        : hero arka plan videosu (admin'den degistirilebilir)
--   * home_backgrounds  : kaydirmali sabit arka plan gorselleri (ScrollBackground)
-- Frontend bu anahtarlari fetchSetting('hero_video'|'home_backgrounds', prefix=sultandefense__) ile okur.
-- Medya dosyalari backend uploads altinda: /uploads/video/, /uploads/backgrounds/
-- =============================================================

SET NAMES utf8mb4;
SET time_zone = '+00:00';

-- Onceki kayitlari temizle (idempotent: fresh'te no-op, canli'da guncelle)
DELETE FROM `site_settings`
 WHERE `key` IN ('sultandefense__hero_video', 'sultandefense__home_backgrounds')
   AND `locale` = '*';

INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
 (UUID(), 'sultandefense__hero_video', '*',
  '{"url":"/uploads/video/hero.mp4","poster":"","alt":"Sultan Defense"}',
  NOW(3), NOW(3)),
 (UUID(), 'sultandefense__home_backgrounds', '*',
  '[{"url":"/uploads/backgrounds/defense-bg-1.jpg","alt":"Sultan Defense"},{"url":"/uploads/backgrounds/defense-bg-2.jpg","alt":"Sultan Defense"},{"url":"/uploads/backgrounds/defense-bg-3.jpg","alt":"Sultan Defense"},{"url":"/uploads/backgrounds/defense-bg-4.jpg","alt":"Sultan Defense"}]',
  NOW(3), NOW(3));
