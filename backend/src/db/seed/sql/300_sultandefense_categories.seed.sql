-- =============================================================
-- FILE: 300_sultandefense_categories.seed.sql
-- Sultan Defense product categories + i18n (TR/EN)
-- module_key = 'sultandefense'
-- =============================================================

SET NAMES utf8mb4;
SET time_zone = '+00:00';
SET FOREIGN_KEY_CHECKS = 0;

START TRANSACTION;

INSERT INTO `categories`
(
  `id`,
  `module_key`,
  `image_url`,
  `storage_asset_id`,
  `alt`,
  `icon`,
  `is_active`,
  `is_featured`,
  `display_order`
)
VALUES
  ('cccc0001-4001-4001-8001-cccccccc0001', 'sultandefense', '/media/sultandefense/ballistic-protection.jpg', NULL, 'Ballistic protection equipment', 'shield', 1, 1, 10),
  ('cccc0002-4002-4002-8002-cccccccc0002', 'sultandefense', '/media/sultandefense/communication-command-electronics.jpg', NULL, 'Military communication systems', 'radio', 1, 1, 20),
  ('cccc0003-4003-4003-8003-cccccccc0003', 'sultandefense', '/media/sultandefense/containerized-field-kitchen.jpg', NULL, 'Containerized field kitchen units', 'container', 1, 1, 30),
  ('cccc0004-4004-4004-8004-cccccccc0004', 'sultandefense', '/media/sultandefense/field-support-logistics.jpg', NULL, 'Field logistics support equipment', 'truck', 1, 1, 40),
  ('cccc0005-4005-4005-8005-cccccccc0005', 'sultandefense', '/media/sultandefense/naval-marine-systems.jpg', NULL, 'Naval and marine systems', 'anchor', 1, 1, 50),
  ('cccc0006-4006-4006-8006-cccccccc0006', 'sultandefense', '/media/sultandefense/power-battery-generator.jpg', NULL, 'Military power and battery systems', 'battery', 1, 0, 60),
  ('cccc0007-4007-4007-8007-cccccccc0007', 'sultandefense', '/media/sultandefense/shield-riot-control.jpg', NULL, 'Riot control shields and gear', 'shield-check', 1, 0, 70),
  ('cccc0008-4008-4008-8008-cccccccc0008', 'sultandefense', '/media/sultandefense/surveillance-sensors-security.jpg', NULL, 'Surveillance sensors and security systems', 'scan', 1, 0, 80),
  ('cccc0009-4009-4009-8009-cccccccc0009', 'sultandefense', '/media/sultandefense/tactical-gear-textile.jpg', NULL, 'Tactical gear and military textiles', 'vest', 1, 0, 90),
  ('cccc0010-4010-4010-8010-cccccccc0010', 'sultandefense', '/media/sultandefense/training-simulation-software.jpg', NULL, 'Training simulation software', 'monitor', 1, 0, 100)
ON DUPLICATE KEY UPDATE
  `module_key` = VALUES(`module_key`),
  `image_url` = VALUES(`image_url`),
  `alt` = VALUES(`alt`),
  `icon` = VALUES(`icon`),
  `is_active` = VALUES(`is_active`),
  `is_featured` = VALUES(`is_featured`),
  `display_order` = VALUES(`display_order`);

INSERT INTO `category_i18n` (`category_id`, `locale`, `name`, `slug`, `description`)
VALUES
  ('cccc0001-4001-4001-8001-cccccccc0001', 'tr', 'Balistik Koruma', 'ballistic-protection', 'NIJ uyumlu taktik yelekler, zırh plakaları, kasklar ve araç zırh çözümleri.'),
  ('cccc0002-4002-4002-8002-cccccccc0002', 'tr', 'Muhabere ve Komuta Elektroniği', 'communication-command-electronics', 'Şifreli telsizler, komuta merkezi entegrasyonları ve elektronik harp destek çözümleri.'),
  ('cccc0003-4003-4003-8003-cccccccc0003', 'tr', 'Konteyner Sahra Mutfağı ve Destek Üniteleri', 'containerized-field-kitchen', 'Mobil mutfak, fırın, hijyen ve soğuk depolama üniteleri için hızlı tedarik.'),
  ('cccc0004-4004-4004-8004-cccccccc0004', 'tr', 'Saha Destek Lojistiği', 'field-support-logistics', 'Taktik çadırlar, yakıt-su dağıtım sistemleri, bakım atölyeleri ve lojistik ekipman.'),
  ('cccc0005-4005-4005-8005-cccccccc0005', 'tr', 'Deniz ve Marine Sistemleri', 'naval-marine-systems', 'Kıyı gözetleme, deniz elektroniği, sualtı güvenliği ve gemi koruma ekipmanları.'),
  ('cccc0006-4006-4006-8006-cccccccc0006', 'tr', 'Güç, Batarya ve Jeneratör', 'power-battery-generator', 'Zorlu iklimler için askeri tip jeneratör, batarya ve taktik güç yönetimi çözümleri.'),
  ('cccc0007-4007-4007-8007-cccccccc0007', 'tr', 'Kalkan ve Toplumsal Olay Kontrol Çözümleri', 'shield-riot-control', 'Taktik kalkanlar, çevik kuvvet koruma takımları ve kalabalık kontrol ekipmanları.'),
  ('cccc0008-4008-4008-8008-cccccccc0008', 'tr', 'Gözetleme, Sensör ve Güvenlik', 'surveillance-sensors-security', 'EO/IR kameralar, çevre güvenlik sensörleri, taktik İHA ve kara gözetleme radarları.'),
  ('cccc0009-4009-4009-8009-cccccccc0009', 'tr', 'Taktik Teçhizat ve Tekstil', 'tactical-gear-textile', 'Muharebe üniformaları, MOLLE taşıma sistemleri, taktik botlar ve zorlu hava ekipmanı.'),
  ('cccc0010-4010-4010-8010-cccccccc0010', 'tr', 'Eğitim ve Simülasyon Yazılımı', 'training-simulation-software', 'Atış, konvoy, komuta kontrol, uçuş ve deniz eğitim simülatörleri.')
ON DUPLICATE KEY UPDATE
  `name` = VALUES(`name`),
  `slug` = VALUES(`slug`),
  `description` = VALUES(`description`);

INSERT INTO `category_i18n` (`category_id`, `locale`, `name`, `slug`, `description`)
VALUES
  ('cccc0001-4001-4001-8001-cccccccc0001', 'en', 'Ballistic Protection', 'ballistic-protection', 'NIJ-aligned tactical vests, hard armor plates, helmets, and vehicle armor solutions.'),
  ('cccc0002-4002-4002-8002-cccccccc0002', 'en', 'Communication & Command Electronics', 'communication-command-electronics', 'Encrypted radios, command center integration, secure intercoms, and EW support systems.'),
  ('cccc0003-4003-4003-8003-cccccccc0003', 'en', 'Containerized Field Kitchen & Support Units', 'containerized-field-kitchen', 'Rapid-deployment mobile kitchens, bakeries, hygiene modules, and cold storage containers.'),
  ('cccc0004-4004-4004-8004-cccccccc0004', 'en', 'Field Support Logistics', 'field-support-logistics', 'Tactical tents, fuel and water distribution, field workshops, and rugged logistics equipment.'),
  ('cccc0005-4005-4005-8005-cccccccc0005', 'en', 'Naval & Marine Systems', 'naval-marine-systems', 'Coastal surveillance, marine electronics, underwater security, and vessel protection equipment.'),
  ('cccc0006-4006-4006-8006-cccccccc0006', 'en', 'Power, Battery & Generator', 'power-battery-generator', 'Military generators, high-density batteries, hybrid power units, and tactical power management.'),
  ('cccc0007-4007-4007-8007-cccccccc0007', 'en', 'Shield & Riot Control Solutions', 'shield-riot-control', 'Riot shields, anti-riot suits, helmets, batons, and professional crowd management gear.'),
  ('cccc0008-4008-4008-8008-cccccccc0008', 'en', 'Surveillance, Sensors & Security', 'surveillance-sensors-security', 'EO/IR cameras, intrusion sensors, tactical UAVs, and ground surveillance radars.'),
  ('cccc0009-4009-4009-8009-cccccccc0009', 'en', 'Tactical Gear & Textile', 'tactical-gear-textile', 'Combat uniforms, MOLLE load-bearing equipment, military footwear, and extreme-weather gear.'),
  ('cccc0010-4010-4010-8010-cccccccc0010', 'en', 'Training & Simulation Software', 'training-simulation-software', 'Marksmanship, convoy, C2, flight, and naval simulation systems for safer training.')
ON DUPLICATE KEY UPDATE
  `name` = VALUES(`name`),
  `slug` = VALUES(`slug`),
  `description` = VALUES(`description`);

COMMIT;
SET FOREIGN_KEY_CHECKS = 1;
