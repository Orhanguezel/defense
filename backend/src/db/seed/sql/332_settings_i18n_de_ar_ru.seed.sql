-- =============================================================
-- FILE: 332_settings_i18n_de_ar_ru.seed.sql
-- Sultan Defense site_settings — i18n (de, ar, ru)
-- Localized keys translated: sultandefense__seo, sultandefense__contact_info
-- Source EN/TR rows: 301_sultandefense_site_settings.seed.sql
-- Rules: only human-readable text translated. Emails, phones, URLs,
--        og_image, coordinates, company_name, JSON keys, acronyms kept intact.
-- =============================================================

SET NAMES utf8mb4;
SET time_zone = '+00:00';
SET FOREIGN_KEY_CHECKS = 0;

START TRANSACTION;

-- -------------------------------------------------------------
-- sultandefense__seo  (de, ar, ru)
-- -------------------------------------------------------------
INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES (
  UUID(),
  'sultandefense__seo',
  'de',
  JSON_OBJECT(
    'site_title', 'Rüstungsbeschaffung & taktische Ausrüstung | Sultan Defense',
    'site_description', 'Sultan Defense bietet umfassende militärische Beschaffungslösungen und liefert taktische Ausrüstung und Verteidigungstechnologien in den Nahen Osten, nach Afrika und in die Turkrepubliken.',
    'keywords', 'Rüstungsbeschaffung, taktische Ausrüstung, militärische Ausrüstung, ballistischer Schutz, Exportkonformität, Sultan Defense',
    'og_image', '/logo/png/sultandefense_logo_512.png',
    'og_type', 'website'
  ),
  NOW(3), NOW(3)
)
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`), `updated_at` = NOW(3);

INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES (
  UUID(),
  'sultandefense__seo',
  'ar',
  JSON_OBJECT(
    'site_title', 'توريد المعدات الدفاعية والتجهيزات التكتيكية | Sultan Defense',
    'site_description', 'تقدّم Sultan Defense حلول توريد عسكرية شاملة، وتوفّر التجهيزات التكتيكية وتقنيات الدفاع للشرق الأوسط وأفريقيا والجمهوريات التركية.',
    'keywords', 'توريد المعدات الدفاعية, التجهيزات التكتيكية, المعدات العسكرية, الحماية الباليستية, الامتثال للتصدير, Sultan Defense',
    'og_image', '/logo/png/sultandefense_logo_512.png',
    'og_type', 'website'
  ),
  NOW(3), NOW(3)
)
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`), `updated_at` = NOW(3);

INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES (
  UUID(),
  'sultandefense__seo',
  'ru',
  JSON_OBJECT(
    'site_title', 'Поставки вооружения и тактического снаряжения | Sultan Defense',
    'site_description', 'Sultan Defense предоставляет комплексные решения по военным закупкам, поставляя тактическое снаряжение и оборонные технологии на Ближний Восток, в Африку и Тюркские Республики.',
    'keywords', 'оборонные закупки, тактическое снаряжение, военное оборудование, баллистическая защита, экспортный контроль, Sultan Defense',
    'og_image', '/logo/png/sultandefense_logo_512.png',
    'og_type', 'website'
  ),
  NOW(3), NOW(3)
)
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`), `updated_at` = NOW(3);

-- -------------------------------------------------------------
-- sultandefense__contact_info  (de, ar, ru)
-- -------------------------------------------------------------
INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES (
  UUID(),
  'sultandefense__contact_info',
  'de',
  JSON_OBJECT(
    'company_name', 'Sultan Defense Ltd., Co.',
    'address', 'Folkart Time 1 - Office Blocks, Kazimdirik, 6. Etage, Büro 612',
    'city', 'Bornova, Izmir',
    'country', 'Türkei',
    'phone', '+90 545 552 75 35',
    'phone_2', '+90 545 552 75 35',
    'email', 'export@sultandefense.com',
    'email_2', 'info@sultandefense.com',
    'working_hours', 'Montag - Freitag: 09:00 - 18:00',
    'maps_embed_url', '',
    'maps_lat', '38.4560',
    'maps_lng', '27.1790'
  ),
  NOW(3), NOW(3)
)
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`), `updated_at` = NOW(3);

INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES (
  UUID(),
  'sultandefense__contact_info',
  'ar',
  JSON_OBJECT(
    'company_name', 'Sultan Defense Ltd., Co.',
    'address', 'Folkart Time 1 - Office Blocks, Kazimdirik, الطابق 6, مكتب 612',
    'city', 'بورنوفا، إزمير',
    'country', 'تركيا',
    'phone', '+90 545 552 75 35',
    'phone_2', '+90 545 552 75 35',
    'email', 'export@sultandefense.com',
    'email_2', 'info@sultandefense.com',
    'working_hours', 'الاثنين - الجمعة: 09:00 - 18:00',
    'maps_embed_url', '',
    'maps_lat', '38.4560',
    'maps_lng', '27.1790'
  ),
  NOW(3), NOW(3)
)
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`), `updated_at` = NOW(3);

INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES (
  UUID(),
  'sultandefense__contact_info',
  'ru',
  JSON_OBJECT(
    'company_name', 'Sultan Defense Ltd., Co.',
    'address', 'Folkart Time 1 - Office Blocks, Kazimdirik, 6 этаж, офис 612',
    'city', 'Борнова, Измир',
    'country', 'Турция',
    'phone', '+90 545 552 75 35',
    'phone_2', '+90 545 552 75 35',
    'email', 'export@sultandefense.com',
    'email_2', 'info@sultandefense.com',
    'working_hours', 'Понедельник - Пятница: 09:00 - 18:00',
    'maps_embed_url', '',
    'maps_lat', '38.4560',
    'maps_lng', '27.1790'
  ),
  NOW(3), NOW(3)
)
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`), `updated_at` = NOW(3);

COMMIT;
SET FOREIGN_KEY_CHECKS = 1;
