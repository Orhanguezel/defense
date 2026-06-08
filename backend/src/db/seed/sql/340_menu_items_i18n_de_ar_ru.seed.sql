-- =============================================================
-- FILE: 340_menu_items_i18n_de_ar_ru.seed.sql
-- Sultan Defense — menu_items i18n for DE / AR / RU
-- Adds de, ar, ru rows for every menu item that has an EN row.
-- URLs/icons kept identical to the EN/TR source rows.
-- Source: 302_sultandefense_menu_items.seed.sql
-- =============================================================

SET NAMES utf8mb4;
SET time_zone = '+00:00';
SET FOREIGN_KEY_CHECKS = 0;

START TRANSACTION;

-- =============================================================
-- 1) I18N — DE (German, formal)
-- =============================================================
INSERT INTO `menu_items_i18n`
(`id`, `menu_item_id`, `locale`, `title`, `url`, `created_at`, `updated_at`)
VALUES
-- HEADER
(UUID(), 'dd010001-4001-4001-8001-dd0000000001', 'de', 'Startseite', '/', NOW(3), NOW(3)),
(UUID(), 'dd010002-4002-4002-8002-dd0000000002', 'de', 'Projekte', '/projeler', NOW(3), NOW(3)),
(UUID(), 'dd010003-4003-4003-8003-dd0000000003', 'de', 'Leistungen', '/hizmetler', NOW(3), NOW(3)),
(UUID(), 'dd010004-4004-4004-8004-dd0000000004', 'de', 'Galerie', '/galeri', NOW(3), NOW(3)),
(UUID(), 'dd010005-4005-4005-8005-dd0000000005', 'de', 'Über uns', '/hakkimizda', NOW(3), NOW(3)),
(UUID(), 'dd010006-4006-4006-8006-dd0000000006', 'de', 'Kontakt', '/iletisim', NOW(3), NOW(3)),
(UUID(), 'dd010007-4007-4007-8007-dd0000000007', 'de', 'Angebot anfordern', '/teklif', NOW(3), NOW(3)),

-- FOOTER: QUICK ACCESS
(UUID(), 'dd030001-4001-4001-8001-dd0000000001', 'de', 'Startseite', '/', NOW(3), NOW(3)),
(UUID(), 'dd030002-4002-4002-8002-dd0000000002', 'de', 'Projekte', '/projeler', NOW(3), NOW(3)),
(UUID(), 'dd030003-4003-4003-8003-dd0000000003', 'de', 'Leistungen', '/hizmetler', NOW(3), NOW(3)),
(UUID(), 'dd030004-4004-4004-8004-dd0000000004', 'de', 'Galerie', '/galeri', NOW(3), NOW(3)),
(UUID(), 'dd030005-4005-4005-8005-dd0000000005', 'de', 'Über uns', '/hakkimizda', NOW(3), NOW(3)),
(UUID(), 'dd030006-4006-4006-8006-dd0000000006', 'de', 'Kontakt', '/iletisim', NOW(3), NOW(3)),

-- FOOTER: LEGAL
(UUID(), 'dd040001-4001-4001-8001-dd0000000001', 'de', 'Datenschutzerklärung', '/legal/privacy-policy', NOW(3), NOW(3)),
(UUID(), 'dd040002-4002-4002-8002-dd0000000002', 'de', 'Datenschutz (KVKK)', '/legal/pdpl-kvkk', NOW(3), NOW(3)),
(UUID(), 'dd040003-4003-4003-8003-dd0000000003', 'de', 'Nutzungsbedingungen', '/legal/terms-of-use', NOW(3), NOW(3)),
(UUID(), 'dd040004-4004-4004-8004-dd0000000004', 'de', 'Cookie-Richtlinie', '/legal/cookie-policy', NOW(3), NOW(3)),

-- FOOTER: SOCIAL
(UUID(), 'dd050001-4001-4001-8001-dd0000000001', 'de', 'Instagram', 'https://www.instagram.com/sultandefense', NOW(3), NOW(3)),
(UUID(), 'dd050002-4002-4002-8002-dd0000000002', 'de', 'LinkedIn', 'https://www.linkedin.com/company/sultandefense', NOW(3), NOW(3))
ON DUPLICATE KEY UPDATE
  `title`      = VALUES(`title`),
  `url`        = VALUES(`url`),
  `updated_at` = CURRENT_TIMESTAMP(3);

-- =============================================================
-- 2) I18N — AR (Arabic, MSA)
-- =============================================================
INSERT INTO `menu_items_i18n`
(`id`, `menu_item_id`, `locale`, `title`, `url`, `created_at`, `updated_at`)
VALUES
-- HEADER
(UUID(), 'dd010001-4001-4001-8001-dd0000000001', 'ar', 'الرئيسية', '/', NOW(3), NOW(3)),
(UUID(), 'dd010002-4002-4002-8002-dd0000000002', 'ar', 'المشاريع', '/projeler', NOW(3), NOW(3)),
(UUID(), 'dd010003-4003-4003-8003-dd0000000003', 'ar', 'الخدمات', '/hizmetler', NOW(3), NOW(3)),
(UUID(), 'dd010004-4004-4004-8004-dd0000000004', 'ar', 'معرض الصور', '/galeri', NOW(3), NOW(3)),
(UUID(), 'dd010005-4005-4005-8005-dd0000000005', 'ar', 'من نحن', '/hakkimizda', NOW(3), NOW(3)),
(UUID(), 'dd010006-4006-4006-8006-dd0000000006', 'ar', 'اتصل بنا', '/iletisim', NOW(3), NOW(3)),
(UUID(), 'dd010007-4007-4007-8007-dd0000000007', 'ar', 'طلب عرض سعر', '/teklif', NOW(3), NOW(3)),

-- FOOTER: QUICK ACCESS
(UUID(), 'dd030001-4001-4001-8001-dd0000000001', 'ar', 'الرئيسية', '/', NOW(3), NOW(3)),
(UUID(), 'dd030002-4002-4002-8002-dd0000000002', 'ar', 'المشاريع', '/projeler', NOW(3), NOW(3)),
(UUID(), 'dd030003-4003-4003-8003-dd0000000003', 'ar', 'الخدمات', '/hizmetler', NOW(3), NOW(3)),
(UUID(), 'dd030004-4004-4004-8004-dd0000000004', 'ar', 'معرض الصور', '/galeri', NOW(3), NOW(3)),
(UUID(), 'dd030005-4005-4005-8005-dd0000000005', 'ar', 'من نحن', '/hakkimizda', NOW(3), NOW(3)),
(UUID(), 'dd030006-4006-4006-8006-dd0000000006', 'ar', 'اتصل بنا', '/iletisim', NOW(3), NOW(3)),

-- FOOTER: LEGAL
(UUID(), 'dd040001-4001-4001-8001-dd0000000001', 'ar', 'سياسة الخصوصية', '/legal/privacy-policy', NOW(3), NOW(3)),
(UUID(), 'dd040002-4002-4002-8002-dd0000000002', 'ar', 'حماية البيانات (KVKK)', '/legal/pdpl-kvkk', NOW(3), NOW(3)),
(UUID(), 'dd040003-4003-4003-8003-dd0000000003', 'ar', 'شروط الاستخدام', '/legal/terms-of-use', NOW(3), NOW(3)),
(UUID(), 'dd040004-4004-4004-8004-dd0000000004', 'ar', 'سياسة ملفات تعريف الارتباط', '/legal/cookie-policy', NOW(3), NOW(3)),

-- FOOTER: SOCIAL
(UUID(), 'dd050001-4001-4001-8001-dd0000000001', 'ar', 'Instagram', 'https://www.instagram.com/sultandefense', NOW(3), NOW(3)),
(UUID(), 'dd050002-4002-4002-8002-dd0000000002', 'ar', 'LinkedIn', 'https://www.linkedin.com/company/sultandefense', NOW(3), NOW(3))
ON DUPLICATE KEY UPDATE
  `title`      = VALUES(`title`),
  `url`        = VALUES(`url`),
  `updated_at` = CURRENT_TIMESTAMP(3);

-- =============================================================
-- 3) I18N — RU (Russian, professional)
-- =============================================================
INSERT INTO `menu_items_i18n`
(`id`, `menu_item_id`, `locale`, `title`, `url`, `created_at`, `updated_at`)
VALUES
-- HEADER
(UUID(), 'dd010001-4001-4001-8001-dd0000000001', 'ru', 'Главная', '/', NOW(3), NOW(3)),
(UUID(), 'dd010002-4002-4002-8002-dd0000000002', 'ru', 'Проекты', '/projeler', NOW(3), NOW(3)),
(UUID(), 'dd010003-4003-4003-8003-dd0000000003', 'ru', 'Услуги', '/hizmetler', NOW(3), NOW(3)),
(UUID(), 'dd010004-4004-4004-8004-dd0000000004', 'ru', 'Галерея', '/galeri', NOW(3), NOW(3)),
(UUID(), 'dd010005-4005-4005-8005-dd0000000005', 'ru', 'О компании', '/hakkimizda', NOW(3), NOW(3)),
(UUID(), 'dd010006-4006-4006-8006-dd0000000006', 'ru', 'Контакты', '/iletisim', NOW(3), NOW(3)),
(UUID(), 'dd010007-4007-4007-8007-dd0000000007', 'ru', 'Запросить предложение', '/teklif', NOW(3), NOW(3)),

-- FOOTER: QUICK ACCESS
(UUID(), 'dd030001-4001-4001-8001-dd0000000001', 'ru', 'Главная', '/', NOW(3), NOW(3)),
(UUID(), 'dd030002-4002-4002-8002-dd0000000002', 'ru', 'Проекты', '/projeler', NOW(3), NOW(3)),
(UUID(), 'dd030003-4003-4003-8003-dd0000000003', 'ru', 'Услуги', '/hizmetler', NOW(3), NOW(3)),
(UUID(), 'dd030004-4004-4004-8004-dd0000000004', 'ru', 'Галерея', '/galeri', NOW(3), NOW(3)),
(UUID(), 'dd030005-4005-4005-8005-dd0000000005', 'ru', 'О компании', '/hakkimizda', NOW(3), NOW(3)),
(UUID(), 'dd030006-4006-4006-8006-dd0000000006', 'ru', 'Контакты', '/iletisim', NOW(3), NOW(3)),

-- FOOTER: LEGAL
(UUID(), 'dd040001-4001-4001-8001-dd0000000001', 'ru', 'Политика конфиденциальности', '/legal/privacy-policy', NOW(3), NOW(3)),
(UUID(), 'dd040002-4002-4002-8002-dd0000000002', 'ru', 'Защита данных (KVKK)', '/legal/pdpl-kvkk', NOW(3), NOW(3)),
(UUID(), 'dd040003-4003-4003-8003-dd0000000003', 'ru', 'Условия использования', '/legal/terms-of-use', NOW(3), NOW(3)),
(UUID(), 'dd040004-4004-4004-8004-dd0000000004', 'ru', 'Политика использования файлов cookie', '/legal/cookie-policy', NOW(3), NOW(3)),

-- FOOTER: SOCIAL
(UUID(), 'dd050001-4001-4001-8001-dd0000000001', 'ru', 'Instagram', 'https://www.instagram.com/sultandefense', NOW(3), NOW(3)),
(UUID(), 'dd050002-4002-4002-8002-dd0000000002', 'ru', 'LinkedIn', 'https://www.linkedin.com/company/sultandefense', NOW(3), NOW(3))
ON DUPLICATE KEY UPDATE
  `title`      = VALUES(`title`),
  `url`        = VALUES(`url`),
  `updated_at` = CURRENT_TIMESTAMP(3);

COMMIT;
SET FOREIGN_KEY_CHECKS = 1;
