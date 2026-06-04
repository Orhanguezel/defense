-- =============================================================
-- 040_site_settings.sql (Sultan Defense) – MULTI-LOCALE (Dynamic) [FIXED]
--  - app_locales + default_locale => locale='*'
--  - localized settings => locale in ('tr','en')
--  - cookie_consent => LOCALIZED (tr/en)
-- =============================================================

SET NAMES utf8mb4;
SET time_zone = '+00:00';

SET FOREIGN_KEY_CHECKS = 0;
START TRANSACTION;

-- =============================================================
-- TABLE
-- =============================================================
CREATE TABLE IF NOT EXISTS `site_settings` (
  `id`         CHAR(36)      NOT NULL,
  `key`        VARCHAR(100)  NOT NULL,
  `locale`     VARCHAR(8)    NOT NULL,
  `value`      TEXT          NOT NULL,
  `created_at` DATETIME(3)   NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` DATETIME(3)   NOT NULL DEFAULT CURRENT_TIMESTAMP(3)
               ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `site_settings_key_locale_uq` (`key`, `locale`),
  KEY `site_settings_key_idx` (`key`),
  KEY `site_settings_locale_idx` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================================
-- GLOBAL: app_locales (locale='*')
-- =============================================================
INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES
(
  UUID(),
  'app_locales',
  '*',
  CAST(
    JSON_ARRAY(
      JSON_OBJECT('code','tr','label','Türkçe','is_default', TRUE, 'is_active', TRUE),
      JSON_OBJECT('code','en','label','English','is_default', FALSE, 'is_active', TRUE)
    ) AS CHAR CHARACTER SET utf8mb4
  ),
  NOW(3),
  NOW(3)
)
ON DUPLICATE KEY UPDATE
  `value`      = VALUES(`value`),
  `updated_at` = VALUES(`updated_at`);

-- =============================================================
-- GLOBAL: default_locale (locale='*')
-- =============================================================
INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES
(UUID(), 'default_locale', '*', 'tr', NOW(3), NOW(3))
ON DUPLICATE KEY UPDATE
  `value`      = VALUES(`value`),
  `updated_at` = VALUES(`updated_at`);

-- =============================================================
-- LOCALIZED: TR içerik ayarları
-- =============================================================
INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES
(
  UUID(),
  'contact_info',
  'tr',
  CAST(JSON_OBJECT(
    'companyName','Sultan Defense',
    'phones',JSON_ARRAY('+90 545 552 75 35'),
    'email','info@sultandefense.com',
    'address','Folkart Time 1 - Office Blocks, Kazimdirik, Floor 6, Flat 612, Bornova, Izmir, Turkiye',
    'addressSecondary','Middle East, Africa and Turkic Republics procurement coordination',
    'whatsappNumber','+905455527535',
    'taxOffice','',
    'taxNumber','',
    'website','https://www.sultandefense.com'
  ) AS CHAR CHARACTER SET utf8mb4),
  NOW(3),
  NOW(3)
),
(UUID(), 'catalog_pdf_url',        'tr', 'https://www.sultandefense.com/uploads/sultandefense/catalog/sultandefense-katalog.pdf', NOW(3), NOW(3)),
(UUID(), 'catalog_pdf_filename',   'tr', 'sultandefense-katalog.pdf', NOW(3), NOW(3)),
(UUID(), 'catalog_admin_email',    'tr', 'info@sultandefense.com', NOW(3), NOW(3)),
(UUID(), 'site_title',             'tr', 'Sultan Defense', NOW(3), NOW(3)),
(
  UUID(),
  'socials',
  'tr',
  CAST(JSON_OBJECT(
    'instagram','',
    'facebook','',
    'youtube','',
    'linkedin','',
    'x','',
    'tiktok',''
  ) AS CHAR CHARACTER SET utf8mb4),
  NOW(3),
  NOW(3)
),
(
  UUID(),
  'company_profile',
  'tr',
  CAST(JSON_OBJECT(
    'headline','Sultan Defense – Savunma Tedarikinde Guvenilir Ihracat Ortagi',
    'subline','Savunma urunleri icin kaynak bulma, ihracat uyumu, kalite kabul ve lojistik koordinasyonunu tek akista yonetiyoruz.',
    'body','Sultan Defense Ltd., Co. 1996’dan beri savunma ve askeri ekipman tedarikinde B2B alicilara hizmet veren bir ihracat ve tedarik koordinasyon sirketidir. Uretici degil, dogrulanmis uretici agi ile alici arasinda guvenilir operasyon ortagidir.'
  ) AS CHAR CHARACTER SET utf8mb4),
  NOW(3),
  NOW(3)
),
(
  UUID(),
  'company_brand',
  'tr',
  CAST(JSON_OBJECT(
    'name','Sultan Defense',
    'shortName','Sultan Defense',
    'website','https://www.sultandefense.com'
  ) AS CHAR CHARACTER SET utf8mb4),
  NOW(3),
  NOW(3)
),
(
  UUID(),
  'catalog_admin_user_ids',
  'tr',
  CAST(JSON_ARRAY() AS CHAR CHARACTER SET utf8mb4),
  NOW(3),
  NOW(3)
)
ON DUPLICATE KEY UPDATE
  `value`      = VALUES(`value`),
  `updated_at` = VALUES(`updated_at`);

-- =============================================================
-- LOCALIZED: EN içerik ayarları
-- =============================================================
INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES
(UUID(), 'catalog_pdf_url',        'en', 'https://www.sultandefense.com/uploads/sultandefense/catalog/sultandefense-catalog.pdf', NOW(3), NOW(3)),
(UUID(), 'catalog_pdf_filename',   'en', 'sultandefense-catalog.pdf', NOW(3), NOW(3)),
(UUID(), 'catalog_admin_email',    'en', 'info@sultandefense.com', NOW(3), NOW(3)),
(UUID(), 'site_title',             'en', 'Sultan Defense', NOW(3), NOW(3)),
(
  UUID(),
  'contact_info',
  'en',
  CAST(JSON_OBJECT(
    'companyName','Sultan Defense',
    'phones',JSON_ARRAY('+90 545 552 75 35'),
    'email','info@sultandefense.com',
    'address','Folkart Time 1 - Office Blocks, Kazimdirik, Floor 6, Flat 612, Bornova, Izmir, Turkiye',
    'addressSecondary','Middle East, Africa and Turkic Republics procurement coordination',
    'whatsappNumber','+905455527535',
    'taxOffice','',
    'taxNumber','',
    'website','https://www.sultandefense.com'
  ) AS CHAR CHARACTER SET utf8mb4),
  NOW(3),
  NOW(3)
),
(
  UUID(),
  'socials',
  'en',
  CAST(JSON_OBJECT(
    'instagram','',
    'facebook','',
    'youtube','',
    'linkedin','',
    'x','',
    'tiktok',''
  ) AS CHAR CHARACTER SET utf8mb4),
  NOW(3),
  NOW(3)
),
(
  UUID(),
  'company_brand',
  'en',
  CAST(JSON_OBJECT(
    'name','Sultan Defense',
    'shortName','Sultan Defense',
    'website','https://www.sultandefense.com'
  ) AS CHAR CHARACTER SET utf8mb4),
  NOW(3),
  NOW(3)
),
(
  UUID(),
  'company_profile',
  'en',
  CAST(JSON_OBJECT(
    'headline','Sultan Defense – Trusted Export Partner for Defense Procurement',
    'subline','We coordinate sourcing, export compliance, quality acceptance, and logistics for defense products in one workflow.',
    'body','Sultan Defense Ltd., Co. is a B2B export and procurement coordination company serving verified defense and military equipment buyers since 1996. It is not a manufacturer; it connects buyers with verified manufacturer channels and manages the procurement workflow.'
  ) AS CHAR CHARACTER SET utf8mb4),
  NOW(3),
  NOW(3)
)
ON DUPLICATE KEY UPDATE
  `value`      = VALUES(`value`),
  `updated_at` = VALUES(`updated_at`);

-- =============================================================
-- GLOBAL: Storage (locale='*')
-- =============================================================
INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES
(UUID(), 'storage_driver',             '*', 'cloudinary',                                  NOW(3), NOW(3)),
(UUID(), 'storage_local_root',         '*', '/var/www/sultandefense/uploads',                NOW(3), NOW(3)),
(UUID(), 'storage_local_base_url',     '*', '/uploads',                                    NOW(3), NOW(3)),
(UUID(), 'cloudinary_cloud_name',      '*', 'dbozv7wqd',                                   NOW(3), NOW(3)),
(UUID(), 'cloudinary_api_key',         '*', 'change-me-in-admin',                          NOW(3), NOW(3)),
(UUID(), 'cloudinary_api_secret',      '*', 'change-me-in-admin',                          NOW(3), NOW(3)),
(UUID(), 'cloudinary_folder',          '*', 'uploads/sultandefense',                         NOW(3), NOW(3)),
(UUID(), 'cloudinary_unsigned_preset', '*', 'sultandefense_unsigned',                      NOW(3), NOW(3)),
(UUID(), 'storage_cdn_public_base',    '*', 'https://res.cloudinary.com',                  NOW(3), NOW(3)),
(UUID(), 'storage_public_api_base',    '*', 'https://www.sultandefense.com/api',             NOW(3), NOW(3))
ON DUPLICATE KEY UPDATE
  `value`      = VALUES(`value`),
  `updated_at` = VALUES(`updated_at`);

-- =============================================================
-- GLOBAL: Public Base URL (locale='*')
-- =============================================================
INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES
(UUID(), 'public_base_url', '*', 'https://www.sultandefense.com', NOW(3), NOW(3))
ON DUPLICATE KEY UPDATE
  `value`      = VALUES(`value`),
  `updated_at` = VALUES(`updated_at`);

-- =============================================================
-- GLOBAL: SMTP (locale='*')
-- =============================================================
INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES
(UUID(), 'smtp_host',       '*', 'smtp.example.com',        NOW(3), NOW(3)),
(UUID(), 'smtp_port',       '*', '465',                     NOW(3), NOW(3)),
(UUID(), 'smtp_username',   '*', 'info@sultandefense.com',    NOW(3), NOW(3)),
(UUID(), 'smtp_password',   '*', 'change-me-in-admin',      NOW(3), NOW(3)),
(UUID(), 'smtp_from_email', '*', 'info@sultandefense.com',    NOW(3), NOW(3)),
(UUID(), 'smtp_from_name',  '*', 'Sultan Defense',            NOW(3), NOW(3)),
(UUID(), 'smtp_ssl',        '*', 'true',                    NOW(3), NOW(3))
ON DUPLICATE KEY UPDATE
  `value`      = VALUES(`value`),
  `updated_at` = VALUES(`updated_at`);

-- =============================================================
-- GLOBAL: Google OAuth (locale='*')
-- =============================================================
INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES
(UUID(), 'google_client_id',     '*', 'your-google-client-id.apps.googleusercontent.com', NOW(3), NOW(3)),
(UUID(), 'google_client_secret', '*', 'change-me-in-admin',                               NOW(3), NOW(3))
ON DUPLICATE KEY UPDATE
  `value`      = VALUES(`value`),
  `updated_at` = VALUES(`updated_at`);

-- =============================================================
-- GLOBAL: GTM + GA4 (locale='*')
-- =============================================================
INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES
(UUID(), 'gtm_container_id',   '*', 'GTM-XXXXXXXX', NOW(3), NOW(3)),
(UUID(), 'ga4_measurement_id', '*', 'G-XXXXXXXXXX', NOW(3), NOW(3))
ON DUPLICATE KEY UPDATE
  `value`      = VALUES(`value`),
  `updated_at` = VALUES(`updated_at`);


-- =============================================================
-- GLOBAL: Site Media (locale='*')
-- Keys:
--  - site_logo
--  - site_logo_dark
--  - site_logo_light
--  - site_favicon
--  - site_apple_touch_icon   (180x180)
--  - site_app_icon_512       (512x512 manifest/icon)
--  - site_og_default_image   (1200x630 OG default)
--
-- Value format:
--  - simplest: URL string
--  - optional: JSON_OBJECT('url',..., 'width',..., 'height',..., 'asset_id',..., 'alt',...)
-- Service layer parseMediaUrl() supports both.
-- =============================================================

INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES
(
  UUID(),
  'site_logo',
  '*',
  CAST(
    JSON_OBJECT(
      'url','/logo/sultandefense-logo-light.svg',
      'dark_url','/logo/sultandefense-logo-dark.svg',
      'width',160,
      'height',60,
      'alt','Sultan Defense Logo'
    ) AS CHAR CHARACTER SET utf8mb4
  ),
  NOW(3),
  NOW(3)
),
(
  UUID(),
  'site_logo_dark',
  '*',
  CAST(
    JSON_OBJECT(
      'url','/logo/sultandefense-logo-dark.svg',
      'width',160,
      'height',60,
      'alt','Sultan Defense Logo (Dark)'
    ) AS CHAR CHARACTER SET utf8mb4
  ),
  NOW(3),
  NOW(3)
),
(
  UUID(),
  'site_logo_light',
  '*',
  CAST(
    JSON_OBJECT(
      'url','/logo/sultandefense-logo-light.svg',
      'width',160,
      'height',60,
      'alt','Sultan Defense Logo (Light)'
    ) AS CHAR CHARACTER SET utf8mb4
  ),
  NOW(3),
  NOW(3)
),
(
  UUID(),
  'site_favicon',
  '*',
  CAST(
    JSON_OBJECT(
      'url','/favicon/favicon-32.png',
      'alt','Sultan Defense Favicon'
    ) AS CHAR CHARACTER SET utf8mb4
  ),
  NOW(3),
  NOW(3)
),
(
  UUID(),
  'site_apple_touch_icon',
  '*',
  CAST(
    JSON_OBJECT(
      'url','/favicon/apple-touch-icon.png',
      'alt','Sultan Defense Apple Touch Icon'
    ) AS CHAR CHARACTER SET utf8mb4
  ),
  NOW(3),
  NOW(3)
),
(
  UUID(),
  'site_app_icon_512',
  '*',
  CAST(
    JSON_OBJECT(
      'url','/logo/png/sultandefense_logo_512.png',
      'alt','Sultan Defense App Icon (512x512)'
    ) AS CHAR CHARACTER SET utf8mb4
  ),
  NOW(3),
  NOW(3)
),
(
  UUID(),
  'site_og_default_image',
  '*',
  CAST(
    JSON_OBJECT(
      'url','/logo/png/sultandefense_logo_512.png',
      'width',1200,
      'height',630,
      'alt','Sultan Defense'
    ) AS CHAR CHARACTER SET utf8mb4
  ),
  NOW(3),
  NOW(3)
)
ON DUPLICATE KEY UPDATE
  `value`      = VALUES(`value`),
  `updated_at` = VALUES(`updated_at`);

-- =============================================================
-- LOCALIZED: Cookie Consent Config (tr/en)
-- consent_version değişince tekrar onay al
-- =============================================================
INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES
(
  UUID(),
  'cookie_consent',
  'tr',
  CAST(
    JSON_OBJECT(
      'consent_version', 1,
      'defaults', JSON_OBJECT('necessary', TRUE, 'analytics', FALSE, 'marketing', FALSE),
      'ui', JSON_OBJECT('enabled', TRUE, 'position', 'bottom', 'show_reject_all', TRUE),
      'texts', JSON_OBJECT(
        'title', 'Çerez Tercihleri',
        'description', 'Sitemizin doğru çalışmasını sağlamak ve isteğe bağlı analiz yapmak için çerezler kullanıyoruz. Tercihlerinizi yönetebilirsiniz.'
      )
    ) AS CHAR CHARACTER SET utf8mb4
  ),
  NOW(3),
  NOW(3)
),
(
  UUID(),
  'cookie_consent',
  'en',
  CAST(
    JSON_OBJECT(
      'consent_version', 1,
      'defaults', JSON_OBJECT('necessary', TRUE, 'analytics', FALSE, 'marketing', FALSE),
      'ui', JSON_OBJECT('enabled', TRUE, 'position', 'bottom', 'show_reject_all', TRUE),
      'texts', JSON_OBJECT(
        'title', 'Cookie Preferences',
        'description', 'We use cookies to ensure the site works properly and to optionally analyze traffic. You can manage your preferences.'
      )
    ) AS CHAR CHARACTER SET utf8mb4
  ),
  NOW(3),
  NOW(3)
)
ON DUPLICATE KEY UPDATE
  `value`      = VALUES(`value`),
  `updated_at` = VALUES(`updated_at`);

COMMIT;
SET FOREIGN_KEY_CHECKS = 1;
