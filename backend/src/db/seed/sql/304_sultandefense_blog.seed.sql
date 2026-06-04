-- =============================================================
-- FILE: 304_sultandefense_blog.seed.sql
-- Sultan Defense — Blog / field notes (custom_pages) + i18n (TR/EN)
-- module_key = 'sultandefense_blog'
-- =============================================================

SET NAMES utf8mb4;
SET time_zone = '+00:00';
SET FOREIGN_KEY_CHECKS = 0;

START TRANSACTION;

INSERT INTO `custom_pages`
(
  `id`, `module_key`, `is_published`, `featured`, `display_order`, `order_num`,
  `featured_image`, `featured_image_asset_id`, `image_url`, `storage_asset_id`,
  `images`, `storage_image_ids`, `category_id`, `sub_category_id`
)
VALUES
  ('bb010001-5001-4001-9001-bbbbbbbb0001', 'sultandefense_blog', 1, 1, 10, 10, '/media/sultandefense/blog-procurement-checklist.jpg', NULL, '/media/sultandefense/blog-procurement-checklist.jpg', NULL, '[]', '[]', NULL, NULL),
  ('bb010002-5002-4002-9002-bbbbbbbb0002', 'sultandefense_blog', 1, 1, 20, 20, '/media/sultandefense/blog-export-compliance.jpg', NULL, '/media/sultandefense/blog-export-compliance.jpg', NULL, '[]', '[]', NULL, NULL),
  ('bb010003-5003-4003-9003-bbbbbbbb0003', 'sultandefense_blog', 1, 0, 30, 30, '/media/sultandefense/blog-turkish-defense-industry.jpg', NULL, '/media/sultandefense/blog-turkish-defense-industry.jpg', NULL, '[]', '[]', NULL, NULL),
  ('bb010004-5004-4004-9004-bbbbbbbb0004', 'sultandefense_blog', 1, 0, 40, 40, '/media/sultandefense/blog-resilient-supply-chain.jpg', NULL, '/media/sultandefense/blog-resilient-supply-chain.jpg', NULL, '[]', '[]', NULL, NULL)
ON DUPLICATE KEY UPDATE
  `module_key` = VALUES(`module_key`),
  `is_published` = VALUES(`is_published`),
  `featured` = VALUES(`featured`),
  `display_order` = VALUES(`display_order`),
  `featured_image` = VALUES(`featured_image`),
  `image_url` = VALUES(`image_url`);

INSERT INTO `custom_pages_i18n`
(`id`, `page_id`, `locale`, `title`, `slug`, `content`, `summary`, `meta_title`, `meta_description`, `tags`)
VALUES
  (
    'bb020001-6001-4001-a001-bbbbbbbb0001',
    'bb010001-5001-4001-9001-bbbbbbbb0001',
    'tr',
    'Savunma Tedarik Kontrol Listesi: Ihtiyactan Sevkiyata',
    'savunma-tedarik-kontrol-listesi',
    JSON_OBJECT('html', '<p>Savunma tedariki yalnizca urun bulma isi degildir; ihtiyac tanimi, teknik uyumluluk, uretici dogrulama, ihracat izni, son kullanici belgesi ve lojistik planlama ayni zincirin halkalaridir.</p><h2>Net ihtiyac tanimi</h2><p>Kalibre, standart, miktar, aksesuar, yedek parca ve egitim gereksinimleri bastan netlestirilmelidir. Belirsiz talep, yanlis teklif ve geciken teslimat anlamina gelir.</p><h2>Uretici ve belge kontrolu</h2><p>Sultan Defense, dogrulanmis uretici kanallariyla teknik veri sayfalarini, sertifikalari ve ihracat uygunlugunu kontrol ederek teklif surecini yonetir.</p><h2>Sevkiyat plani</h2><p>Ambalaj, rota, teslim sekli ve gumruk dokumantasyonu, urun secimi kadar erken ele alinmalidir.</p>'),
    'Savunma tedarikinde ihtiyac tanimindan EUC ve sevkiyata kadar izlenmesi gereken temel kontrol listesi.',
    'Savunma Tedarik Kontrol Listesi | Sultan Defense',
    'Savunma tedarikinde teknik gereksinim, uretici dogrulama, EUC, ihracat izni ve lojistik kontrol listesi.',
    'savunma tedariki, EUC, ihracat izni, askeri lojistik'
  ),
  (
    'bb020002-6002-4002-a002-bbbbbbbb0002',
    'bb010002-5002-4002-9002-bbbbbbbb0002',
    'tr',
    'EUC ve Ihracat Uyumu Neden Kritik?',
    'euc-ihracat-uyumu-neden-kritik',
    JSON_OBJECT('html', '<p>Son kullanici belgesi (EUC), savunma urunlerinin dogru alici, dogru kullanim amaci ve dogru ulkeye teslim edildigini belgeleyen temel uyum aracidir.</p><h2>Riskleri azaltir</h2><p>Eksik veya tutarsiz EUC, ihracat izni surecinde gecikmeye, sevkiyat blokajina veya teklifin iptaline yol acabilir.</p><h2>Belgeler birlikte calisir</h2><p>EUC, ithalat izni, teknik sertifika, fatura, paket listesi ve tasima evraklari ayni dosya mantigiyla hazirlanmalidir.</p><h2>Sultan Defense rolu</h2><p>Ekibimiz, alici ve uretici arasinda dokuman akisini koordine eder; mevzuat ve uretici beklentilerini erken asamada netlestirir.</p>'),
    'Son kullanici belgesi, ihracat izni ve dokuman uyumunun savunma tedarikindeki rolunu aciklayan kisa rehber.',
    'EUC ve Ihracat Uyumu | Sultan Defense',
    'Savunma ihracatinda EUC, ihracat izni, ithalat belgesi ve sevkiyat dokumanlarinin onemi.',
    'EUC, export compliance, son kullanici belgesi, savunma ihracati'
  ),
  (
    'bb020003-6003-4003-a003-bbbbbbbb0003',
    'bb010003-5003-4003-9003-bbbbbbbb0003',
    'tr',
    'Turk Savunma Sanayi Neden Talep Goruyor?',
    'turk-savunma-sanayi-neden-talep-goruyor',
    JSON_OBJECT('html', '<p>Turkiye, kara sistemleri, balistik koruma, taktik tekstil, haberlesme, optik ve insansiz sistemlerde hizli gelisen bir uretim ekosistemine sahiptir.</p><h2>Esnek uretim</h2><p>Turk ureticiler, farkli cografyalarin operasyonel ihtiyaclarina gore konfigrasyon ve paketleme esnekligi sunabilir.</p><h2>Rekabetci toplam maliyet</h2><p>Urun fiyati kadar teslim suresi, yedek parca, egitim ve servis kabiliyeti de toplam maliyeti belirler.</p><h2>Dogru kanal onemlidir</h2><p>Sultan Defense, aliciyi dogru uretici ve dogru belge setiyle bulusturarak sureci sadeleştirir.</p>'),
    'Turk savunma ekosisteminin ihracat pazarlarinda neden guclu talep gordugune dair ozet degerlendirme.',
    'Turk Savunma Sanayi Talebi | Sultan Defense',
    'Turk savunma sanayinin esnek uretim, rekabetci maliyet ve tedarik avantajlari.',
    'Turk savunma sanayi, defense industry, tedarik, ihracat'
  ),
  (
    'bb020004-6004-4004-a004-bbbbbbbb0004',
    'bb010004-5004-4004-9004-bbbbbbbb0004',
    'tr',
    'Dayanikli Taktik Tedarik Zinciri Kurmak',
    'dayanikli-taktik-tedarik-zinciri',
    JSON_OBJECT('html', '<p>Operasyonel kullanima gidecek ekipmanlarda tek fiyat odakli tedarik yaklasimi yeterli degildir. Sureklilik, yedek parca, alternatif uretici ve dokuman hazirligi ayni anda planlanmalidir.</p><h2>Alternatif kaynak</h2><p>Kritik kalemler icin muadil urun ve ikinci uretici secenekleri onceden belirlenmelidir.</p><h2>Kalite ve kabul</h2><p>Fabrika kabul, numune kontrolu ve standart uyumu sevkiyat oncesinde dogrulanmalidir.</p><h2>Bolgesel lojistik</h2><p>Orta Dogu, Afrika ve Turk Cumhuriyetleri icin rota, gumruk ve teslim sekli planlamasi ulke bazinda ele alinir.</p>'),
    'Savunma ekipmani tedarikinde sureklilik, kalite kabul ve bolgesel lojistik icin pratik yaklasimlar.',
    'Dayanikli Taktik Tedarik Zinciri | Sultan Defense',
    'Savunma tedarik zincirinde alternatif kaynak, kalite kabul, yedek parca ve bolgesel lojistik planlama.',
    'tedarik zinciri, taktik ekipman, kalite kabul, askeri lojistik'
  ),
  (
    'bb020005-6005-4005-a005-bbbbbbbb0005',
    'bb010001-5001-4001-9001-bbbbbbbb0001',
    'en',
    'Defense Procurement Checklist: From Requirement to Shipment',
    'defense-procurement-checklist',
    JSON_OBJECT('html', '<p>Defense procurement is not just product sourcing. Requirement definition, technical fit, manufacturer validation, export permits, end-user documentation, and logistics planning all belong to the same chain.</p><h2>Clear requirement definition</h2><p>Caliber, standard, quantity, accessories, spare parts, and training needs should be clarified before quotation. Ambiguous demand creates wrong offers and delayed delivery.</p><h2>Manufacturer and document review</h2><p>Sultan Defense works through verified manufacturer channels and checks technical data sheets, certificates, and export suitability during the offer process.</p><h2>Shipment planning</h2><p>Packaging, route, delivery terms, and customs documentation should be handled as early as product selection.</p>'),
    'A practical checklist for defense procurement from requirement definition to EUC and shipment planning.',
    'Defense Procurement Checklist | Sultan Defense',
    'Defense procurement checklist covering technical requirements, manufacturer validation, EUC, export permits, and logistics.',
    'defense procurement, EUC, export permit, military logistics'
  ),
  (
    'bb020006-6006-4006-a006-bbbbbbbb0006',
    'bb010002-5002-4002-9002-bbbbbbbb0002',
    'en',
    'Why EUC and Export Compliance Matter',
    'euc-export-compliance',
    JSON_OBJECT('html', '<p>The end-user certificate (EUC) is a core compliance document proving the correct buyer, end use, and destination for defense products.</p><h2>It reduces risk</h2><p>An incomplete or inconsistent EUC can delay export licensing, block shipment, or cancel a quotation.</p><h2>Documents work together</h2><p>EUC, import permits, technical certificates, invoice, packing list, and transport documents should be prepared as one consistent file.</p><h2>Sultan Defense role</h2><p>Our team coordinates documentation between buyer and manufacturer, clarifying regulatory and manufacturer expectations early.</p>'),
    'A short guide to EUC, export permits, and documentation compliance in defense procurement.',
    'EUC and Export Compliance | Sultan Defense',
    'The importance of EUC, export permits, import documents, and shipment paperwork in defense export workflows.',
    'EUC, export compliance, end-user certificate, defense export'
  ),
  (
    'bb020007-6007-4007-a007-bbbbbbbb0007',
    'bb010003-5003-4003-9003-bbbbbbbb0003',
    'en',
    'Why Turkish Defense Manufacturing Is in Demand',
    'turkish-defense-manufacturing-demand',
    JSON_OBJECT('html', '<p>Turkey has a fast-growing manufacturing ecosystem in land systems, ballistic protection, tactical textile, communications, optics, and unmanned systems.</p><h2>Flexible production</h2><p>Turkish manufacturers can often provide configuration and packaging flexibility for different operational environments.</p><h2>Competitive total cost</h2><p>Delivery time, spare parts, training, and service capability are as important as unit price.</p><h2>The right channel matters</h2><p>Sultan Defense connects buyers with the right manufacturer and document set, making the workflow clearer.</p>'),
    'A short assessment of why Turkey’s defense manufacturing ecosystem attracts international procurement demand.',
    'Turkish Defense Manufacturing Demand | Sultan Defense',
    'Turkish defense manufacturing advantages in flexible production, competitive cost, and procurement readiness.',
    'Turkish defense industry, defense manufacturing, procurement, export'
  ),
  (
    'bb020008-6008-4008-a008-bbbbbbbb0008',
    'bb010004-5004-4004-9004-bbbbbbbb0004',
    'en',
    'Building a Resilient Tactical Supply Chain',
    'resilient-tactical-supply-chain',
    JSON_OBJECT('html', '<p>For operational equipment, procurement cannot be based on unit price alone. Continuity, spare parts, alternative suppliers, and document readiness should be planned together.</p><h2>Alternative sourcing</h2><p>Equivalent products and second-source manufacturers should be identified in advance for critical items.</p><h2>Quality and acceptance</h2><p>Factory acceptance, sample review, and standard compliance should be verified before shipment.</p><h2>Regional logistics</h2><p>Routes, customs, and delivery terms for the Middle East, Africa, and Turkic Republics are planned country by country.</p>'),
    'Practical approaches to continuity, quality acceptance, and regional logistics in defense equipment procurement.',
    'Resilient Tactical Supply Chain | Sultan Defense',
    'Defense supply chain planning for alternative sources, quality acceptance, spare parts, and regional logistics.',
    'supply chain, tactical equipment, quality acceptance, military logistics'
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
