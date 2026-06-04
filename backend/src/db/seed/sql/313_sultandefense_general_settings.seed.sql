-- =============================================================
-- FILE: 313_sultandefense_general_settings.seed.sql
-- Sultan Defense general settings
-- =============================================================

SET NAMES utf8mb4;
SET time_zone = '+00:00';

INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES
  (UUID(), 'sultandefense__socials', 'tr', CAST(JSON_OBJECT(
    'instagram', '',
    'facebook', '',
    'linkedin', '',
    'youtube', '',
    'x', '',
    'tiktok', '',
    'whatsapp', '+905455527535'
  ) AS CHAR CHARACTER SET utf8mb4), NOW(3), NOW(3)),
  (UUID(), 'sultandefense__socials', 'en', CAST(JSON_OBJECT(
    'instagram', '',
    'facebook', '',
    'linkedin', '',
    'youtube', '',
    'x', '',
    'tiktok', '',
    'whatsapp', '+905455527535'
  ) AS CHAR CHARACTER SET utf8mb4), NOW(3), NOW(3))
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`), `updated_at` = VALUES(`updated_at`);

INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES
  (UUID(), 'sultandefense__businessHours', 'tr', CAST(JSON_ARRAY(
    JSON_OBJECT('day', 'Pazartesi', 'open', '09:00', 'close', '18:00', 'closed', false),
    JSON_OBJECT('day', 'Sali', 'open', '09:00', 'close', '18:00', 'closed', false),
    JSON_OBJECT('day', 'Carsamba', 'open', '09:00', 'close', '18:00', 'closed', false),
    JSON_OBJECT('day', 'Persembe', 'open', '09:00', 'close', '18:00', 'closed', false),
    JSON_OBJECT('day', 'Cuma', 'open', '09:00', 'close', '18:00', 'closed', false),
    JSON_OBJECT('day', 'Cumartesi', 'open', '00:00', 'close', '00:00', 'closed', true),
    JSON_OBJECT('day', 'Pazar', 'open', '00:00', 'close', '00:00', 'closed', true)
  ) AS CHAR CHARACTER SET utf8mb4), NOW(3), NOW(3)),
  (UUID(), 'sultandefense__businessHours', 'en', CAST(JSON_ARRAY(
    JSON_OBJECT('day', 'Monday', 'open', '09:00', 'close', '18:00', 'closed', false),
    JSON_OBJECT('day', 'Tuesday', 'open', '09:00', 'close', '18:00', 'closed', false),
    JSON_OBJECT('day', 'Wednesday', 'open', '09:00', 'close', '18:00', 'closed', false),
    JSON_OBJECT('day', 'Thursday', 'open', '09:00', 'close', '18:00', 'closed', false),
    JSON_OBJECT('day', 'Friday', 'open', '09:00', 'close', '18:00', 'closed', false),
    JSON_OBJECT('day', 'Saturday', 'open', '00:00', 'close', '00:00', 'closed', true),
    JSON_OBJECT('day', 'Sunday', 'open', '00:00', 'close', '00:00', 'closed', true)
  ) AS CHAR CHARACTER SET utf8mb4), NOW(3), NOW(3))
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`), `updated_at` = VALUES(`updated_at`);

INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES
  (UUID(), 'sultandefense__company_profile', 'tr', CAST(JSON_OBJECT(
    'company_name', 'Sultan Defense Ltd., Co.',
    'slogan', 'A-Z Savunma Tedariki ve Ihracat Partneri',
    'about', '1996 yilindan bu yana Sultan Defense Ltd., Co. savunma ve askeri ekipman alaninda kuresel tedarik partneri olarak calisir. Turkiye savunma sanayisinin uretim kapasitesini Orta Dogu, Afrika ve Turk Cumhuriyetleri basta olmak uzere uluslararasi kurumlarin operasyonel ihtiyaclariyla bulusturur.'
  ) AS CHAR CHARACTER SET utf8mb4), NOW(3), NOW(3)),
  (UUID(), 'sultandefense__company_profile', 'en', CAST(JSON_OBJECT(
    'company_name', 'Sultan Defense Ltd., Co.',
    'slogan', 'A to Z Defense Procurement & Export Partner',
    'about', 'Established in 1996, Sultan Defense Ltd., Co. is a global supplier and procurement partner in the defense and military sector. We connect Turkey''s advanced defense manufacturing capacity with the operational requirements of armed forces, law enforcement, and security agencies worldwide.'
  ) AS CHAR CHARACTER SET utf8mb4), NOW(3), NOW(3))
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`), `updated_at` = VALUES(`updated_at`);

INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES
  (UUID(), 'sultandefense__ui_header', 'tr', CAST(JSON_OBJECT(
    'nav_home', 'Ana Sayfa',
    'nav_products', 'Urunler',
    'nav_services', 'Tedarik Sureci',
    'nav_gallery', 'Galeri',
    'nav_news', 'Haberler',
    'nav_about', 'Hakkimizda',
    'nav_contact', 'Iletisim',
    'cta_label', 'Teklif Al'
  ) AS CHAR CHARACTER SET utf8mb4), NOW(3), NOW(3)),
  (UUID(), 'sultandefense__ui_header', 'en', CAST(JSON_OBJECT(
    'nav_home', 'Home',
    'nav_products', 'Products',
    'nav_services', 'Procurement',
    'nav_gallery', 'Gallery',
    'nav_news', 'News',
    'nav_about', 'About',
    'nav_contact', 'Contact',
    'cta_label', 'Request a Quote'
  ) AS CHAR CHARACTER SET utf8mb4), NOW(3), NOW(3))
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`), `updated_at` = VALUES(`updated_at`);
