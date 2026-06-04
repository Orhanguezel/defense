-- =============================================================
-- FILE: 315_sultandefense_hero_video.seed.sql
-- Sultan Defense — Hero video storage + site_settings
-- =============================================================

SET NAMES utf8mb4;
SET time_zone = '+00:00';

-- =============================================================
-- STORAGE ASSETS — Hero Videolar
-- =============================================================
INSERT INTO `storage_assets` (`id`, `user_id`, `name`, `bucket`, `path`, `folder`, `mime`, `size`, `width`, `height`, `url`, `provider`, `provider_public_id`, `provider_resource_type`, `provider_format`, `metadata`, `created_at`, `updated_at`)
VALUES
  ('sa-video-0001-0001-0001-000000000001', NULL, 'hero-desktop.mp4', 'video', 'video/hero-desktop.mp4', 'video', 'video/mp4', 98100358, 1920, 1080, '/uploads/video/hero-desktop.mp4', 'local', 'video/hero-desktop.mp4', 'video', 'mp4', '{"label": "Hero Video (Desktop)"}', NOW(3), NOW(3)),
  ('sa-video-0002-0002-0002-000000000002', NULL, 'hero-mobile.mp4', 'video', 'video/hero-mobile.mp4', 'video', 'video/mp4', 85691526, 1080, 1920, '/uploads/video/hero-mobile.mp4', 'local', 'video/hero-mobile.mp4', 'video', 'mp4', '{"label": "Hero Video (Mobile)"}', NOW(3), NOW(3))
ON DUPLICATE KEY UPDATE `url` = VALUES(`url`), `updated_at` = VALUES(`updated_at`);

-- =============================================================
-- SITE SETTINGS — Hero / Anasayfa Ayarları (locale='*')
-- =============================================================
INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES (
  UUID(),
  'sultandefense__hero',
  '*',
  CAST(JSON_OBJECT(
    'video_desktop', '/uploads/video/hero-desktop.mp4',
    'video_mobile', '/uploads/video/hero-mobile.mp4',
    'video_poster', '',
    'headline_tr', 'Savunma Tedarikinde Guvenilir Ihracat Ortagi',
    'headline_en', 'Trusted Export Partner for Defense Procurement',
    'subheadline_tr', 'Kara sistemleri, balistik koruma, taktik ekipman, elektronik ve lojistik sureclerini tek dosyada yonetiyoruz.',
    'subheadline_en', 'We coordinate land systems, ballistic protection, tactical equipment, electronics, and logistics in one procurement workflow.',
    'cta_text_tr', 'Urunleri Inceleyin',
    'cta_text_en', 'Explore Products',
    'cta_url', '/[locale]/urunler'
  ) AS CHAR CHARACTER SET utf8mb4),
  NOW(3), NOW(3)
)
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`), `updated_at` = VALUES(`updated_at`);
