-- =============================================================
-- FILE: 301_sultandefense_site_settings.seed.sql
-- Sultan Defense site_settings
-- Keys: app_locales, seo, logo, site_logo, favicon, OG, contact_info, branding
-- =============================================================

SET NAMES utf8mb4;
SET time_zone = '+00:00';
SET FOREIGN_KEY_CHECKS = 0;

START TRANSACTION;

INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES (
  UUID(),
  'sultandefense__app_locales',
  '*',
  JSON_ARRAY(
    JSON_OBJECT('code', 'en', 'label', 'English', 'is_default', true, 'is_active', true),
    JSON_OBJECT('code', 'de', 'label', 'Deutsch', 'is_default', false, 'is_active', true),
    JSON_OBJECT('code', 'ar', 'label', 'العربية', 'is_default', false, 'is_active', true),
    JSON_OBJECT('code', 'ru', 'label', 'Русский', 'is_default', false, 'is_active', true),
    JSON_OBJECT('code', 'tr', 'label', 'Turkce', 'is_default', false, 'is_active', false)
  ),
  NOW(3), NOW(3)
)
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`), `updated_at` = VALUES(`updated_at`);

INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES (
  UUID(),
  'sultandefense__seo',
  'tr',
  JSON_OBJECT(
    'site_title', 'Sultan Defense | Savunma Tedariki ve Taktik Ekipman',
    'site_description', 'Sultan Defense, Orta Dogu, Afrika ve Turk Cumhuriyetleri icin uc uca savunma tedariki, taktik ekipman ve ihracat cozumleri sunar.',
    'keywords', 'savunma tedariki, askeri ekipman, taktik ekipman, balistik koruma, askeri ihracat, Sultan Defense',
    'og_image', '/logo/png/sultandefense_logo_512.png',
    'og_type', 'website'
  ),
  NOW(3), NOW(3)
)
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`), `updated_at` = VALUES(`updated_at`);

INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES (
  UUID(),
  'sultandefense__seo',
  'en',
  JSON_OBJECT(
    'site_title', 'Defense Procurement & Tactical Equipment | Sultan Defense',
    'site_description', 'Sultan Defense provides comprehensive military procurement solutions, supplying tactical gear and defense technologies to the Middle East, Africa, and Turkic Republics.',
    'keywords', 'defense procurement, tactical gear, military equipment, ballistic protection, export compliance, Sultan Defense',
    'og_image', '/logo/png/sultandefense_logo_512.png',
    'og_type', 'website'
  ),
  NOW(3), NOW(3)
)
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`), `updated_at` = VALUES(`updated_at`);

INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES (
  UUID(),
  'sultandefense__logo',
  '*',
  JSON_OBJECT(
    'logo_url', '/logo/sultandefense-logo-dark.png',
    'logo_alt', 'Sultan Defense',
    'favicon_url', '/favicon.ico',
    'logo_dark_url', '/logo/sultandefense-logo-dark.png'
  ),
  NOW(3), NOW(3)
)
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`), `updated_at` = VALUES(`updated_at`);

INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES (
  UUID(),
  'sultandefense__site_logo',
  '*',
  JSON_OBJECT(
    'logo_url', '/logo/sultandefense-logo-dark.png',
    'logo_alt', 'Sultan Defense',
    'logo_dark_url', '/logo/sultandefense-logo-dark.png',
    'favicon_url', '/favicon.ico',
    'apple_touch_icon_url', '/apple-icon.png'
  ),
  NOW(3), NOW(3)
)
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`), `updated_at` = VALUES(`updated_at`);

INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES
  (UUID(), 'sultandefense__site_favicon', '*', JSON_OBJECT('url', '/favicon.ico', 'alt', 'Sultan Defense Favicon'), NOW(3), NOW(3)),
  (UUID(), 'sultandefense__site_apple_touch_icon', '*', JSON_OBJECT('url', '/apple-icon.png', 'alt', 'Sultan Defense Apple Touch Icon'), NOW(3), NOW(3)),
  (UUID(), 'sultandefense__site_og_default_image', '*', JSON_OBJECT('url', '/logo/png/sultandefense_logo_512.png', 'alt', 'Sultan Defense'), NOW(3), NOW(3))
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`), `updated_at` = VALUES(`updated_at`);

INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES (
  UUID(),
  'sultandefense__contact_info',
  'tr',
  JSON_OBJECT(
    'company_name', 'Sultan Defense Ltd., Co.',
    'address', 'Folkart Time 1 - Office Blocks, Kazimdirik, Kat 6, Daire 612',
    'city', 'Bornova, Izmir',
    'country', 'Turkiye',
    'phone', '+90 545 552 75 35',
    'phone_2', '+90 545 552 75 35',
    'email', 'export@sultandefense.com',
    'email_2', 'info@sultandefense.com',
    'working_hours', 'Pazartesi - Cuma: 09:00 - 18:00',
    'maps_embed_url', '',
    'maps_lat', '38.4560',
    'maps_lng', '27.1790'
  ),
  NOW(3), NOW(3)
)
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`), `updated_at` = VALUES(`updated_at`);

INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES (
  UUID(),
  'sultandefense__contact_info',
  'en',
  JSON_OBJECT(
    'company_name', 'Sultan Defense Ltd., Co.',
    'address', 'Folkart Time 1 - Office Blocks, Kazimdirik, Floor 6, Flat 612',
    'city', 'Bornova, Izmir',
    'country', 'Turkey',
    'phone', '+90 545 552 75 35',
    'phone_2', '+90 545 552 75 35',
    'email', 'export@sultandefense.com',
    'email_2', 'info@sultandefense.com',
    'working_hours', 'Monday - Friday: 09:00 - 18:00',
    'maps_embed_url', '',
    'maps_lat', '38.4560',
    'maps_lng', '27.1790'
  ),
  NOW(3), NOW(3)
)
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`), `updated_at` = VALUES(`updated_at`);

INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES (
  UUID(),
  'sultandefense__branding',
  '*',
  JSON_OBJECT(
    'brand_name', 'Sultan Defense',
    'brand_tagline_tr', 'Savunma Tedariki ve Ihracat Partneri',
    'brand_tagline_en', 'Defense Procurement & Export Partner',
    'primary_color', '#0D1B2A',
    'accent_color', '#2BD4D9',
    'dark_color', '#07111C',
    'font_family', 'Inter',
    'font_display', 'Oswald'
  ),
  NOW(3), NOW(3)
)
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`), `updated_at` = VALUES(`updated_at`);

COMMIT;
SET FOREIGN_KEY_CHECKS = 1;
