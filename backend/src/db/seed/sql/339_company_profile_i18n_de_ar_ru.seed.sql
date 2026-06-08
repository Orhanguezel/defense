-- =============================================================
-- FILE: 339_company_profile_i18n_de_ar_ru.seed.sql
-- Sultan Defense — company_profile i18n for DE / AR / RU
-- Adds de, ar, ru rows for key 'sultandefense__company_profile'.
-- company_name kept unchanged; slogan + about translated.
-- Source: 313_sultandefense_general_settings.seed.sql
-- =============================================================

SET NAMES utf8mb4;
SET time_zone = '+00:00';

INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES
  (UUID(), 'sultandefense__company_profile', 'de', CAST(JSON_OBJECT(
    'company_name', 'Sultan Defense Ltd., Co.',
    'slogan', 'Partner für Beschaffung und Export im Verteidigungssektor',
    'about', 'Seit 1996 ist die Sultan Defense Ltd., Co. ein globaler Lieferant und Beschaffungspartner im Verteidigungs- und Militärsektor. Wir verbinden die fortschrittliche Fertigungskapazität der türkischen Verteidigungsindustrie mit den operativen Anforderungen von Streitkräften, Sicherheitsbehörden und staatlichen Einrichtungen weltweit – mit besonderem Fokus auf den Nahen Osten, Afrika und die Turkstaaten.'
  ) AS CHAR CHARACTER SET utf8mb4), NOW(3), NOW(3)),
  (UUID(), 'sultandefense__company_profile', 'ar', CAST(JSON_OBJECT(
    'company_name', 'Sultan Defense Ltd., Co.',
    'slogan', 'شريك التوريد والتصدير في قطاع الدفاع',
    'about', 'تأسست شركة Sultan Defense Ltd., Co. عام 1996، وهي مورّد وشريك توريد عالمي في قطاع الدفاع والمعدات العسكرية. نربط القدرة التصنيعية المتقدمة لصناعة الدفاع التركية بالاحتياجات التشغيلية للقوات المسلحة وأجهزة إنفاذ القانون والهيئات الأمنية حول العالم، مع تركيز خاص على منطقة الشرق الأوسط وأفريقيا والجمهوريات التركية.'
  ) AS CHAR CHARACTER SET utf8mb4), NOW(3), NOW(3)),
  (UUID(), 'sultandefense__company_profile', 'ru', CAST(JSON_OBJECT(
    'company_name', 'Sultan Defense Ltd., Co.',
    'slogan', 'Партнёр по закупкам и экспорту в оборонной сфере',
    'about', 'Компания Sultan Defense Ltd., Co., основанная в 1996 году, является глобальным поставщиком и партнёром по закупкам в оборонном и военном секторе. Мы соединяем передовой производственный потенциал оборонной промышленности Турции с операционными потребностями вооружённых сил, правоохранительных органов и силовых структур по всему миру, уделяя особое внимание Ближнему Востоку, Африке и тюркским республикам.'
  ) AS CHAR CHARACTER SET utf8mb4), NOW(3), NOW(3))
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`), `updated_at` = NOW(3);
