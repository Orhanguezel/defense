-- =============================================================
-- FILE: 310_sultandefense_services.seed.sql
-- Sultan Defense services / procurement process (TR + EN)
-- =============================================================

SET NAMES utf8mb4;
SET time_zone = '+00:00';
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE `services_i18n`;
TRUNCATE TABLE `services`;

INSERT INTO services (id, module_key, is_active, is_featured, display_order, image_url, storage_asset_id)
VALUES
  ('sv010001-0001-4001-9001-000000000001', 'sultandefense', 1, 1, 1, '/media/sultandefense/strategic-sourcing.jpg', NULL),
  ('sv010001-0001-4001-9001-000000000002', 'sultandefense', 1, 1, 2, '/media/sultandefense/export-compliance.jpg', NULL),
  ('sv010001-0001-4001-9001-000000000003', 'sultandefense', 1, 1, 3, '/media/sultandefense/quality-assurance.jpg', NULL),
  ('sv010001-0001-4001-9001-000000000004', 'sultandefense', 1, 1, 4, '/media/sultandefense/secure-logistics.jpg', NULL);

INSERT INTO services_i18n
(service_id, locale, title, slug, description, content, alt, tags, meta_title, meta_description)
VALUES
  ('sv010001-0001-4001-9001-000000000001', 'tr', 'Stratejik Kaynak Bulma ve Uretici Koordinasyonu', 'stratejik-kaynak-bulma',
   'Operasyonel ihtiyaciniza uygun lisansli Turk savunma ureticilerini belirler ve teknik eslestirmeyi yonetiriz.',
   '<p>Sultan Defense uretici degildir; dogru ureticiye hizli ve guvenilir erisim saglayan tedarik partneridir. Ihtiyacinizi analiz eder, teknik sartlarinizi uygun uretici portfoyuyle eslestirir ve fiyat-performans dengesini koruyarak resmi teklif surecini koordine ederiz.</p>',
   'Stratejik savunma tedariki', '["savunma tedariki","uretici koordinasyonu","teknik eslestirme"]',
   'Stratejik Kaynak Bulma | Sultan Defense',
   'Savunma ekipmani icin lisansli uretici eslestirme ve stratejik kaynak bulma hizmeti.'),
  ('sv010001-0001-4001-9001-000000000001', 'en', 'Strategic Sourcing & Manufacturer Liaison', 'strategic-sourcing',
   'We identify licensed Turkish defense manufacturers that match your operational needs and technical specifications.',
   '<p>Sultan Defense is not a direct manufacturer; we are the procurement partner that provides fast and reliable access to the right manufacturers. We analyze requirements, match technical specifications with qualified production capabilities, and coordinate the official quotation process with a strong price-performance focus.</p>',
   'Strategic defense sourcing', '["defense procurement","manufacturer liaison","technical matching"]',
   'Strategic Sourcing | Sultan Defense',
   'Licensed manufacturer matching and strategic sourcing for defense equipment procurement.'),

  ('sv010001-0001-4001-9001-000000000002', 'tr', 'Ihracat Uyumu ve EUC Yonetimi', 'ihracat-uyumu-euc',
   'Son kullanici belgesi, ihracat izni ve ilgili mevzuat adimlarini uyum odakli sekilde koordine ederiz.',
   '<p>Uluslararasi savunma ticareti siki mevzuat ve belge takibi gerektirir. Sultan Defense, End-User Certificate (EUC), Turk makamlarina yonelik ihracat izinleri ve uluslararasi sevkiyat gereklilikleri icin sureci seffaf ve izlenebilir sekilde yonetir.</p>',
   'Ihracat uyumu ve EUC yonetimi', '["euc","ihracat izni","uyum","savunma ihracati"]',
   'Ihracat Uyumu ve EUC Yonetimi | Sultan Defense',
   'Savunma tedarikinde EUC, ihracat izni ve mevzuat uyumu koordinasyonu.'),
  ('sv010001-0001-4001-9001-000000000002', 'en', 'Export Compliance & EUC Management', 'export-compliance-euc',
   'We coordinate End-User Certificates, export permits, and regulatory workflows with a compliance-first approach.',
   '<p>International military trade requires strict documentation and legal review. Sultan Defense manages End-User Certificate (EUC) workflows, Turkish export permit coordination, and shipment compliance requirements with transparency and traceability.</p>',
   'Export compliance and EUC management', '["euc","export permit","compliance","defense export"]',
   'Export Compliance & EUC Management | Sultan Defense',
   'EUC, export permit, and regulatory compliance coordination for defense procurement.'),

  ('sv010001-0001-4001-9001-000000000003', 'tr', 'Kalite Guvencesi ve Fabrika Kabul', 'kalite-guvencesi-fabrika-kabul',
   'Sevkiyat oncesi kalite kontrol, uygunluk takibi ve fabrika kabul sureclerini uretici partnerlerle takip ederiz.',
   '<p>Her tedarik kaleminin operasyonel ihtiyaca uygunlugu kritiktir. Sultan Defense, uretici partnerlerle kalite kontrol (QC), fabrika kabul testleri (FAT), paketleme ve dokumantasyon kontrollerini koordine eder. Uygun urunlerde NATO, AQAP, MIL-STD, NIJ ve ISO 9001 gereksinimleri dikkate alinir.</p>',
   'Kalite guvencesi ve fabrika kabul', '["kalite kontrol","fat","aqap","mil-std","iso 9001"]',
   'Kalite Guvencesi ve Fabrika Kabul | Sultan Defense',
   'Savunma tedarikinde kalite kontrol, FAT ve standart uygunluk takibi.'),
  ('sv010001-0001-4001-9001-000000000003', 'en', 'Quality Assurance & Factory Acceptance', 'quality-assurance-factory-acceptance',
   'We coordinate quality control, compliance checks, and factory acceptance workflows before shipment.',
   '<p>Operational suitability is critical for every procurement item. Sultan Defense coordinates quality control (QC), Factory Acceptance Tests (FAT), packaging, and documentation checks with manufacturing partners. NATO, AQAP, MIL-STD, NIJ, and ISO 9001 requirements are considered where applicable.</p>',
   'Quality assurance and factory acceptance', '["quality control","fat","aqap","mil-std","iso 9001"]',
   'Quality Assurance & Factory Acceptance | Sultan Defense',
   'Quality control, FAT, and standards compliance coordination for defense procurement.'),

  ('sv010001-0001-4001-9001-000000000004', 'tr', 'Kuresel Lojistik ve Guvenli Teslimat', 'kuresel-lojistik-guvenli-teslimat',
   'Hava, kara veya deniz yolu ile askeri kargo icin guvenli, izlenebilir ve bolgeye uygun sevkiyat planlariz.',
   '<p>Orta Dogu, Afrika ve Turk Cumhuriyetleri basta olmak uzere zorlu rotalarda savunma ekipmani sevkiyati deneyim gerektirir. Sultan Defense, uygun tasima modu, belge seti, paketleme, sigorta ve teslimat koordinasyonunu tek surecte birlestirir.</p>',
   'Kuresel lojistik ve guvenli teslimat', '["askeri lojistik","guvenli sevkiyat","hava kargo","deniz kargo"]',
   'Kuresel Lojistik ve Guvenli Teslimat | Sultan Defense',
   'Savunma ekipmani icin guvenli hava, kara ve deniz lojistigi koordinasyonu.'),
  ('sv010001-0001-4001-9001-000000000004', 'en', 'Global Logistics & Secure Delivery', 'global-logistics-secure-delivery',
   'We plan secure, traceable, region-aware delivery for military cargo by air, land, or sea.',
   '<p>Defense equipment shipments across the Middle East, Africa, and Turkic Republics require route experience and documentation discipline. Sultan Defense combines transport mode selection, document sets, packaging, insurance, and delivery coordination in one workflow.</p>',
   'Global logistics and secure delivery', '["military logistics","secure shipment","air freight","sea freight"]',
   'Global Logistics & Secure Delivery | Sultan Defense',
   'Secure air, land, and sea logistics coordination for defense equipment procurement.');

SET FOREIGN_KEY_CHECKS = 1;
