-- =============================================================
-- FILE: 306_sultandefense_products.seed.sql
-- Sultan Defense product catalog cards (TR/EN)
-- item_type = 'sultandefense'
-- =============================================================

SET NAMES utf8mb4;
SET time_zone = '+00:00';
SET FOREIGN_KEY_CHECKS = 0;

START TRANSACTION;

DELETE pi FROM `product_i18n` pi
JOIN `products` p ON p.`id` = pi.`product_id`
WHERE p.`item_type` = 'sultandefense';
DELETE FROM `products` WHERE `item_type` = 'sultandefense';

INSERT INTO `products`
(
  `id`,
  `item_type`,
  `category_id`,
  `sub_category_id`,
  `price`,
  `image_url`,
  `storage_asset_id`,
  `images`,
  `storage_image_ids`,
  `is_active`,
  `is_featured`,
  `order_num`,
  `product_code`,
  `stock_quantity`,
  `rating`,
  `review_count`
)
VALUES
  ('sd000001-7001-4001-9001-dddddddd0001', 'sultandefense', 'cccc0001-4001-4001-8001-cccccccc0001', NULL, 0.00, '/media/sultandefense/ballistic-protection.jpg', NULL, JSON_ARRAY('/media/sultandefense/ballistic-protection.jpg'), JSON_ARRAY(), 1, 1, 10, 'SD-001', 0, 5.00, 0),
  ('sd000002-7002-4002-9002-dddddddd0002', 'sultandefense', 'cccc0002-4002-4002-8002-cccccccc0002', NULL, 0.00, '/media/sultandefense/communication-command-electronics.jpg', NULL, JSON_ARRAY('/media/sultandefense/communication-command-electronics.jpg'), JSON_ARRAY(), 1, 1, 20, 'SD-002', 0, 5.00, 0),
  ('sd000003-7003-4003-9003-dddddddd0003', 'sultandefense', 'cccc0003-4003-4003-8003-cccccccc0003', NULL, 0.00, '/media/sultandefense/containerized-field-kitchen.jpg', NULL, JSON_ARRAY('/media/sultandefense/containerized-field-kitchen.jpg'), JSON_ARRAY(), 1, 1, 30, 'SD-003', 0, 5.00, 0),
  ('sd000004-7004-4004-9004-dddddddd0004', 'sultandefense', 'cccc0004-4004-4004-8004-cccccccc0004', NULL, 0.00, '/media/sultandefense/field-support-logistics.jpg', NULL, JSON_ARRAY('/media/sultandefense/field-support-logistics.jpg'), JSON_ARRAY(), 1, 1, 40, 'SD-004', 0, 5.00, 0),
  ('sd000005-7005-4005-9005-dddddddd0005', 'sultandefense', 'cccc0005-4005-4005-8005-cccccccc0005', NULL, 0.00, '/media/sultandefense/naval-marine-systems.jpg', NULL, JSON_ARRAY('/media/sultandefense/naval-marine-systems.jpg'), JSON_ARRAY(), 1, 1, 50, 'SD-005', 0, 5.00, 0),
  ('sd000006-7006-4006-9006-dddddddd0006', 'sultandefense', 'cccc0006-4006-4006-8006-cccccccc0006', NULL, 0.00, '/media/sultandefense/power-battery-generator.jpg', NULL, JSON_ARRAY('/media/sultandefense/power-battery-generator.jpg'), JSON_ARRAY(), 1, 0, 60, 'SD-006', 0, 5.00, 0),
  ('sd000007-7007-4007-9007-dddddddd0007', 'sultandefense', 'cccc0007-4007-4007-8007-cccccccc0007', NULL, 0.00, '/media/sultandefense/shield-riot-control.jpg', NULL, JSON_ARRAY('/media/sultandefense/shield-riot-control.jpg'), JSON_ARRAY(), 1, 0, 70, 'SD-007', 0, 5.00, 0),
  ('sd000008-7008-4008-9008-dddddddd0008', 'sultandefense', 'cccc0008-4008-4008-8008-cccccccc0008', NULL, 0.00, '/media/sultandefense/surveillance-sensors-security.jpg', NULL, JSON_ARRAY('/media/sultandefense/surveillance-sensors-security.jpg'), JSON_ARRAY(), 1, 0, 80, 'SD-008', 0, 5.00, 0),
  ('sd000009-7009-4009-9009-dddddddd0009', 'sultandefense', 'cccc0009-4009-4009-8009-cccccccc0009', NULL, 0.00, '/media/sultandefense/tactical-gear-textile.jpg', NULL, JSON_ARRAY('/media/sultandefense/tactical-gear-textile.jpg'), JSON_ARRAY(), 1, 0, 90, 'SD-009', 0, 5.00, 0),
  ('sd000010-7010-4010-9010-dddddddd0010', 'sultandefense', 'cccc0010-4010-4010-8010-cccccccc0010', NULL, 0.00, '/media/sultandefense/training-simulation-software.jpg', NULL, JSON_ARRAY('/media/sultandefense/training-simulation-software.jpg'), JSON_ARRAY(), 1, 0, 100, 'SD-010', 0, 5.00, 0)
ON DUPLICATE KEY UPDATE
  `item_type` = VALUES(`item_type`),
  `category_id` = VALUES(`category_id`),
  `image_url` = VALUES(`image_url`),
  `images` = VALUES(`images`),
  `is_active` = VALUES(`is_active`),
  `is_featured` = VALUES(`is_featured`),
  `order_num` = VALUES(`order_num`),
  `product_code` = VALUES(`product_code`);

INSERT INTO `product_i18n`
(`product_id`, `locale`, `title`, `slug`, `description`, `alt`, `tags`, `specifications`, `meta_title`, `meta_description`)
VALUES
  ('sd000001-7001-4001-9001-dddddddd0001', 'en', 'Advanced Ballistic Protection & Body Armor', 'ballistic-protection', '<p>High-performance ballistic protection gear for maximum survivability against modern threats. Sultan Defense supplies tactical ballistic vests, hard armor plates, ballistic helmets, and vehicle armor solutions through licensed Turkish defense manufacturers.</p>', 'Ballistic protection equipment supplied by Sultan Defense', JSON_ARRAY('ballistic protection','body armor','NIJ','helmets','armor plates'), JSON_OBJECT('solutions','Tactical vests, hard armor plates, helmets, vehicle armor','standards','NIJ, ISO 9001, MIL-STD where applicable','regions','Middle East, Africa, Turkic Republics'), 'Advanced Ballistic Protection & Body Armor | Sultan Defense', 'Procure tactical vests, hard armor plates, helmets, and vehicle armor through Sultan Defense.'),
  ('sd000001-7001-4001-9001-dddddddd0001', 'tr', 'Gelişmiş Balistik Koruma ve Vücut Zırhı', 'ballistic-protection', '<p>Sultan Defense, modern tehditlere karşı personel dayanıklılığını artıran balistik koruma ekipmanlarının tedarikini koordine eder. Taktik yelekler, sert zırh plakaları, balistik kasklar ve araç zırh çözümleri lisanslı Türk savunma üreticilerinden sağlanır.</p>', 'Sultan Defense balistik koruma ekipmanı', JSON_ARRAY('balistik koruma','vücut zırhı','NIJ','kask','zırh plakası'), JSON_OBJECT('çözümler','Taktik yelek, zırh plakası, kask, araç zırhı','standartlar','NIJ, ISO 9001, uygun ürünlerde MIL-STD','bölgeler','Orta Doğu, Afrika, Türk Cumhuriyetleri'), 'Gelişmiş Balistik Koruma | Sultan Defense', 'Taktik yelek, zırh plakası, kask ve araç zırhı tedariki için Sultan Defense.'),

  ('sd000002-7002-4002-9002-dddddddd0002', 'en', 'Secure Military Communication & Command Electronics', 'communication-command-electronics', '<p>Encrypted tactical radios, command center electronics, secure intercom systems, and electronic warfare support for resilient battlefield coordination in demanding operational environments.</p>', 'Military communication and command electronics', JSON_ARRAY('tactical radios','command electronics','encrypted communication','EW'), JSON_OBJECT('solutions','Manpack, handheld and vehicular radios, command center suites, secure intercoms','standards','NATO interoperability where applicable','regions','Middle East and Africa focused logistics'), 'Secure Military Communication & Command Electronics | Sultan Defense', 'Encrypted radios and command electronics procurement for modern military operations.'),
  ('sd000002-7002-4002-9002-dddddddd0002', 'tr', 'Güvenli Askeri Muhabere ve Komuta Elektroniği', 'communication-command-electronics', '<p>Şifreli taktik telsizler, komuta merkezi elektroniği, güvenli interkom sistemleri ve elektronik harp destek çözümleri zorlu operasyon ortamlarında kesintisiz koordinasyon sağlar.</p>', 'Askeri muhabere ve komuta elektroniği', JSON_ARRAY('taktik telsiz','komuta elektroniği','şifreli haberleşme','EH'), JSON_OBJECT('çözümler','El, araç ve sırt tipi telsizler, komuta merkezi paketleri, güvenli interkomlar','standartlar','Uygun ürünlerde NATO birlikte çalışabilirliği','bölgeler','Orta Doğu ve Afrika odaklı lojistik'), 'Güvenli Askeri Muhabere | Sultan Defense', 'Şifreli telsiz ve komuta elektroniği tedariki için Sultan Defense.'),

  ('sd000003-7003-4003-9003-dddddddd0003', 'en', 'Containerized Field Kitchens & Mobile Support Units', 'containerized-field-kitchen', '<p>Rapid-deployment mobile kitchens, containerized bakeries, hygiene units, and cold storage modules engineered to sustain troops in remote or hostile environments.</p>', 'Containerized field kitchen and support units', JSON_ARRAY('field kitchen','containerized units','mobile bakery','hygiene'), JSON_OBJECT('solutions','Mobile kitchens, bakeries, shower and hygiene units, cold storage','deployment','Rapid-deployment ISO container configurations','use_case','Forward operating bases and off-grid camps'), 'Containerized Field Kitchens & Mobile Support Units | Sultan Defense', 'Mobile field kitchen and modular support unit procurement for military deployments.'),
  ('sd000003-7003-4003-9003-dddddddd0003', 'tr', 'Konteyner Sahra Mutfakları ve Mobil Destek Üniteleri', 'containerized-field-kitchen', '<p>Uzak veya zorlu sahalarda birliklerin sürekliliğini sağlamak için mobil mutfaklar, konteyner fırınlar, hijyen üniteleri ve soğuk depolama modülleri tedarik edilir.</p>', 'Konteyner sahra mutfağı ve destek üniteleri', JSON_ARRAY('sahra mutfağı','konteyner ünite','mobil fırın','hijyen'), JSON_OBJECT('çözümler','Mobil mutfak, fırın, duş ve hijyen üniteleri, soğuk depolama','kurulum','Hızlı konuşlandırılabilir ISO konteyner yapıları','kullanım','İleri üsler ve şebekeden bağımsız kamplar'), 'Konteyner Sahra Mutfakları | Sultan Defense', 'Askeri konuşlandırmalar için mobil mutfak ve modüler destek ünitesi tedariki.'),

  ('sd000004-7004-4004-9004-dddddddd0004', 'en', 'Tactical Field Support & Military Logistics', 'field-support-logistics', '<p>Tactical tents, deployable maintenance workshops, fuel and water distribution systems, and rugged material handling equipment for uninterrupted field operations.</p>', 'Tactical field support logistics equipment', JSON_ARRAY('field logistics','military tents','maintenance workshop','fuel water systems'), JSON_OBJECT('solutions','Shelters, distribution systems, repair stations, material handling','delivery','Secure freight by air, land, or sea','role','Supply chain continuity for front-line operations'), 'Tactical Field Support & Military Logistics | Sultan Defense', 'Procure tactical shelters, maintenance workshops, and logistics equipment.'),
  ('sd000004-7004-4004-9004-dddddddd0004', 'tr', 'Taktik Saha Destek ve Askeri Lojistik', 'field-support-logistics', '<p>Taktik çadırlar, konuşlandırılabilir bakım atölyeleri, yakıt-su dağıtım sistemleri ve dayanıklı elleçleme ekipmanları kesintisiz saha operasyonları için tedarik edilir.</p>', 'Taktik saha destek lojistik ekipmanı', JSON_ARRAY('saha lojistiği','askeri çadır','bakım atölyesi','yakıt su sistemi'), JSON_OBJECT('çözümler','Barınak, dağıtım sistemi, onarım istasyonu, malzeme elleçleme','teslimat','Hava, kara veya deniz yoluyla güvenli sevkiyat','rol','Ön hat operasyonlarında tedarik sürekliliği'), 'Taktik Saha Destek Lojistiği | Sultan Defense', 'Taktik barınak, bakım atölyesi ve lojistik ekipman tedariki.'),

  ('sd000005-7005-4005-9005-dddddddd0005', 'en', 'Naval Defense & Marine Security Systems', 'naval-marine-systems', '<p>Coastal surveillance systems, military-grade marine electronics, diver support equipment, underwater security, and vessel protection solutions for maritime domain awareness.</p>', 'Naval and marine security systems', JSON_ARRAY('naval systems','marine security','coastal surveillance','sonar'), JSON_OBJECT('solutions','Radar, EO suites, marine communications, sonar, vessel protection','users','Navies, coast guards, maritime security agencies','focus','Harbor, coastal and vessel security'), 'Naval Defense & Marine Security Systems | Sultan Defense', 'Naval and marine system procurement for maritime security and coastal defense.'),
  ('sd000005-7005-4005-9005-dddddddd0005', 'tr', 'Deniz Savunma ve Marine Güvenlik Sistemleri', 'naval-marine-systems', '<p>Kıyı gözetleme sistemleri, askeri deniz elektroniği, dalgıç destek ekipmanı, sualtı güvenliği ve gemi koruma çözümleri deniz saha farkındalığını güçlendirir.</p>', 'Deniz ve marine güvenlik sistemleri', JSON_ARRAY('deniz sistemleri','marine güvenlik','kıyı gözetleme','sonar'), JSON_OBJECT('çözümler','Radar, EO paketleri, deniz haberleşmesi, sonar, gemi koruma','kullanıcılar','Deniz kuvvetleri, sahil güvenlik, deniz güvenlik ajansları','odak','Liman, kıyı ve gemi güvenliği'), 'Deniz Savunma ve Marine Sistemleri | Sultan Defense', 'Deniz güvenliği ve kıyı savunması için sistem tedariki.'),

  ('sd000006-7006-4006-9006-dddddddd0006', 'en', 'Military Power Supplies, Batteries & Generators', 'power-battery-generator', '<p>Ruggedized tactical diesel generators, military-grade rechargeable batteries, solar and hybrid power units, and intelligent distribution hubs for off-grid defense operations.</p>', 'Military power battery and generator systems', JSON_ARRAY('generator','battery','military power','hybrid power'), JSON_OBJECT('solutions','Diesel generators, lithium-ion batteries, hybrid power units, power distribution','environment','Extreme heat and remote field conditions','mission','Continuous power for command and electronic systems'), 'Military Power, Battery & Generator Systems | Sultan Defense', 'Military generator, battery, and tactical power management procurement.'),
  ('sd000006-7006-4006-9006-dddddddd0006', 'tr', 'Askeri Güç Kaynakları, Bataryalar ve Jeneratörler', 'power-battery-generator', '<p>Şebekeden bağımsız savunma operasyonları için taktik dizel jeneratörler, askeri tip şarj edilebilir bataryalar, güneş/hibrit güç üniteleri ve akıllı dağıtım merkezleri tedarik edilir.</p>', 'Askeri güç batarya ve jeneratör sistemleri', JSON_ARRAY('jeneratör','batarya','askeri güç','hibrit güç'), JSON_OBJECT('çözümler','Dizel jeneratör, lityum iyon batarya, hibrit güç ünitesi, güç dağıtımı','ortam','Aşırı sıcak ve uzak saha koşulları','görev','Komuta ve elektronik sistemler için kesintisiz enerji'), 'Askeri Güç, Batarya ve Jeneratör | Sultan Defense', 'Askeri jeneratör, batarya ve taktik güç yönetimi tedariki.'),

  ('sd000007-7007-4007-9007-dddddddd0007', 'en', 'Riot Control Gear & Tactical Shields', 'shield-riot-control', '<p>Interlocking riot shields, anti-riot suits, helmets with visors, batons, and non-lethal crowd management accessories for law enforcement and internal security units.</p>', 'Riot control shields and tactical gear', JSON_ARRAY('riot shield','anti-riot suit','law enforcement','crowd control'), JSON_OBJECT('solutions','Shields, suits, helmets, batons, accessories','materials','Polycarbonate and blunt-trauma protection systems','users','Police, gendarmerie, internal security forces'), 'Riot Control Gear & Tactical Shields | Sultan Defense', 'Professional riot control and tactical shield procurement.'),
  ('sd000007-7007-4007-9007-dddddddd0007', 'tr', 'Toplumsal Olay Kontrol Ekipmanı ve Taktik Kalkanlar', 'shield-riot-control', '<p>Kolluk ve iç güvenlik birimleri için birbirine geçebilen kalkanlar, çevik kuvvet koruma takımları, vizörlü kasklar, batonlar ve ölümcül olmayan kalabalık kontrol aksesuarları tedarik edilir.</p>', 'Toplumsal olay kontrol kalkanları ve taktik ekipman', JSON_ARRAY('çevik kalkan','koruma takımı','kolluk','kalabalık kontrol'), JSON_OBJECT('çözümler','Kalkan, koruma takımı, kask, baton, aksesuar','malzeme','Polikarbon ve darbe koruma sistemleri','kullanıcılar','Polis, jandarma, iç güvenlik güçleri'), 'Toplumsal Olay Kontrol Ekipmanı | Sultan Defense', 'Profesyonel çevik kuvvet ve taktik kalkan tedariki.'),

  ('sd000008-7008-4008-9008-dddddddd0008', 'en', 'Military Surveillance & Perimeter Security Sensors', 'surveillance-sensors-security', '<p>Long-range EO/IR cameras, perimeter intrusion detection sensors, tactical UAVs, and ground surveillance radars for real-time situational awareness and critical infrastructure protection.</p>', 'Surveillance sensors and perimeter security systems', JSON_ARRAY('EO/IR','thermal camera','UAV','perimeter security','radar'), JSON_OBJECT('solutions','Thermal cameras, seismic/acoustic/fiber sensors, UAVs, radars','mission','Border, base and critical infrastructure security','response','Real-time detection and monitoring'), 'Military Surveillance & Perimeter Security Sensors | Sultan Defense', 'EO/IR camera, sensor, UAV, and radar procurement for security operations.'),
  ('sd000008-7008-4008-9008-dddddddd0008', 'tr', 'Askeri Gözetleme ve Çevre Güvenlik Sensörleri', 'surveillance-sensors-security', '<p>Uzun menzilli EO/IR kameralar, çevre ihlal algılama sensörleri, taktik İHA sistemleri ve kara gözetleme radarları gerçek zamanlı saha farkındalığı sağlar.</p>', 'Gözetleme sensörleri ve çevre güvenlik sistemleri', JSON_ARRAY('EO/IR','termal kamera','İHA','çevre güvenliği','radar'), JSON_OBJECT('çözümler','Termal kamera, sismik/akustik/fiber sensör, İHA, radar','görev','Sınır, üs ve kritik altyapı güvenliği','tepki','Gerçek zamanlı algılama ve izleme'), 'Askeri Gözetleme ve Güvenlik Sensörleri | Sultan Defense', 'Güvenlik operasyonları için EO/IR kamera, sensör, İHA ve radar tedariki.'),

  ('sd000009-7009-4009-9009-dddddddd0009', 'en', 'Military Apparel & Tactical Gear Textiles', 'tactical-gear-textile', '<p>Combat uniforms, MOLLE load-bearing equipment, tactical belts, waterproof military footwear, and extreme-weather gear sourced through Turkey’s high-volume textile manufacturing ecosystem.</p>', 'Military apparel and tactical textile equipment', JSON_ARRAY('combat uniform','MOLLE','tactical boots','military textile'), JSON_OBJECT('solutions','Uniforms, load-bearing gear, belts, boots, weather gear','capability','High-volume textile procurement','environment','Extreme heat, cold and rough terrain'), 'Military Apparel & Tactical Gear Textiles | Sultan Defense', 'Combat uniform, tactical gear, and military textile procurement.'),
  ('sd000009-7009-4009-9009-dddddddd0009', 'tr', 'Askeri Giyim ve Taktik Tekstil Ekipmanları', 'tactical-gear-textile', '<p>Muharebe üniformaları, MOLLE taşıma ekipmanları, taktik kemerler, su geçirmez askeri botlar ve zorlu hava ekipmanları Türkiye’nin yüksek kapasiteli tekstil üretim ekosisteminden tedarik edilir.</p>', 'Askeri giyim ve taktik tekstil ekipmanı', JSON_ARRAY('muharebe üniforması','MOLLE','taktik bot','askeri tekstil'), JSON_OBJECT('çözümler','Üniforma, taşıma ekipmanı, kemer, bot, hava koşulu ekipmanı','kabiliyet','Yüksek hacimli tekstil tedariki','ortam','Aşırı sıcak, soğuk ve zorlu arazi'), 'Askeri Giyim ve Taktik Tekstil | Sultan Defense', 'Muharebe üniforması, taktik ekipman ve askeri tekstil tedariki.'),

  ('sd000010-7010-4010-9010-dddddddd0010', 'en', 'Combat Training Simulators & Software', 'training-simulation-software', '<p>Virtual marksmanship trainers, tactical convoy and vehicle simulators, command-and-control wargaming software, and flight or naval simulation environments for safe combat readiness.</p>', 'Combat training simulation software', JSON_ARRAY('simulation','marksmanship','C2','training software','wargaming'), JSON_OBJECT('solutions','Marksmanship, convoy, C2, flight and naval simulators','benefit','Reduced training risk and live-fire cost','users','Defense academies and training centers'), 'Combat Training Simulators & Software | Sultan Defense', 'Training simulation and defense software procurement for combat readiness.'),
  ('sd000010-7010-4010-9010-dddddddd0010', 'tr', 'Muharebe Eğitim Simülatörleri ve Yazılım', 'training-simulation-software', '<p>Sanal atış eğitim sistemleri, taktik konvoy ve araç simülatörleri, komuta kontrol harp oyunu yazılımları, uçuş ve deniz simülasyon ortamları güvenli muharebe hazırlığı sağlar.</p>', 'Muharebe eğitim simülasyon yazılımı', JSON_ARRAY('simülasyon','atış eğitimi','C2','eğitim yazılımı','harp oyunu'), JSON_OBJECT('çözümler','Atış, konvoy, C2, uçuş ve deniz simülatörleri','fayda','Düşük eğitim riski ve canlı atış maliyeti','kullanıcılar','Savunma akademileri ve eğitim merkezleri'), 'Muharebe Eğitim Simülatörleri | Sultan Defense', 'Muharebe hazırlığı için eğitim simülasyonu ve savunma yazılımı tedariki.')
ON DUPLICATE KEY UPDATE
  `title` = VALUES(`title`),
  `slug` = VALUES(`slug`),
  `description` = VALUES(`description`),
  `alt` = VALUES(`alt`),
  `tags` = VALUES(`tags`),
  `specifications` = VALUES(`specifications`),
  `meta_title` = VALUES(`meta_title`),
  `meta_description` = VALUES(`meta_description`);

COMMIT;
SET FOREIGN_KEY_CHECKS = 1;
