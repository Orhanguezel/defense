-- =============================================================
-- FILE: 307_sultandefense_gallery.seed.sql
-- Sultan Defense — Catalog gallery data (TR/EN)
-- module_key = 'sultandefense'
-- =============================================================

SET NAMES utf8mb4;
SET time_zone = '+00:00';
SET FOREIGN_KEY_CHECKS = 0;

START TRANSACTION;

INSERT INTO `galleries`
(`id`, `module_key`, `source_id`, `source_type`, `is_active`, `is_featured`, `display_order`, `cover_image`, `cover_asset_id`)
VALUES
  ('kg010001-8001-4001-9001-eeeeeeee0001', 'sultandefense', 'cccc0001-4001-4001-8001-cccccccc0001', 'category', 1, 1, 10, '/media/sultandefense/gallery-ballistic-protection.jpg', NULL),
  ('kg010002-8002-4002-9002-eeeeeeee0002', 'sultandefense', 'cccc0002-4002-4002-8002-cccccccc0002', 'category', 1, 1, 20, '/media/sultandefense/gallery-command-electronics.jpg', NULL),
  ('kg010003-8003-4003-9003-eeeeeeee0003', 'sultandefense', 'cccc0004-4004-4004-8004-cccccccc0004', 'category', 1, 0, 30, '/media/sultandefense/gallery-field-logistics.jpg', NULL)
ON DUPLICATE KEY UPDATE
  `module_key` = VALUES(`module_key`),
  `source_id` = VALUES(`source_id`),
  `source_type` = VALUES(`source_type`),
  `is_active` = VALUES(`is_active`),
  `is_featured` = VALUES(`is_featured`),
  `display_order` = VALUES(`display_order`),
  `cover_image` = VALUES(`cover_image`),
  `cover_asset_id` = VALUES(`cover_asset_id`);

INSERT INTO `gallery_i18n`
(`gallery_id`, `locale`, `title`, `slug`, `description`, `meta_title`, `meta_description`)
VALUES
  ('kg010001-8001-4001-9001-eeeeeeee0001', 'tr', 'Balistik Koruma Katalog Galerisi', 'balistik-koruma-katalog-galerisi', 'Yelek, plaka, kask ve koruyucu ekipman urun aileleri icin katalog gorselleri.', 'Balistik Koruma Galerisi | Sultan Defense', 'Balistik yelek, zirh plakasi, kask ve koruyucu ekipman katalog gorselleri.'),
  ('kg010001-8001-4001-9001-eeeeeeee0001', 'en', 'Ballistic Protection Catalog Gallery', 'ballistic-protection-catalog-gallery', 'Catalog visuals for vest, plate, helmet, and protective equipment product families.', 'Ballistic Protection Gallery | Sultan Defense', 'Catalog visuals for ballistic vests, armor plates, helmets, and protective equipment.'),
  ('kg010002-8002-4002-9002-eeeeeeee0002', 'tr', 'Muhabere ve Komuta Elektronigi Galerisi', 'muhabere-komuta-elektronigi-galerisi', 'Taktik telsiz, komuta merkezi, sensor ve elektronik destek ekipmanlari icin katalog gorselleri.', 'Muhabere ve Komuta Elektronigi Galerisi | Sultan Defense', 'Taktik haberlesme, komuta elektronigi, sensor ve entegrasyon katalog gorselleri.'),
  ('kg010002-8002-4002-9002-eeeeeeee0002', 'en', 'Communications and Command Electronics Gallery', 'communications-command-electronics-gallery', 'Catalog visuals for tactical radios, command centers, sensors, and electronic support equipment.', 'Communications and Command Electronics Gallery | Sultan Defense', 'Tactical communications, command electronics, sensors, and integration catalog visuals.'),
  ('kg010003-8003-4003-9003-eeeeeeee0003', 'tr', 'Saha Destek ve Lojistik Galerisi', 'saha-destek-lojistik-galerisi', 'Sahra destek, konteyner cozumu, guc sistemi ve guvenli sevkiyat surecleri icin katalog gorselleri.', 'Saha Destek ve Lojistik Galerisi | Sultan Defense', 'Saha destek, konteyner, guc sistemi ve savunma lojistigi katalog gorselleri.'),
  ('kg010003-8003-4003-9003-eeeeeeee0003', 'en', 'Field Support and Logistics Gallery', 'field-support-logistics-gallery', 'Catalog visuals for field support, containerized units, power systems, and secure shipment workflows.', 'Field Support and Logistics Gallery | Sultan Defense', 'Field support, containerized units, power systems, and defense logistics catalog visuals.')
ON DUPLICATE KEY UPDATE
  `title` = VALUES(`title`),
  `slug` = VALUES(`slug`),
  `description` = VALUES(`description`),
  `meta_title` = VALUES(`meta_title`),
  `meta_description` = VALUES(`meta_description`);

INSERT INTO `gallery_images`
(`id`, `gallery_id`, `storage_asset_id`, `image_url`, `display_order`, `is_cover`)
VALUES
  ('gi-g1-0001', 'kg010001-8001-4001-9001-eeeeeeee0001', NULL, '/media/sultandefense/ballistic-vest.jpg', 1, 1),
  ('gi-g1-0002', 'kg010001-8001-4001-9001-eeeeeeee0001', NULL, '/media/sultandefense/armor-plates.jpg', 2, 0),
  ('gi-g1-0003', 'kg010001-8001-4001-9001-eeeeeeee0001', NULL, '/media/sultandefense/ballistic-helmet.jpg', 3, 0),
  ('gi-g2-0001', 'kg010002-8002-4002-9002-eeeeeeee0002', NULL, '/media/sultandefense/tactical-radio.jpg', 1, 1),
  ('gi-g2-0002', 'kg010002-8002-4002-9002-eeeeeeee0002', NULL, '/media/sultandefense/command-control.jpg', 2, 0),
  ('gi-g2-0003', 'kg010002-8002-4002-9002-eeeeeeee0002', NULL, '/media/sultandefense/surveillance-sensor.jpg', 3, 0),
  ('gi-g3-0001', 'kg010003-8003-4003-9003-eeeeeeee0003', NULL, '/media/sultandefense/field-support-logistics.jpg', 1, 1),
  ('gi-g3-0002', 'kg010003-8003-4003-9003-eeeeeeee0003', NULL, '/media/sultandefense/containerized-field-kitchen.jpg', 2, 0),
  ('gi-g3-0003', 'kg010003-8003-4003-9003-eeeeeeee0003', NULL, '/media/sultandefense/power-battery-generator.jpg', 3, 0)
ON DUPLICATE KEY UPDATE
  `storage_asset_id` = VALUES(`storage_asset_id`),
  `image_url` = VALUES(`image_url`),
  `display_order` = VALUES(`display_order`),
  `is_cover` = VALUES(`is_cover`);

COMMIT;
SET FOREIGN_KEY_CHECKS = 1;
