-- =============================================================
-- FILE: 331_categories_i18n_de_ar_ru.seed.sql
-- Sultan Defense product categories i18n (DE / AR / RU)
-- Translations sourced from EN (300_sultandefense_categories.seed.sql)
-- Slugs are kept identical to EN across all locales.
-- =============================================================

SET NAMES utf8mb4;
SET time_zone = '+00:00';
SET FOREIGN_KEY_CHECKS = 0;

START TRANSACTION;

INSERT INTO `category_i18n` (`category_id`, `locale`, `name`, `slug`, `description`)
VALUES
  -- ---------------------------------------------------------
  -- German (de) — formal business
  -- ---------------------------------------------------------
  ('cccc0001-4001-4001-8001-cccccccc0001', 'de', 'Ballistischer Schutz', 'ballistic-protection', 'NIJ-konforme taktische Schutzwesten, harte Panzerungsplatten, Helme und Fahrzeugpanzerungslösungen.'),
  ('cccc0002-4002-4002-8002-cccccccc0002', 'de', 'Kommunikations- und Führungselektronik', 'communication-command-electronics', 'Verschlüsselte Funkgeräte, Integration von Führungszentralen, sichere Gegensprechanlagen und EW-Unterstützungssysteme.'),
  ('cccc0003-4003-4003-8003-cccccccc0003', 'de', 'Containerisierte Feldküchen- und Versorgungseinheiten', 'containerized-field-kitchen', 'Schnell verlegbare mobile Küchen, Bäckereien, Hygienemodule und Kühlcontainer.'),
  ('cccc0004-4004-4004-8004-cccccccc0004', 'de', 'Feldunterstützungslogistik', 'field-support-logistics', 'Taktische Zelte, Kraftstoff- und Wasserverteilung, Feldwerkstätten und robuste Logistikausrüstung.'),
  ('cccc0005-4005-4005-8005-cccccccc0005', 'de', 'Marine- und Schiffssysteme', 'naval-marine-systems', 'Küstenüberwachung, Schiffselektronik, Unterwassersicherheit und Ausrüstung zum Schutz von Schiffen.'),
  ('cccc0006-4006-4006-8006-cccccccc0006', 'de', 'Strom, Batterie und Generator', 'power-battery-generator', 'Militärische Generatoren, Hochleistungsbatterien, Hybrid-Stromaggregate und taktisches Energiemanagement.'),
  ('cccc0007-4007-4007-8007-cccccccc0007', 'de', 'Schild- und Aufruhrkontrolllösungen', 'shield-riot-control', 'Schutzschilde, Schutzanzüge gegen Aufruhr, Helme, Schlagstöcke und professionelle Ausrüstung zur Menschenmengensteuerung.'),
  ('cccc0008-4008-4008-8008-cccccccc0008', 'de', 'Überwachung, Sensoren und Sicherheit', 'surveillance-sensors-security', 'EO/IR-Kameras, Einbruchsensoren, taktische UAV und Bodenüberwachungsradare.'),
  ('cccc0009-4009-4009-8009-cccccccc0009', 'de', 'Taktische Ausrüstung und Textilien', 'tactical-gear-textile', 'Kampfuniformen, MOLLE-Tragesysteme, militärisches Schuhwerk und Ausrüstung für extreme Wetterbedingungen.'),
  ('cccc0010-4010-4010-8010-cccccccc0010', 'de', 'Schulungs- und Simulationssoftware', 'training-simulation-software', 'Schieß-, Konvoi-, C2-, Flug- und Marinesimulationssysteme für eine sicherere Ausbildung.'),
  -- ---------------------------------------------------------
  -- Arabic (ar) — Modern Standard Arabic
  -- ---------------------------------------------------------
  ('cccc0001-4001-4001-8001-cccccccc0001', 'ar', 'الحماية الباليستية', 'ballistic-protection', 'سترات تكتيكية متوافقة مع معيار NIJ، وألواح دروع صلبة، وخوذات، وحلول تدريع المركبات.'),
  ('cccc0002-4002-4002-8002-cccccccc0002', 'ar', 'إلكترونيات الاتصالات والقيادة', 'communication-command-electronics', 'أجهزة لاسلكي مشفّرة، وتكامل مراكز القيادة، وأنظمة اتصال داخلي آمنة، وأنظمة دعم الحرب الإلكترونية EW.'),
  ('cccc0003-4003-4003-8003-cccccccc0003', 'ar', 'مطابخ ميدانية حاوية ووحدات دعم', 'containerized-field-kitchen', 'مطابخ متنقلة سريعة الانتشار، ومخابز، ووحدات نظافة، وحاويات تخزين مبرّد.'),
  ('cccc0004-4004-4004-8004-cccccccc0004', 'ar', 'لوجستيات الدعم الميداني', 'field-support-logistics', 'خيام تكتيكية، وأنظمة توزيع الوقود والماء، وورش ميدانية، ومعدات لوجستية متينة.'),
  ('cccc0005-4005-4005-8005-cccccccc0005', 'ar', 'الأنظمة البحرية', 'naval-marine-systems', 'المراقبة الساحلية، والإلكترونيات البحرية، والأمن تحت الماء، ومعدات حماية السفن.'),
  ('cccc0006-4006-4006-8006-cccccccc0006', 'ar', 'الطاقة والبطاريات والمولّدات', 'power-battery-generator', 'مولّدات عسكرية، وبطاريات عالية الكثافة، ووحدات طاقة هجينة، وإدارة طاقة تكتيكية.'),
  ('cccc0007-4007-4007-8007-cccccccc0007', 'ar', 'حلول الدروع ومكافحة الشغب', 'shield-riot-control', 'دروع مكافحة الشغب، وبدلات مضادة للشغب، وخوذات، وهراوات، ومعدات احترافية لإدارة الحشود.'),
  ('cccc0008-4008-4008-8008-cccccccc0008', 'ar', 'المراقبة وأجهزة الاستشعار والأمن', 'surveillance-sensors-security', 'كاميرات EO/IR، وأجهزة استشعار التسلل، وطائرات UAV التكتيكية، ورادارات المراقبة الأرضية.'),
  ('cccc0009-4009-4009-8009-cccccccc0009', 'ar', 'المعدات التكتيكية والمنسوجات', 'tactical-gear-textile', 'بزّات قتالية، وأنظمة حمل MOLLE، وأحذية عسكرية، ومعدات للأحوال الجوية القاسية.'),
  ('cccc0010-4010-4010-8010-cccccccc0010', 'ar', 'برمجيات التدريب والمحاكاة', 'training-simulation-software', 'أنظمة محاكاة للرماية والأرتال والقيادة والسيطرة C2 والطيران والعمليات البحرية لتدريب أكثر أماناً.'),
  -- ---------------------------------------------------------
  -- Russian (ru) — professional
  -- ---------------------------------------------------------
  ('cccc0001-4001-4001-8001-cccccccc0001', 'ru', 'Баллистическая защита', 'ballistic-protection', 'Тактические бронежилеты по стандарту NIJ, жёсткие бронепластины, шлемы и решения для бронирования техники.'),
  ('cccc0002-4002-4002-8002-cccccccc0002', 'ru', 'Связь и электроника управления', 'communication-command-electronics', 'Шифрованные радиостанции, интеграция командных пунктов, защищённая внутренняя связь и системы поддержки EW.'),
  ('cccc0003-4003-4003-8003-cccccccc0003', 'ru', 'Контейнерные полевые кухни и модули обеспечения', 'containerized-field-kitchen', 'Быстроразвёртываемые мобильные кухни, пекарни, гигиенические модули и рефрижераторные контейнеры.'),
  ('cccc0004-4004-4004-8004-cccccccc0004', 'ru', 'Логистика полевого обеспечения', 'field-support-logistics', 'Тактические палатки, системы распределения топлива и воды, полевые мастерские и прочное логистическое оборудование.'),
  ('cccc0005-4005-4005-8005-cccccccc0005', 'ru', 'Военно-морские и морские системы', 'naval-marine-systems', 'Береговое наблюдение, морская электроника, подводная безопасность и оборудование для защиты судов.'),
  ('cccc0006-4006-4006-8006-cccccccc0006', 'ru', 'Электропитание, аккумуляторы и генераторы', 'power-battery-generator', 'Военные генераторы, аккумуляторы высокой ёмкости, гибридные энергоустановки и тактическое управление электропитанием.'),
  ('cccc0007-4007-4007-8007-cccccccc0007', 'ru', 'Щиты и средства подавления беспорядков', 'shield-riot-control', 'Противоударные щиты, противоударные костюмы, шлемы, дубинки и профессиональное снаряжение для управления толпой.'),
  ('cccc0008-4008-4008-8008-cccccccc0008', 'ru', 'Наблюдение, датчики и безопасность', 'surveillance-sensors-security', 'Камеры EO/IR, датчики проникновения, тактические UAV и радары наземного наблюдения.'),
  ('cccc0009-4009-4009-8009-cccccccc0009', 'ru', 'Тактическое снаряжение и текстиль', 'tactical-gear-textile', 'Боевая форма, разгрузочные системы MOLLE, военная обувь и снаряжение для экстремальных погодных условий.'),
  ('cccc0010-4010-4010-8010-cccccccc0010', 'ru', 'Программное обеспечение для обучения и моделирования', 'training-simulation-software', 'Системы моделирования стрельбы, конвоев, C2, полётов и военно-морских операций для более безопасной подготовки.')
ON DUPLICATE KEY UPDATE
  `name` = VALUES(`name`),
  `slug` = VALUES(`slug`),
  `description` = VALUES(`description`);

COMMIT;
SET FOREIGN_KEY_CHECKS = 1;
