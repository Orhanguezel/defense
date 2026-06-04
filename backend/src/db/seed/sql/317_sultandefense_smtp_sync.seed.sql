-- =============================================================
-- FILE: 317_sultandefense_smtp_sync.seed.sql
-- Sultan Defense — Sync SMTP settings with .env defaults
-- =============================================================

SET NAMES utf8mb4;
SET time_zone = '+00:00';

START TRANSACTION;

-- =============================================================
-- SMTP SETTINGS — global (locale='*')
-- =============================================================
INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES 
(UUID(), 'smtp_host', '*', 'smtp.example.com', NOW(3), NOW(3)),
(UUID(), 'smtp_port', '*', '465', NOW(3), NOW(3)),
(UUID(), 'smtp_username', '*', 'info@sultandefense.com', NOW(3), NOW(3)),
(UUID(), 'smtp_password', '*', 'change-me-in-admin', NOW(3), NOW(3)),
(UUID(), 'smtp_from_email', '*', 'info@sultandefense.com', NOW(3), NOW(3)),
(UUID(), 'smtp_from_name', '*', 'Sultan Defense', NOW(3), NOW(3)),
(UUID(), 'smtp_ssl', '*', 'true', NOW(3), NOW(3))
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`), `updated_at` = VALUES(`updated_at`);

COMMIT;
