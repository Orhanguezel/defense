-- =============================================================
-- 040.1_site_meta.sql  (FINAL / DRY OG IMAGE)
-- Sultan Defense – Default Meta + Global SEO (NEW STANDARD)
--
-- Fix: MySQL 1093 (ER_UPDATE_TABLE_USED)
-- - Do not SELECT from `site_settings` inside INSERT/UPSERT statements.
-- - Use UUID() for INSERT ids; rely on UNIQUE(key, locale) for UPSERT.
-- - Build JSON payloads once in variables and reuse for seo/site_seo.
-- =============================================================

SET NAMES utf8mb4;
SET time_zone = '+00:00';
SET FOREIGN_KEY_CHECKS = 0;

START TRANSACTION;

-- -------------------------------------------------------------
-- TABLE GUARD
-- -------------------------------------------------------------
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

-- -------------------------------------------------------------
-- Helpers
-- -------------------------------------------------------------
-- OG DEFAULT:
-- 1) First try site_og_default_image (locale='*') JSON -> $.url
-- 2) If not JSON, use value as plain URL
-- 3) If missing/empty, fallback to '/img/og-default.jpg'
-- -------------------------------------------------------------
SET @OG_DEFAULT := COALESCE(
  (
    SELECT COALESCE(
      JSON_UNQUOTE(JSON_EXTRACT(`value`, '$.url')),
      NULLIF(`value`, '')
    )
    FROM `site_settings`
    WHERE `key` = 'site_og_default_image'
      AND `locale` = '*'
    ORDER BY `updated_at` DESC
    LIMIT 1
  ),
  '/logo/png/sultandefense_logo_512.png'
);

-- -------------------------------------------------------------
-- Title policies:
-- - Avoid: | & " ' < > etc.
-- - Use: "–" as separator, and "and/und/ve" instead of "&"
-- -------------------------------------------------------------

-- Brand / default titles (ASCII-safe)
SET @BRAND_TR := 'Sultan Defense – Savunma Tedarik ve Ihracat';
SET @BRAND_EN := 'Sultan Defense – Defense Procurement and Export';
SET @BRAND_DE := 'Sultan Defense – Verteidigungsbeschaffung und Export';

-- Site name (shorter, neutral)
SET @SITE_NAME_GLOBAL := 'Sultan Defense';

-- Global default title
SET @TITLE_GLOBAL := 'Sultan Defense – Defense Procurement and Export';

-- Concise descriptions
SET @DESC_TR := 'Sultan Defense – Savunma urunleri icin B2B tedarik, ihracat uyumu, kalite kabul ve lojistik koordinasyonu.';
SET @DESC_EN := 'Sultan Defense – B2B sourcing, export compliance, quality acceptance, and logistics coordination for defense products.';
SET @DESC_DE := 'Sultan Defense – B2B-Beschaffung, Export-Compliance, Qualitatsabnahme und Logistik fur Verteidigungsprodukte.';

-- Global concise description
SET @DESC_GLOBAL := 'Defense procurement and export coordination for verified B2B buyers across land systems, tactical equipment, electronics, and logistics.';

-- Global keywords (neutral)
SET @KW_GLOBAL := 'sultandefense, defense procurement, tactical equipment, ballistic protection, export compliance, EUC, military logistics';

-- -------------------------------------------------------------
-- Build JSON payloads once (DRY)
-- -------------------------------------------------------------

-- GLOBAL seo/site_seo payload (locale='*')
SET @SEO_GLOBAL := CAST(
  JSON_OBJECT(
    'site_name',      @SITE_NAME_GLOBAL,
    'title_default',  @TITLE_GLOBAL,
    'title_template', '%s – Sultan Defense',
    'description',    @DESC_GLOBAL,
    'open_graph', JSON_OBJECT(
      'type',   'website',
      'images', JSON_ARRAY(@OG_DEFAULT)
    ),
    'twitter', JSON_OBJECT(
      'card',    'summary_large_image',
      'site',    '',
      'creator', ''
    ),
    'robots', JSON_OBJECT(
      'noindex', false,
      'index',   true,
      'follow',  true
    )
  ) AS CHAR CHARACTER SET utf8mb4
);

-- TR/EN/DE seo/site_seo payloads
SET @SEO_TR := CAST(
  JSON_OBJECT(
    'site_name',      @BRAND_TR,
    'title_default',  @BRAND_TR,
    'title_template', '%s – Sultan Defense',
    'description',    @DESC_TR,
    'open_graph', JSON_OBJECT(
      'type',   'website',
      'images', JSON_ARRAY(@OG_DEFAULT)
    ),
    'twitter', JSON_OBJECT(
      'card',    'summary_large_image',
      'site',    '',
      'creator', ''
    ),
    'robots', JSON_OBJECT(
      'noindex', false,
      'index',   true,
      'follow',  true
    )
  ) AS CHAR CHARACTER SET utf8mb4
);

SET @SEO_EN := CAST(
  JSON_OBJECT(
    'site_name',      @BRAND_EN,
    'title_default',  @BRAND_EN,
    'title_template', '%s – Sultan Defense',
    'description',    @DESC_EN,
    'open_graph', JSON_OBJECT(
      'type',   'website',
      'images', JSON_ARRAY(@OG_DEFAULT)
    ),
    'twitter', JSON_OBJECT(
      'card',    'summary_large_image',
      'site',    '',
      'creator', ''
    ),
    'robots', JSON_OBJECT(
      'noindex', false,
      'index',   true,
      'follow',  true
    )
  ) AS CHAR CHARACTER SET utf8mb4
);

SET @SEO_DE := CAST(
  JSON_OBJECT(
    'site_name',      @BRAND_DE,
    'title_default',  @BRAND_DE,
    'title_template', '%s – Sultan Defense',
    'description',    @DESC_DE,
    'open_graph', JSON_OBJECT(
      'type',   'website',
      'images', JSON_ARRAY(@OG_DEFAULT)
    ),
    'twitter', JSON_OBJECT(
      'card',    'summary_large_image',
      'site',    '',
      'creator', ''
    ),
    'robots', JSON_OBJECT(
      'noindex', false,
      'index',   true,
      'follow',  true
    )
  ) AS CHAR CHARACTER SET utf8mb4
);

-- site_meta_default payloads
SET @META_GLOBAL := CAST(
  JSON_OBJECT(
    'title',       @TITLE_GLOBAL,
    'description', @DESC_GLOBAL,
    'keywords',    @KW_GLOBAL
  ) AS CHAR CHARACTER SET utf8mb4
);

SET @META_TR := CAST(
  JSON_OBJECT(
    'title',       @BRAND_TR,
    'description', @DESC_TR,
    'keywords',    'sultandefense, savunma tedariki, taktik ekipman, balistik koruma, ihracat uyumu, EUC, askeri lojistik'
  ) AS CHAR CHARACTER SET utf8mb4
);

SET @META_EN := CAST(
  JSON_OBJECT(
    'title',       @BRAND_EN,
    'description', @DESC_EN,
    'keywords',    'sultandefense, defense procurement, tactical equipment, ballistic protection, export compliance, EUC, military logistics'
  ) AS CHAR CHARACTER SET utf8mb4
);

SET @META_DE := CAST(
  JSON_OBJECT(
    'title',       @BRAND_DE,
    'description', @DESC_DE,
    'keywords',    'sultandefense, verteidigungsbeschaffung, taktische ausrustung, ballistischer schutz, export compliance, EUC, militaerlogistik'
  ) AS CHAR CHARACTER SET utf8mb4
);

-- =============================================================
-- GLOBAL SEO DEFAULTS (locale='*')  --> neutral fallback
-- =============================================================

-- PRIMARY: seo (GLOBAL DEFAULT)
INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES
(
  UUID(),
  'seo',
  '*',
  @SEO_GLOBAL,
  NOW(3),
  NOW(3)
)
ON DUPLICATE KEY UPDATE
  `value`      = VALUES(`value`),
  `updated_at` = VALUES(`updated_at`);

-- FALLBACK: site_seo (GLOBAL DEFAULT)
INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES
(
  UUID(),
  'site_seo',
  '*',
  @SEO_GLOBAL,
  NOW(3),
  NOW(3)
)
ON DUPLICATE KEY UPDATE
  `value`      = VALUES(`value`),
  `updated_at` = VALUES(`updated_at`);

-- =============================================================
-- LOCALIZED SEO OVERRIDES (tr/en/de)
-- =============================================================

-- seo overrides
INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES
(UUID(), 'seo', 'tr', @SEO_TR, NOW(3), NOW(3)),
(UUID(), 'seo', 'en', @SEO_EN, NOW(3), NOW(3)),
(UUID(), 'seo', 'de', @SEO_DE, NOW(3), NOW(3))
ON DUPLICATE KEY UPDATE
  `value`      = VALUES(`value`),
  `updated_at` = VALUES(`updated_at`);

-- site_seo overrides (copy identical payload)
INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES
(UUID(), 'site_seo', 'tr', @SEO_TR, NOW(3), NOW(3)),
(UUID(), 'site_seo', 'en', @SEO_EN, NOW(3), NOW(3)),
(UUID(), 'site_seo', 'de', @SEO_DE, NOW(3), NOW(3))
ON DUPLICATE KEY UPDATE
  `value`      = VALUES(`value`),
  `updated_at` = VALUES(`updated_at`);

-- =============================================================
-- site_meta_default
-- - Add '*' fallback so new locales won't break
-- - Keep per-locale overrides for tr/en/de
-- =============================================================

-- '*' fallback (neutral EN)
INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES
(UUID(), 'site_meta_default', '*',  @META_GLOBAL, NOW(3), NOW(3))
ON DUPLICATE KEY UPDATE
  `value`      = VALUES(`value`),
  `updated_at` = VALUES(`updated_at`);

-- tr/en/de overrides
INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES
(UUID(), 'site_meta_default', 'tr', @META_TR, NOW(3), NOW(3)),
(UUID(), 'site_meta_default', 'en', @META_EN, NOW(3), NOW(3)),
(UUID(), 'site_meta_default', 'de', @META_DE, NOW(3), NOW(3))
ON DUPLICATE KEY UPDATE
  `value`      = VALUES(`value`),
  `updated_at` = VALUES(`updated_at`);

COMMIT;
SET FOREIGN_KEY_CHECKS = 1;
