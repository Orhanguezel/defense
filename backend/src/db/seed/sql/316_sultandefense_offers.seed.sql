-- =============================================================
-- FILE: 316_sultandefense_offers.seed.sql
-- Sultan Defense — Örnek teklif talepleri
-- =============================================================

SET NAMES utf8mb4;
SET time_zone = '+00:00';

-- Offer number counter
INSERT INTO `offer_number_counters` (`year`, `last_seq`, `prefix`)
VALUES (2026, 5, 'SD')
ON DUPLICATE KEY UPDATE `last_seq` = GREATEST(`last_seq`, VALUES(`last_seq`));

-- Örnek teklifler
INSERT INTO `offers` (`id`, `offer_no`, `status`, `source`, `locale`, `country_code`, `customer_name`, `company_name`, `email`, `phone`, `subject`, `message`, `form_data`, `product_id`, `service_id`, `consent_marketing`, `consent_terms`, `currency`, `net_total`, `vat_rate`, `vat_total`, `shipping_total`, `gross_total`, `valid_until`, `admin_notes`, `created_at`, `updated_at`)
VALUES
(
  'of010001-0001-4001-9001-000000000001',
  'SD-2026-0001',
  'quoted',
  'sultandefense',
  'tr',
  'Türkiye',
  'Ahmet Yılmaz',
  'Yılmaz Holding A.Ş.',
  'ahmet.yilmaz@yilmazholding.com',
  '+90 532 111 22 33',
  'Balistik Yelek ve Plaka Teklif Talebi',
  'Seviye IIIA yelek ve NIJ uyumlu balistik plaka setleri icin fiyat, teslim suresi ve EUC gereksinimlerini paylasmanizi rica ederiz.',
  '{"product_family": "ballistic_protection", "quantity": "250 sets", "destination": "Türkiye", "preferred_deadline": "2026-12-01", "notes": "NIJ belgesi ve numune opsiyonu gerekli"}',
  NULL, NULL,
  1, 1,
  'USD', 185000.00, 0.00, 0.00, 0.00, 185000.00,
  '2026-06-01 00:00:00.000',
  'EUC taslagi ve teknik sartname bekleniyor.',
  NOW(3), NOW(3)
),
(
  'of010002-0002-4002-9002-000000000002',
  'SD-2026-0002',
  'new',
  'sultandefense',
  'tr',
  'Türkiye',
  'Fatma Demir',
  NULL,
  'fatma.demir@gmail.com',
  '+90 541 222 33 44',
  'Taktik Tekstil ve Sirt Cantasi Talebi',
  'Taktik yelek, gorev kemeri ve operasyonel sirt cantasi icin katalog ve toplu alim teklifi talep ediyoruz.',
  '{"product_family": "tactical_textile", "quantity": "500 pcs mixed", "destination": "Türkiye", "notes": "Renk: koyu yesil ve siyah opsiyonlari"}',
  NULL, NULL,
  0, 1,
  'TRY', NULL, 20.00, NULL, NULL, NULL,
  NULL,
  NULL,
  NOW(3), NOW(3)
),
(
  'of010003-0003-4003-9003-000000000003',
  'SD-2026-0003',
  'compliance_review',
  'sultandefense',
  'tr',
  'Türkiye',
  'Mehmet Kaya',
  'Kaya Security Ltd.',
  'mehmet@kayasecurity.com',
  '+90 555 333 44 55',
  'Taktik Haberlesme Ekipmani',
  'El telsizi, kulaklik, anten ve sarj istasyonu iceren haberlesme seti icin teknik uygunluk ve ihracat sureci hakkinda teklif istiyoruz.',
  '{"product_family": "communications", "quantity": "120 kits", "destination": "Türkiye", "preferred_deadline": "2027-03-01", "notes": "Frekans bandi ve kripto gereksinimi gorusulecek"}',
  NULL, NULL,
  1, 1,
  'USD', 92000.00, 0.00, 0.00, 0.00, 92000.00,
  '2026-09-01 00:00:00.000',
  'Teknik frekans gereksinimleri alici tarafindan teyit edilecek.',
  NOW(3), NOW(3)
),
(
  'of010004-0004-4004-9004-000000000004',
  'SD-2026-0004',
  'accepted',
  'sultandefense',
  'en',
  'Germany',
  'Hans Mueller',
  'Mueller Security GmbH',
  'hans@mueller-security.de',
  '+49 171 555 6677',
  'Optics and Thermal Imaging Package',
  'We are looking for a procurement partner for thermal monoculars, day optics, mounts, and spare battery packages.',
  '{"product_family": "optics_thermal", "quantity": "80 units", "destination": "Germany", "preferred_deadline": "2027-06-01", "notes": "Export documentation and warranty terms required"}',
  NULL, NULL,
  1, 1,
  'EUR', 1200000.00, 20.00, 240000.00, 0.00, 1440000.00,
  '2026-12-01 00:00:00.000',
  'Manufacturer options shortlisted. Export documentation review in progress.',
  NOW(3), NOW(3)
),
(
  'of010005-0005-4005-9005-000000000005',
  'SD-2026-0005',
  'sent',
  'sultandefense',
  'tr',
  'Türkiye',
  'Ayşe Çelik',
  NULL,
  'ayse.celik@outlook.com',
  '+90 538 444 55 66',
  'Lojistik ve Gumruk Dokuman Destegi',
  'Orta Dogu teslimatli savunma ekipmani icin paketleme, rota ve gumruk dokuman destegi talep ediyoruz.',
  '{"service_type": "secure_logistics", "destination": "Middle East", "notes": "EUC ve ithalat izin dokumanlari hazirlanacak"}',
  NULL, NULL,
  0, 1,
  'USD', 12500.00, 0.00, 0.00, 0.00, 12500.00,
  '2026-05-15 00:00:00.000',
  'Tasima rotasi ve teslim sekli icin on teklif gonderildi.',
  NOW(3), NOW(3)
)
ON DUPLICATE KEY UPDATE `status` = VALUES(`status`), `updated_at` = VALUES(`updated_at`);
