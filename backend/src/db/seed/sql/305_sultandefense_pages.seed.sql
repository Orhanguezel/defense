-- =============================================================
-- FILE: 305_sultandefense_pages.seed.sql
-- Sultan Defense corporate and legal custom pages
-- module_key = 'sultandefense_about' | 'sultandefense_legal'
-- =============================================================

SET NAMES utf8mb4;
SET time_zone = '+00:00';
SET FOREIGN_KEY_CHECKS = 0;

START TRANSACTION;

INSERT INTO `custom_pages`
(`id`, `module_key`, `is_published`, `featured`, `display_order`, `order_num`, `featured_image`, `featured_image_asset_id`, `image_url`, `storage_asset_id`, `images`, `storage_image_ids`, `category_id`, `sub_category_id`)
VALUES
  ('bc010001-5001-4001-9001-cccccccc0001', 'sultandefense_about', 1, 0, 10, 10, '/media/sultandefense/about-sultan-defense.jpg', NULL, '/media/sultandefense/about-sultan-defense.jpg', NULL, '[]', '[]', NULL, NULL),
  ('bc010002-5002-4002-9002-cccccccc0002', 'sultandefense_legal', 1, 0, 20, 20, NULL, NULL, NULL, NULL, '[]', '[]', NULL, NULL),
  ('bc010003-5003-4003-9003-cccccccc0003', 'sultandefense_legal', 1, 0, 30, 30, NULL, NULL, NULL, NULL, '[]', '[]', NULL, NULL),
  ('bc010004-5004-4004-9004-cccccccc0004', 'sultandefense_legal', 1, 0, 40, 40, NULL, NULL, NULL, NULL, '[]', '[]', NULL, NULL),
  ('bc010005-5005-4005-9005-cccccccc0005', 'sultandefense_legal', 1, 0, 50, 50, NULL, NULL, NULL, NULL, '[]', '[]', NULL, NULL)
ON DUPLICATE KEY UPDATE
  `module_key` = VALUES(`module_key`),
  `is_published` = VALUES(`is_published`),
  `featured` = VALUES(`featured`),
  `display_order` = VALUES(`display_order`),
  `order_num` = VALUES(`order_num`),
  `featured_image` = VALUES(`featured_image`),
  `image_url` = VALUES(`image_url`);

INSERT INTO `custom_pages_i18n`
(`id`, `page_id`, `locale`, `title`, `slug`, `content`, `summary`, `meta_title`, `meta_description`, `tags`)
VALUES
  (
    'bc020001-6001-4001-a001-cccccccc0001',
    'bc010001-5001-4001-9001-cccccccc0001',
    'tr',
    'Hakkimizda',
    'about',
    JSON_OBJECT('html', '<p>1996 yilinda kurulan Sultan Defense Ltd., Co. savunma ve askeri ekipman sektorunde uzmanlasmis kuresel tedarik ve ihracat partneridir. Silahli kuvvetler, kolluk kuvvetleri ve guvenlik kurumlari icin taktik, lojistik ve teknolojik cozumlerin uc uca tedarik surecini yonetir.</p><h2>Neden Sultan Defense?</h2><ul><li>Turkiye savunma sanayisinin lisansli ve nitelikli uretici agina erisim</li><li>Orta Dogu, Afrika ve Turk Cumhuriyetleri odakli lojistik deneyimi</li><li>NATO, AQAP, MIL-STD, NIJ, NSN ve ISO 9001 gibi standartlara uygun urun portfoyu</li><li>EUC, ihracat izni ve mevzuat takibi dahil uyum odakli tedarik sureci</li></ul><p>Sultan Defense uretici degildir; operasyonel ihtiyaci analiz eder, uygun ureticiyle eslestirir, kalite ve sevkiyat surecini koordine eder.</p>'),
    'Sultan Defense, 1996 yilindan bu yana savunma ekipmani tedariki ve ihracat sureclerinde uzmanlasmis B2B partnerdir.',
    'Hakkimizda | Sultan Defense',
    'Sultan Defense hakkinda: 1996dan beri savunma tedariki, taktik ekipman ve ihracat uyumu alaninda kuresel partner.',
    'sultan defense, savunma tedariki, askeri ekipman, ihracat, turkiye savunma sanayi'
  ),
  (
    'bc020002-6002-4002-a002-cccccccc0002',
    'bc010002-5002-4002-9002-cccccccc0002',
    'tr',
    'Gizlilik Politikasi',
    'privacy',
    JSON_OBJECT('html', '<p>Sultan Defense Ltd., Co. olarak kisisel verilerinizi KVKK ve GDPR ilkelerine uygun sekilde isleriz. Web sitesi, e-posta veya teklif formlari uzerinden paylasilan bilgiler yalnizca kurumsal iletisim, tedarik degerlendirmesi ve teklif surecleri icin kullanilir.</p><h2>Tedarik Modeli ve Veri Paylasimi</h2><p>Sultan Defense dogrudan uretici degil, savunma tedarik partneridir. Dogrulanmis talepler kapsaminda teknik gereksinimleriniz ve ilgili kurumsal bilgileriniz, talebin yerine getirilmesi icin lisansli uretici partnerlerle paylasilabilir.</p><h2>Haklariniz</h2><p>Verilerinize erisim, duzeltme, silme veya isleme itiraz taleplerinizi export@sultandefense.com adresinden iletebilirsiniz.</p>'),
    'Sultan Defense KVKK/GDPR gizlilik ve B2B tedarik veri isleme esaslari.',
    'Gizlilik Politikasi | Sultan Defense',
    'Sultan Defense gizlilik politikasi, KVKK/GDPR uyumu ve tedarik surecinde veri paylasimi.',
    'gizlilik politikasi, kvkk, gdpr, savunma tedariki'
  ),
  (
    'bc020003-6003-4003-a003-cccccccc0003',
    'bc010003-5003-4003-9003-cccccccc0003',
    'tr',
    'Kullanim Kosullari',
    'terms',
    JSON_OBJECT('html', '<p>Bu web sitesini kullanarak Sultan Defense kullanim kosullarini kabul etmis sayilirsiniz. Sitedeki urun gorselleri ve teknik aciklamalar bilgilendirme amaclidir; resmi teklif, teknik sartname veya ihracat izni yerine gecmez.</p><h2>Onemli Uyari</h2><p>Sultan Defense global tedarik, ihracat ve satin alma koordinasyonu saglar; listelenen urunlerin dogrudan ureticisi degildir. Tum urunler ihracat kontrolu, son kullanici belgesi ve ilgili mevzuat degerlendirmesine tabidir.</p><h2>Gorsel ve Fikri Haklar</h2><p>Gorseller ilgili uretici, marka sahibi veya lisansli kaynaklara ait olabilir ve kategori kabiliyetini gostermek amaciyla kullanilir.</p>'),
    'Sultan Defense web sitesi kullanim kosullari ve savunma tedarik sorumluluk sinirlari.',
    'Kullanim Kosullari | Sultan Defense',
    'Sultan Defense kullanim kosullari, tedarik modeli, ihracat kontrolu ve gorsel kullanim aciklamalari.',
    'kullanim kosullari, ihracat kontrolu, euc, savunma'
  ),
  (
    'bc020004-6004-4004-a004-cccccccc0004',
    'bc010004-5004-4004-9004-cccccccc0004',
    'tr',
    'KVKK Aydinlatma Metni',
    'kvkk-aydinlatma-metni',
    JSON_OBJECT('html', '<p>6698 sayili Kisisel Verilerin Korunmasi Kanunu kapsaminda veri sorumlusu Sultan Defense Ltd., Co.dir. Kisisel veriler teklif ve iletisim taleplerinin yonetimi, uretici partnerlerle teknik uygunluk calismasi, ihracat uyum surecleri ve yasal yukumlulukler amaciyla islenebilir.</p><h2>Toplama Yontemleri</h2><p>Veriler web formlari, e-posta, telefon, kurumsal evrak ve resmi yazismalar uzerinden toplanabilir.</p><h2>Basvuru</h2><p>KVKK kapsamindaki talepleriniz icin export@sultandefense.com adresinden bizimle iletisime gecebilirsiniz.</p>'),
    'Sultan Defense KVKK aydinlatma metni ve veri isleme esaslari.',
    'KVKK Aydinlatma Metni | Sultan Defense',
    'Sultan Defense KVKK aydinlatma metni, veri isleme amaclari ve basvuru kanallari.',
    'kvkk, aydinlatma metni, kisisel veri'
  ),
  (
    'bc020005-6005-4005-a005-cccccccc0005',
    'bc010005-5005-4005-9005-cccccccc0005',
    'tr',
    'Cerez Politikasi',
    'cookies',
    JSON_OBJECT('html', '<p>Sultan Defense web sitesi, temel site fonksiyonlari, dil tercihleri, performans olcumu ve teknik sorunlarin tespiti icin cerezler kullanabilir.</p><h2>Cerez Turleri</h2><ul><li>Zorunlu cerezler</li><li>Tercih cerezleri</li><li>Analitik ve performans cerezleri</li></ul><p>Tarayici ayarlarinizdan cerezleri yonetebilir veya silebilirsiniz.</p>'),
    'Sultan Defense web sitesi cerez kullanim ve tercih yonetimi bilgileri.',
    'Cerez Politikasi | Sultan Defense',
    'Sultan Defense cerez politikasi, cerez turleri ve tarayici tercih yonetimi.',
    'cerez politikasi, cookies, analitik'
  ),
  (
    'bc020006-6006-4006-a006-cccccccc0006',
    'bc010001-5001-4001-9001-cccccccc0001',
    'en',
    'About Us',
    'about',
    JSON_OBJECT('html', '<p>Established in 1996, Sultan Defense Ltd., Co. is a specialized global supplier and procurement partner in the defense and military sector. We manage end-to-end sourcing of tactical, logistical, and technological solutions for armed forces, law enforcement, and security agencies worldwide.</p><h2>Why Sultan Defense?</h2><ul><li>Access to Turkey''s licensed and qualified defense manufacturer network</li><li>Deep logistics experience across the Middle East, Africa, and Turkic Republics</li><li>Portfolio aligned with NATO, AQAP, MIL-STD, NIJ, NSN, and ISO 9001 where applicable</li><li>Compliance-led procurement including EUC, export permits, and regulatory coordination</li></ul><p>Sultan Defense is not a direct manufacturer. We analyze operational requirements, match them with suitable manufacturers, and coordinate quality, compliance, and shipment workflows.</p>'),
    'Sultan Defense is a B2B defense procurement and export partner operating since 1996.',
    'About Us | Sultan Defense',
    'About Sultan Defense: global defense procurement, tactical equipment sourcing, and export compliance partner since 1996.',
    'sultan defense, defense procurement, military equipment, export partner, turkish defense industry'
  ),
  (
    'bc020007-6007-4007-a007-cccccccc0007',
    'bc010002-5002-4002-9002-cccccccc0002',
    'en',
    'Privacy Policy',
    'privacy',
    JSON_OBJECT('html', '<p>Sultan Defense Ltd., Co. processes personal data in line with KVKK and GDPR principles. Information submitted through this website, email, or quotation forms is used only for corporate communication, procurement evaluation, and quotation workflows.</p><h2>Supplier Model and Data Sharing</h2><p>Sultan Defense is a defense procurement partner, not a direct manufacturer. For verified inquiries, technical requirements and relevant corporate information may be shared with licensed manufacturing partners to fulfill the request.</p><h2>Your Rights</h2><p>You may request access, correction, deletion, or objection regarding your data via export@sultandefense.com.</p>'),
    'Sultan Defense privacy principles for KVKK/GDPR and B2B procurement data.',
    'Privacy Policy | Sultan Defense',
    'Sultan Defense privacy policy covering KVKK/GDPR compliance and procurement data sharing.',
    'privacy policy, kvkk, gdpr, defense procurement'
  ),
  (
    'bc020008-6008-4008-a008-cccccccc0008',
    'bc010003-5003-4003-9003-cccccccc0003',
    'en',
    'Terms & Conditions',
    'terms',
    JSON_OBJECT('html', '<p>By accessing this website, you agree to these terms and conditions. Product images and technical statements are informational and do not constitute an official quotation, technical specification, or export license.</p><h2>Crucial Notice</h2><p>Sultan Defense operates as a global supplier, export partner, and procurement coordinator. We are not the direct manufacturer of the products listed. All products are subject to export controls, End-User Certificate requirements, and applicable legal review.</p><h2>Media and Intellectual Property</h2><p>Images may belong to their respective manufacturers, brand owners, or licensed sources and are used to represent procurement capabilities.</p>'),
    'Sultan Defense website terms and defense procurement responsibility limits.',
    'Terms & Conditions | Sultan Defense',
    'Sultan Defense terms covering procurement model, export controls, EUC requirements, and media use.',
    'terms, export control, euc, defense procurement'
  ),
  (
    'bc020009-6009-4009-a009-cccccccc0009',
    'bc010004-5004-4004-9004-cccccccc0004',
    'en',
    'PDPL Information Notice',
    'pdpl-information-notice',
    JSON_OBJECT('html', '<p>Under Turkish Personal Data Protection Law No. 6698, the data controller is Sultan Defense Ltd., Co. Personal data may be processed for managing quotation and contact requests, technical evaluation with manufacturing partners, export compliance workflows, and legal obligations.</p><h2>Collection Methods</h2><p>Data may be collected through web forms, email, phone, corporate documents, and official correspondence.</p><h2>Application</h2><p>You may contact export@sultandefense.com for requests under the PDPL.</p>'),
    'Sultan Defense PDPL information notice and data processing principles.',
    'PDPL Information Notice | Sultan Defense',
    'Sultan Defense PDPL information notice, processing purposes, and application channels.',
    'pdpl, kvkk, personal data notice'
  ),
  (
    'bc020010-6010-4010-a010-cccccccc0010',
    'bc010005-5005-4005-9005-cccccccc0005',
    'en',
    'Cookie Policy',
    'cookies',
    JSON_OBJECT('html', '<p>Sultan Defense may use cookies for essential website functions, language preferences, performance measurement, and technical issue detection.</p><h2>Cookie Types</h2><ul><li>Strictly necessary cookies</li><li>Preference cookies</li><li>Analytics and performance cookies</li></ul><p>You can manage or delete cookies through your browser settings.</p>'),
    'Sultan Defense website cookie usage and preference management information.',
    'Cookie Policy | Sultan Defense',
    'Sultan Defense cookie policy covering cookie types and browser preference management.',
    'cookie policy, cookies, analytics'
  )
ON DUPLICATE KEY UPDATE
  `title` = VALUES(`title`),
  `slug` = VALUES(`slug`),
  `content` = VALUES(`content`),
  `summary` = VALUES(`summary`),
  `meta_title` = VALUES(`meta_title`),
  `meta_description` = VALUES(`meta_description`),
  `tags` = VALUES(`tags`);

COMMIT;
SET FOREIGN_KEY_CHECKS = 1;
