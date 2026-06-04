-- =============================================================
-- FILE: 310_sultandefense_brand_references.seed.sql
-- Sultan Defense — Supplier capability references (TR/EN)
-- =============================================================

SET NAMES utf8mb4;
SET time_zone = '+00:00';
SET FOREIGN_KEY_CHECKS = 0;

START TRANSACTION;

INSERT INTO `references`
(
  id, is_published, is_featured, display_order,
  featured_image, featured_image_asset_id,
  website_url,
  category_id,
  created_at, updated_at
)
VALUES
  ('ref10001-4001-4001-8001-000000000001', 1, 1, 10, '/media/sultandefense/ref-ballistic-protection.jpg', NULL, NULL, 'cccc0001-4001-4001-8001-cccccccc0001', NOW(3), NOW(3)),
  ('ref10002-4002-4002-8002-000000000002', 1, 1, 20, '/media/sultandefense/ref-communications.jpg', NULL, NULL, 'cccc0002-4002-4002-8002-cccccccc0002', NOW(3), NOW(3)),
  ('ref10003-4003-4003-8003-000000000003', 1, 0, 30, '/media/sultandefense/ref-field-logistics.jpg', NULL, NULL, 'cccc0004-4004-4004-8004-cccccccc0004', NOW(3), NOW(3)),
  ('ref10004-4004-4004-8004-000000000004', 1, 0, 40, '/media/sultandefense/ref-naval-marine.jpg', NULL, NULL, 'cccc0005-4005-4005-8005-cccccccc0005', NOW(3), NOW(3)),
  ('ref10005-4005-4005-8005-000000000005', 1, 1, 50, '/media/sultandefense/ref-tactical-textile.jpg', NULL, NULL, 'cccc0009-4009-4009-8009-cccccccc0009', NOW(3), NOW(3)),
  ('ref10006-4006-4006-8006-000000000006', 1, 0, 60, '/media/sultandefense/ref-training-simulation.jpg', NULL, NULL, 'cccc0010-4010-4010-8010-cccccccc0010', NOW(3), NOW(3))
ON DUPLICATE KEY UPDATE
  `is_published` = VALUES(`is_published`),
  `is_featured` = VALUES(`is_featured`),
  `display_order` = VALUES(`display_order`),
  `featured_image` = VALUES(`featured_image`),
  `website_url` = VALUES(`website_url`),
  `category_id` = VALUES(`category_id`),
  `updated_at` = CURRENT_TIMESTAMP(3);

INSERT INTO `references_i18n`
(
  id, reference_id, locale,
  title, slug,
  summary, content,
  featured_image_alt,
  meta_title, meta_description,
  created_at, updated_at
)
VALUES
  ('ri180001-5001-4001-9001-000000000001', 'ref10001-4001-4001-8001-000000000001', 'tr', 'Balistik Koruma Uretici Agi', 'balistik-koruma-uretici-agi', 'NIJ uyumlu yelek, plaka, kask ve arac koruma cozumleri icin dogrulanmis uretici kanallari.', '<p>Sultan Defense, balistik koruma urunlerinde teknik sertifika, numune, seri uretim kapasitesi ve ihracat uygunlugunu birlikte degerlendirir. Alicilar icin dogru seviye, dogru belge ve dogru teslim planini netlestirir.</p>', 'Balistik koruma tedarik agi', 'Balistik Koruma Uretici Agi | Sultan Defense', 'NIJ uyumlu balistik yelek, plaka, kask ve arac koruma tedarik agi.', NOW(3), NOW(3)),
  ('ri180002-5002-4002-9002-000000000002', 'ref10002-4002-4002-8002-000000000002', 'tr', 'Taktik Haberlesme Entegrasyon Ortaklari', 'taktik-haberlesme-entegrasyon-ortaklari', 'Telsiz, interkom, komuta merkezi ve sensor entegrasyonu icin teknik degerlendirme odakli tedarik agi.', '<p>Haberlesme ve komuta elektronigi taleplerinde frekans, sifreleme, guc, aksesuar ve egitim ihtiyaclari birlikte ele alinir. Sultan Defense, uretici ve alici arasinda teknik uygunluk dosyasini koordine eder.</p>', 'Taktik haberlesme tedarik agi', 'Taktik Haberlesme Ortaklari | Sultan Defense', 'Taktik telsiz, komuta merkezi, sensor ve elektronik entegrasyon tedarik ortaklari.', NOW(3), NOW(3)),
  ('ri180003-5003-4003-9003-000000000003', 'ref10003-4003-4003-8003-000000000003', 'tr', 'Saha Destek ve Lojistik Tedarik Agi', 'saha-destek-lojistik-tedarik-agi', 'Taktik cadir, mobil mutfak, su-yakit dagitim, bakım atolyeleri ve sevkiyat ekipmani icin tedarik kabiliyeti.', '<p>Saha destek ekipmanlari, hedef cografya ve operasyon senaryosuna gore paketlenmelidir. Sultan Defense, teslim sekli, yedek parca ve dokuman setini teklif dosyasina dahil eder.</p>', 'Saha destek lojistik tedarigi', 'Saha Destek Lojistik Tedarik Agi | Sultan Defense', 'Taktik saha destek, konteyner, guc ve lojistik ekipman tedarik agi.', NOW(3), NOW(3)),
  ('ri180004-5004-4004-9004-000000000004', 'ref10004-4004-4004-8004-000000000004', 'tr', 'Deniz ve Marine Sistemleri Ortaklari', 'deniz-marine-sistemleri-ortaklari', 'Kiyi gozetleme, deniz elektronigi, sualti guvenligi ve gemi koruma ekipmanlari icin uretici koordinasyonu.', '<p>Deniz ve marine sistemlerinde iklim dayanimi, tuzlu su kosullari, enerji ihtiyaci ve entegrasyon gereksinimleri erken asamada incelenir.</p>', 'Deniz ve marine sistemleri tedarigi', 'Deniz ve Marine Sistemleri | Sultan Defense', 'Kiyi gozetleme, deniz elektronigi ve gemi koruma ekipmani tedarik ortaklari.', NOW(3), NOW(3)),
  ('ri180005-5005-4005-9005-000000000005', 'ref10005-4005-4005-8005-000000000005', 'tr', 'Taktik Tekstil ve Teçhizat Atolyeleri', 'taktik-tekstil-techizat-atolyeleri', 'Muharebe uniformasi, MOLLE tasima, gorev kemeri, bot ve soguk iklim ekipmani icin esnek uretim ortaklari.', '<p>Taktik tekstil urunlerinde beden, renk, kumas, dikiş standardi, aksesuar ve paketleme detaylari toplu alim basarisini belirler. Sultan Defense bu detaylari ureticiyle netlestirir.</p>', 'Taktik tekstil tedarik agi', 'Taktik Tekstil ve Teçhizat | Sultan Defense', 'Muharebe uniformasi, MOLLE sistem, bot ve operasyonel tekstil tedarik agi.', NOW(3), NOW(3)),
  ('ri180006-5006-4006-9006-000000000006', 'ref10006-4006-4006-8006-000000000006', 'tr', 'Egitim ve Simulasyon Yazilim Ortaklari', 'egitim-simulasyon-yazilim-ortaklari', 'Atis, konvoy, komuta kontrol, ucus ve deniz egitim simulatorleri icin yazilim ve entegrasyon kabiliyeti.', '<p>Simulasyon projelerinde senaryo, donanim, yazilim, egitmen paneli ve raporlama gereksinimleri birlikte tanimlanir. Sultan Defense, teknik kapsam ve lisans modelini teklif asamasinda netlestirir.</p>', 'Egitim simulasyon tedarigi', 'Egitim ve Simulasyon Yazilimi | Sultan Defense', 'Atis, konvoy, C2, ucus ve deniz simulatorleri icin tedarik ve entegrasyon agi.', NOW(3), NOW(3)),
  ('ri180007-5007-4007-9007-000000000007', 'ref10001-4001-4001-8001-000000000001', 'en', 'Ballistic Protection Manufacturer Network', 'ballistic-protection-manufacturer-network', 'Verified manufacturer channels for NIJ-aligned vests, plates, helmets, and vehicle protection solutions.', '<p>Sultan Defense evaluates technical certificates, samples, serial production capacity, and export suitability for ballistic protection products. It helps buyers clarify the right level, document set, and delivery plan.</p>', 'Ballistic protection procurement network', 'Ballistic Protection Manufacturer Network | Sultan Defense', 'Procurement network for NIJ-aligned ballistic vests, plates, helmets, and vehicle protection.', NOW(3), NOW(3)),
  ('ri180008-5008-4008-9008-000000000008', 'ref10002-4002-4002-8002-000000000002', 'en', 'Tactical Communications Integration Partners', 'tactical-communications-integration-partners', 'Technical procurement network for radios, intercoms, command centers, and sensor integration.', '<p>For communications and command electronics, frequency, encryption, power, accessories, and training needs are reviewed together. Sultan Defense coordinates the technical fit file between manufacturer and buyer.</p>', 'Tactical communications procurement network', 'Tactical Communications Partners | Sultan Defense', 'Procurement partners for tactical radios, command centers, sensors, and electronic integration.', NOW(3), NOW(3)),
  ('ri180009-5009-4009-9009-000000000009', 'ref10003-4003-4003-8003-000000000003', 'en', 'Field Support and Logistics Supplier Network', 'field-support-logistics-supplier-network', 'Procurement capability for tactical tents, mobile kitchens, water-fuel distribution, field workshops, and shipment equipment.', '<p>Field support equipment should be packaged according to destination geography and operational scenario. Sultan Defense includes delivery terms, spare parts, and document sets in the offer file.</p>', 'Field support logistics procurement', 'Field Support Logistics Supplier Network | Sultan Defense', 'Procurement network for tactical field support, containerized units, power, and logistics equipment.', NOW(3), NOW(3)),
  ('ri180010-5010-4010-9010-000000000010', 'ref10004-4004-4004-8004-000000000004', 'en', 'Naval and Marine Systems Partners', 'naval-marine-systems-partners', 'Manufacturer coordination for coastal surveillance, marine electronics, underwater security, and vessel protection equipment.', '<p>For naval and marine systems, climate resistance, saltwater conditions, power requirements, and integration needs are reviewed early.</p>', 'Naval and marine systems procurement', 'Naval and Marine Systems | Sultan Defense', 'Procurement partners for coastal surveillance, marine electronics, and vessel protection equipment.', NOW(3), NOW(3)),
  ('ri180011-5011-4011-9011-000000000011', 'ref10005-4005-4005-8005-000000000005', 'en', 'Tactical Textile and Gear Workshops', 'tactical-textile-gear-workshops', 'Flexible production partners for combat uniforms, MOLLE carriage, duty belts, boots, and cold-weather equipment.', '<p>In tactical textile procurement, sizing, color, fabric, stitching standard, accessories, and packaging details define bulk order success. Sultan Defense clarifies these details with manufacturers.</p>', 'Tactical textile procurement network', 'Tactical Textile and Gear | Sultan Defense', 'Procurement network for combat uniforms, MOLLE systems, boots, and operational textile.', NOW(3), NOW(3)),
  ('ri180012-5012-4012-9012-000000000012', 'ref10006-4006-4006-8006-000000000006', 'en', 'Training and Simulation Software Partners', 'training-simulation-software-partners', 'Software and integration capability for marksmanship, convoy, command-control, flight, and naval training simulators.', '<p>Simulation projects define scenario, hardware, software, instructor panel, and reporting requirements together. Sultan Defense clarifies technical scope and licensing model during quotation.</p>', 'Training simulation procurement', 'Training and Simulation Software | Sultan Defense', 'Procurement and integration network for marksmanship, convoy, C2, flight, and naval simulators.', NOW(3), NOW(3))
ON DUPLICATE KEY UPDATE
  `title` = VALUES(`title`),
  `slug` = VALUES(`slug`),
  `summary` = VALUES(`summary`),
  `content` = VALUES(`content`),
  `featured_image_alt` = VALUES(`featured_image_alt`),
  `meta_title` = VALUES(`meta_title`),
  `meta_description` = VALUES(`meta_description`),
  `updated_at` = CURRENT_TIMESTAMP(3);

COMMIT;
SET FOREIGN_KEY_CHECKS = 1;
