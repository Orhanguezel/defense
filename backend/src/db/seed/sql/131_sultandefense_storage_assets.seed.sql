-- =============================================================
-- FILE: 131_sultandefense_storage_assets.seed.sql
-- Sultan Defense — Local Storage Assets (uploads/)
-- provider = 'local', bucket = folder name
-- =============================================================

SET NAMES utf8mb4;
SET time_zone = '+00:00';
SET FOREIGN_KEY_CHECKS = 0;

START TRANSACTION;

INSERT INTO `storage_assets`
(`id`, `user_id`, `name`, `bucket`, `path`, `folder`, `mime`, `size`, `width`, `height`, `url`, `hash`, `provider`, `provider_public_id`, `provider_resource_type`, `provider_format`, `provider_version`, `etag`, `metadata`, `created_at`, `updated_at`)
VALUES
  ('sa-news-0001-0001-0001-000000000001', NULL, 'news-procurement-portfolio.jpg', 'news', 'news/news-procurement-portfolio.jpg', 'news', 'image/jpeg', 500000, 1200, 800, '/media/sultandefense/news-procurement-portfolio.jpg', NULL, 'local', 'news/news-procurement-portfolio.jpg', 'image', 'jpg', NULL, NULL, '{}', NOW(), NOW()),
  ('sa-news-0002-0002-0002-000000000002', NULL, 'news-export-compliance.jpg', 'news', 'news/news-export-compliance.jpg', 'news', 'image/jpeg', 500000, 1200, 800, '/media/sultandefense/news-export-compliance.jpg', NULL, 'local', 'news/news-export-compliance.jpg', 'image', 'jpg', NULL, NULL, '{}', NOW(), NOW()),
  ('sa-news-0003-0003-0003-000000000003', NULL, 'news-regional-logistics.jpg', 'news', 'news/news-regional-logistics.jpg', 'news', 'image/jpeg', 500000, 1200, 800, '/media/sultandefense/news-regional-logistics.jpg', NULL, 'local', 'news/news-regional-logistics.jpg', 'image', 'jpg', NULL, NULL, '{}', NOW(), NOW()),
  ('sa-news-0004-0004-0004-000000000004', NULL, 'news-tactical-technology.jpg', 'news', 'news/news-tactical-technology.jpg', 'news', 'image/jpeg', 500000, 1200, 800, '/media/sultandefense/news-tactical-technology.jpg', NULL, 'local', 'news/news-tactical-technology.jpg', 'image', 'jpg', NULL, NULL, '{}', NOW(), NOW()),
  ('sa-news-0005-0005-0005-000000000005', NULL, 'news-defense-standards.jpg', 'news', 'news/news-defense-standards.jpg', 'news', 'image/jpeg', 500000, 1200, 800, '/media/sultandefense/news-defense-standards.jpg', NULL, 'local', 'news/news-defense-standards.jpg', 'image', 'jpg', NULL, NULL, '{}', NOW(), NOW()),
  ('sa-svc-0001-0001-0001-000000000001', NULL, 'strategic-sourcing.jpg', 'services', 'services/strategic-sourcing.jpg', 'services', 'image/jpeg', 500000, 1200, 800, '/media/sultandefense/strategic-sourcing.jpg', NULL, 'local', 'services/strategic-sourcing.jpg', 'image', 'jpg', NULL, NULL, '{}', NOW(), NOW()),
  ('sa-svc-0002-0002-0002-000000000002', NULL, 'export-compliance.jpg', 'services', 'services/export-compliance.jpg', 'services', 'image/jpeg', 500000, 1200, 800, '/media/sultandefense/export-compliance.jpg', NULL, 'local', 'services/export-compliance.jpg', 'image', 'jpg', NULL, NULL, '{}', NOW(), NOW()),
  ('sa-svc-0003-0003-0003-000000000003', NULL, 'quality-assurance.jpg', 'services', 'services/quality-assurance.jpg', 'services', 'image/jpeg', 500000, 1200, 800, '/media/sultandefense/quality-assurance.jpg', NULL, 'local', 'services/quality-assurance.jpg', 'image', 'jpg', NULL, NULL, '{}', NOW(), NOW()),
  ('sa-svc-0004-0004-0004-000000000004', NULL, 'secure-logistics.jpg', 'services', 'services/secure-logistics.jpg', 'services', 'image/jpeg', 500000, 1200, 800, '/media/sultandefense/secure-logistics.jpg', NULL, 'local', 'services/secure-logistics.jpg', 'image', 'jpg', NULL, NULL, '{}', NOW(), NOW()),
  ('sa-cat-0001-0001-0001-000000000001', NULL, 'sultandefense-catalog-cover.jpg', 'catalog', 'catalog/sultandefense-catalog-cover.jpg', 'catalog', 'image/jpeg', 500000, 1200, 800, '/media/sultandefense/sultandefense-catalog-cover.jpg', NULL, 'local', 'catalog/sultandefense-catalog-cover.jpg', 'image', 'jpg', NULL, NULL, '{}', NOW(), NOW())
ON DUPLICATE KEY UPDATE
  `name` = VALUES(`name`),
  `bucket` = VALUES(`bucket`),
  `path` = VALUES(`path`),
  `folder` = VALUES(`folder`),
  `url` = VALUES(`url`),
  `provider_public_id` = VALUES(`provider_public_id`),
  `size` = VALUES(`size`),
  `updated_at` = NOW();

COMMIT;
SET FOREIGN_KEY_CHECKS = 1;
