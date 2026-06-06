-- =============================================================
-- FILE: 312_sultandefense_seo_pages.seed.sql
-- Sultan Defense page-level SEO
-- Key: sultandefense__seo_pages (locale: tr, en)
-- =============================================================

SET NAMES utf8mb4;
SET time_zone = '+00:00';

INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES (
  UUID(),
  'sultandefense__seo_pages',
  'tr',
  CAST(JSON_OBJECT(
    'home', JSON_OBJECT('title', 'Savunma Tedariki ve Taktik Ekipman', 'description', 'Sultan Defense, taktik ekipman, askeri elektronik, lojistik destek ve savunma teknolojileri icin uc uca tedarik cozumleri sunar.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'projeler', JSON_OBJECT('title', 'Savunma Urun Kategorileri', 'description', 'Balistik koruma, muhabere, sahra lojistigi, deniz sistemleri, guc cozumleri, gozetleme ve taktik tekstil kategorilerini inceleyin.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'hizmetler', JSON_OBJECT('title', 'Savunma Tedarik Sureci', 'description', 'Stratejik kaynak bulma, uretici koordinasyonu, EUC ve ihracat uyumu, kalite kontrol ve guvenli lojistik sureclerimiz.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'galeri', JSON_OBJECT('title', 'Savunma Urun Galerisi', 'description', 'Sultan Defense tedarik agindaki savunma, guvenlik, lojistik ve taktik ekipman gorselleri.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'haberler', JSON_OBJECT('title', 'Savunma Tedarik Haberleri', 'description', 'Savunma tedariki, ihracat uyumu, lojistik ve Turk savunma sanayiinden guncel notlar.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'hakkimizda', JSON_OBJECT('title', 'Hakkimizda', 'description', '1996dan beri savunma tedariki, taktik ekipman ve ihracat uyumu alaninda calisan Sultan Defense hakkinda.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'iletisim', JSON_OBJECT('title', 'Iletisim', 'description', 'Sultan Defense ihracat uzmanlariyla iletisime gecin. Izmir ofis, telefon ve e-posta bilgileri.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'teklif', JSON_OBJECT('title', 'Tedarik Teklifi Al', 'description', 'Savunma ve guvenlik ihtiyaclariniz icin Sultan Defense ihracat ekibinden resmi tedarik teklifi isteyin.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'legal_privacy', JSON_OBJECT('title', 'Gizlilik Politikasi', 'description', 'Sultan Defense KVKK/GDPR gizlilik ve B2B tedarik veri isleme esaslari.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'legal_terms', JSON_OBJECT('title', 'Kullanim Kosullari', 'description', 'Sultan Defense tedarik modeli, ihracat kontrolu, EUC ve web sitesi kullanim kosullari.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false)
  ) AS CHAR CHARACTER SET utf8mb4),
  NOW(3), NOW(3)
)
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`), `updated_at` = VALUES(`updated_at`);

INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES (
  UUID(),
  'sultandefense__seo_pages',
  'en',
  CAST(JSON_OBJECT(
    'home', JSON_OBJECT('title', 'Defense Procurement & Tactical Equipment', 'description', 'Sultan Defense supplies tactical gear, military electronics, logistics systems, and defense technologies through end-to-end procurement workflows.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'projeler', JSON_OBJECT('title', 'Defense Product Categories', 'description', 'Explore ballistic protection, communications, field logistics, naval systems, power solutions, surveillance, and tactical textile categories.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'hizmetler', JSON_OBJECT('title', 'Defense Procurement Process', 'description', 'Strategic sourcing, manufacturer liaison, EUC and export compliance, quality assurance, and secure global logistics.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'galeri', JSON_OBJECT('title', 'Defense Product Gallery', 'description', 'Defense, security, logistics, and tactical equipment visuals from the Sultan Defense procurement network.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'haberler', JSON_OBJECT('title', 'Defense Procurement News', 'description', 'Updates on defense procurement, export compliance, logistics, and the Turkish defense industry.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'hakkimizda', JSON_OBJECT('title', 'About Us', 'description', 'About Sultan Defense, a global defense procurement, tactical equipment sourcing, and export compliance partner since 1996.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'iletisim', JSON_OBJECT('title', 'Contact', 'description', 'Contact Sultan Defense export specialists. Izmir office, phone, and email information.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'teklif', JSON_OBJECT('title', 'Request a Procurement Quote', 'description', 'Request an official procurement quote from Sultan Defense for your defense and security requirements.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'legal_privacy', JSON_OBJECT('title', 'Privacy Policy', 'description', 'Sultan Defense privacy principles for KVKK/GDPR and B2B procurement data handling.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'legal_terms', JSON_OBJECT('title', 'Terms & Conditions', 'description', 'Sultan Defense procurement model, export controls, EUC requirements, and website terms.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false)
  ) AS CHAR CHARACTER SET utf8mb4),
  NOW(3), NOW(3)
)
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`), `updated_at` = VALUES(`updated_at`);
