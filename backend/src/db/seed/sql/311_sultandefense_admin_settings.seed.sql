-- =============================================================
-- FILE: 311_sultandefense_admin_settings.seed.sql
-- Sultan Defense — Admin Panel UI Configurations
-- =============================================================

SET NAMES utf8mb4;
SET time_zone = '+00:00';

INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES
(
  UUID(),
  'ui_admin_config',
  '*',
  CAST(JSON_OBJECT(
    'default_locale', 'en',
    'theme', JSON_OBJECT(
      'mode', 'light',
      'preset', 'sultandefense',
      'font', 'inter',
      'accent', '#2BD4D9',
      'navy', '#0D1B2A'
    ),
    'layout', JSON_OBJECT(
      'sidebar_variant', 'inset',
      'sidebar_collapsible', 'icon',
      'navbar_style', 'sticky',
      'content_layout', 'centered'
    ),
    'branding', JSON_OBJECT(
      'app_name', 'Sultan Defense Admin Panel',
      'app_copyright', 'Sultan Defense',
      'html_lang', 'tr',
      'theme_color', '#2BD4D9',
      'favicon_16', '/favicon/favicon-16.png',
      'favicon_32', '/favicon/favicon-32.png',
      'apple_touch_icon', '/favicon/apple-touch-icon.png',
      'meta', JSON_OBJECT(
        'title', 'Sultan Defense Admin Panel',
        'description', 'Sultan Defense icin urun katalogu, tedarik talepleri, medya, blog ve site ayarlarini yoneten admin paneli.',
        'og_url', 'https://www.sultandefense.com',
        'og_title', 'Sultan Defense Admin Panel',
        'og_description', 'Savunma tedarik katalogu ve B2B teklif sureclerinin yonetim ekrani.',
        'og_image', '/logo/png/sultandefense_logo_512.png',
        'twitter_card', 'summary_large_image'
      )
    )
  ) AS CHAR CHARACTER SET utf8mb4),
  NOW(3),
  NOW(3)
),
(
  UUID(),
  'ui_admin_pages',
  'tr',
  CAST(JSON_OBJECT(
    'dashboard', JSON_OBJECT('title', 'Ozet Paneli', 'description', 'Sistem genel bakis ve metrikler', 'metrics', JSON_ARRAY('products', 'gallery', 'services', 'offers', 'contacts', 'references', 'categories', 'custom_pages', 'reviews', 'newsletter', 'users', 'email_templates', 'site_settings', 'menu_items', 'sliders', 'footer_sections', 'storage')),
    'users', JSON_OBJECT('title', 'Kullanici Yonetimi', 'description', 'Sistem kullanicilarini yonet'),
    'offers', JSON_OBJECT('title', 'Teklif Talepleri', 'description', 'Gelen B2B tedarik talepleri ve teklif sureci'),
    'products', JSON_OBJECT('title', 'Urunler', 'description', 'Savunma urun katalogu ve kategori yonetimi'),
    'gallery', JSON_OBJECT('title', 'Galeri', 'description', 'Savunma katalog gorselleri ve medya yonetimi'),
    'categories', JSON_OBJECT('title', 'Kategoriler', 'description', 'Urun ve haber kategori yonetimi'),
    'services', JSON_OBJECT('title', 'Tedarik Sureci', 'description', 'Kaynak bulma, uyum, kalite kabul ve lojistik hizmetleri'),
    'reviews', JSON_OBJECT('title', 'Degerlendirmeler', 'description', 'Musteri yorumlari ve onaylama'),
    'site_settings', JSON_OBJECT('title', 'Site Ayarlari', 'description', 'Genel site konfigrasyonu')
  ) AS CHAR CHARACTER SET utf8mb4),
  NOW(3),
  NOW(3)
),
(
  UUID(),
  'ui_admin_pages',
  'en',
  CAST(JSON_OBJECT(
    'dashboard', JSON_OBJECT('title', 'Dashboard Overview', 'description', 'System overview and metrics', 'metrics', JSON_ARRAY('products', 'gallery', 'services', 'offers', 'contacts', 'references', 'categories', 'custom_pages', 'reviews', 'newsletter', 'users', 'email_templates', 'site_settings', 'menu_items', 'sliders', 'footer_sections', 'storage')),
    'users', JSON_OBJECT('title', 'User Management', 'description', 'Manage system users'),
    'offers', JSON_OBJECT('title', 'Quote Requests', 'description', 'Incoming B2B procurement requests and quotation workflow'),
    'products', JSON_OBJECT('title', 'Products', 'description', 'Defense product catalog and category management'),
    'gallery', JSON_OBJECT('title', 'Gallery', 'description', 'Defense catalog images and media management'),
    'categories', JSON_OBJECT('title', 'Categories', 'description', 'Product and news category management'),
    'services', JSON_OBJECT('title', 'Procurement Workflow', 'description', 'Sourcing, compliance, quality acceptance, and logistics services'),
    'reviews', JSON_OBJECT('title', 'Reviews', 'description', 'Customer reviews and moderation'),
    'site_settings', JSON_OBJECT('title', 'Site Settings', 'description', 'General site configuration')
  ) AS CHAR CHARACTER SET utf8mb4),
  NOW(3),
  NOW(3)
),
(
  UUID(),
  'ui_admin_pages',
  'de',
  CAST(JSON_OBJECT(
    'dashboard', JSON_OBJECT('title', 'Ubersicht', 'description', 'Systemubersicht und Metriken', 'metrics', JSON_ARRAY('products', 'gallery', 'services', 'offers', 'contacts', 'references', 'categories', 'custom_pages', 'reviews', 'newsletter', 'users', 'email_templates', 'site_settings', 'menu_items', 'sliders', 'footer_sections', 'storage')),
    'users', JSON_OBJECT('title', 'Benutzerverwaltung', 'description', 'Systembenutzer verwalten'),
    'offers', JSON_OBJECT('title', 'Angebotsanfragen', 'description', 'B2B-Beschaffungsanfragen und Angebotsablauf'),
    'products', JSON_OBJECT('title', 'Produkte', 'description', 'Verwaltung des Verteidigungsproduktkatalogs'),
    'gallery', JSON_OBJECT('title', 'Galerie', 'description', 'Katalogbilder und Medienverwaltung'),
    'categories', JSON_OBJECT('title', 'Kategorien', 'description', 'Produkt- und Nachrichtenkategorien verwalten'),
    'services', JSON_OBJECT('title', 'Beschaffungsprozess', 'description', 'Sourcing, Compliance, Qualitatsabnahme und Logistik'),
    'reviews', JSON_OBJECT('title', 'Bewertungen', 'description', 'Kundenbewertungen und Moderation'),
    'site_settings', JSON_OBJECT('title', 'Seiteneinstellungen', 'description', 'Allgemeine Seitenkonfiguration')
  ) AS CHAR CHARACTER SET utf8mb4),
  NOW(3),
  NOW(3)
)
ON DUPLICATE KEY UPDATE
  `value` = VALUES(`value`),
  `updated_at` = VALUES(`updated_at`);
