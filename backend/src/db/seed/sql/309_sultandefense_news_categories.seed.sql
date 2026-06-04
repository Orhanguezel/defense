-- =============================================================
-- FILE: 309_sultandefense_news_categories.seed.sql
-- Sultan Defense news categories
-- module_key = 'news'
-- =============================================================

SET NAMES utf8mb4;
SET time_zone = '+00:00';
SET FOREIGN_KEY_CHECKS = 0;

START TRANSACTION;

INSERT INTO `categories`
(`id`, `module_key`, `image_url`, `storage_asset_id`, `alt`, `icon`, `is_active`, `is_featured`, `display_order`)
VALUES
  ('nc010001-4001-4001-8001-000000000001', 'news', NULL, NULL, NULL, 'shield', 1, 1, 10),
  ('nc010002-4002-4002-8002-000000000002', 'news', NULL, NULL, NULL, 'file-check', 1, 1, 20),
  ('nc010003-4003-4003-8003-000000000003', 'news', NULL, NULL, NULL, 'truck', 1, 0, 30),
  ('nc010004-4004-4004-8004-000000000004', 'news', NULL, NULL, NULL, 'radar', 1, 0, 40),
  ('nc010005-4005-4005-8005-000000000005', 'news', NULL, NULL, NULL, 'badge-check', 1, 0, 50)
ON DUPLICATE KEY UPDATE
  `module_key` = VALUES(`module_key`),
  `icon` = VALUES(`icon`),
  `is_active` = VALUES(`is_active`),
  `display_order` = VALUES(`display_order`);

INSERT INTO `category_i18n` (`category_id`, `locale`, `name`, `slug`, `description`)
VALUES
  ('nc010001-4001-4001-8001-000000000001', 'tr', 'Savunma Tedariki', 'savunma-tedariki', 'Savunma ve askeri ekipman tedarik sureclerine dair notlar'),
  ('nc010002-4002-4002-8002-000000000002', 'tr', 'Ihracat Uyumu', 'ihracat-uyumu', 'EUC, ihracat izni ve mevzuat uyumu hakkinda guncellemeler'),
  ('nc010003-4003-4003-8003-000000000003', 'tr', 'Lojistik', 'lojistik', 'Askeri kargo, sevkiyat ve bolgesel teslimat operasyonlari'),
  ('nc010004-4004-4004-8004-000000000004', 'tr', 'Teknoloji', 'teknoloji', 'Taktik elektronik, sensor, haberlesme ve simulasyon teknolojileri'),
  ('nc010005-4005-4005-8005-000000000005', 'tr', 'Standartlar', 'standartlar', 'NATO, AQAP, MIL-STD, NIJ, NSN ve kalite standartlari'),
  ('nc010001-4001-4001-8001-000000000001', 'en', 'Defense Procurement', 'defense-procurement', 'Notes on defense and military equipment procurement workflows'),
  ('nc010002-4002-4002-8002-000000000002', 'en', 'Export Compliance', 'export-compliance', 'Updates on EUC, export permits, and regulatory compliance'),
  ('nc010003-4003-4003-8003-000000000003', 'en', 'Logistics', 'logistics', 'Military cargo, shipment, and regional delivery operations'),
  ('nc010004-4004-4004-8004-000000000004', 'en', 'Technology', 'technology', 'Tactical electronics, sensors, communications, and simulation technologies'),
  ('nc010005-4005-4005-8005-000000000005', 'en', 'Standards', 'standards', 'NATO, AQAP, MIL-STD, NIJ, NSN, and quality standards')
ON DUPLICATE KEY UPDATE
  `name` = VALUES(`name`),
  `slug` = VALUES(`slug`),
  `description` = VALUES(`description`);

COMMIT;
SET FOREIGN_KEY_CHECKS = 1;
