-- =============================================================
-- FILE: 341_products_specs_tags_i18n.seed.sql
-- Sultan Defense — translate product SPECIFICATIONS (keys + values)
-- and TAGS into German (de), Arabic (ar), Russian (ru).
-- Rows already exist in product_i18n (composite PK product_id+locale);
-- this file only UPDATEs specifications + tags for the 10 products.
-- Acronyms/standards kept verbatim: NIJ, ISO 9001, MIL-STD, NATO,
-- EW, EO/IR, MOLLE, C2, UAV, "Sultan Defense".
-- 10 products x 3 locales = 30 UPDATE statements.
-- =============================================================

SET NAMES utf8mb4;

-- =========================================================
-- SD-001 Ballistic Protection
-- =========================================================
UPDATE product_i18n SET specifications=JSON_OBJECT('Lösungen','Taktische Westen, harte Schutzplatten, Helme, Fahrzeugpanzerung','Standards','NIJ, ISO 9001, MIL-STD wo zutreffend','Regionen','Naher Osten, Afrika, Turkrepubliken'), tags=JSON_ARRAY('ballistischer Schutz','Körperpanzerung','NIJ','Helme','Schutzplatten') WHERE product_id='sd000001-7001-4001-9001-dddddddd0001' AND locale='de';
UPDATE product_i18n SET specifications=JSON_OBJECT('الحلول','سترات تكتيكية، ألواح دروع صلبة، خوذات، تدريع المركبات','المعايير','NIJ، ISO 9001، MIL-STD حيثما ينطبق','المناطق','الشرق الأوسط، أفريقيا، الجمهوريات التركية') , tags=JSON_ARRAY('حماية باليستية','دروع واقية للجسم','NIJ','خوذات','ألواح دروع') WHERE product_id='sd000001-7001-4001-9001-dddddddd0001' AND locale='ar';
UPDATE product_i18n SET specifications=JSON_OBJECT('Решения','Тактические жилеты, жёсткие бронепластины, шлемы, бронирование транспорта','Стандарты','NIJ, ISO 9001, MIL-STD где применимо','Регионы','Ближний Восток, Африка, тюркские республики'), tags=JSON_ARRAY('баллистическая защита','бронежилеты','NIJ','шлемы','бронепластины') WHERE product_id='sd000001-7001-4001-9001-dddddddd0001' AND locale='ru';

-- =========================================================
-- SD-002 Communication & Command Electronics
-- =========================================================
UPDATE product_i18n SET specifications=JSON_OBJECT('Lösungen','Manpack-, Handfunk- und Fahrzeugfunkgeräte, Kommandozentralen-Suiten, sichere Gegensprechanlagen','Standards','NATO-Interoperabilität wo zutreffend','Regionen','Logistik mit Schwerpunkt Naher Osten und Afrika'), tags=JSON_ARRAY('taktische Funkgeräte','Führungselektronik','verschlüsselte Kommunikation','EW') WHERE product_id='sd000002-7002-4002-9002-dddddddd0002' AND locale='de';
UPDATE product_i18n SET specifications=JSON_OBJECT('الحلول','أجهزة لاسلكي محمولة ويدوية ومركبية، أنظمة مراكز قيادة، اتصال داخلي آمن','المعايير','قابلية التشغيل البيني مع NATO حيثما ينطبق','المناطق','لوجستيات تركّز على الشرق الأوسط وأفريقيا'), tags=JSON_ARRAY('أجهزة لاسلكي تكتيكية','إلكترونيات القيادة','اتصالات مشفّرة','EW') WHERE product_id='sd000002-7002-4002-9002-dddddddd0002' AND locale='ar';
UPDATE product_i18n SET specifications=JSON_OBJECT('Решения','Носимые, переносные и возимые радиостанции, комплексы командных пунктов, защищённая внутренняя связь','Стандарты','Совместимость с NATO где применимо','Регионы','Логистика с фокусом на Ближний Восток и Африку'), tags=JSON_ARRAY('тактические радиостанции','электроника управления','шифрованная связь','EW') WHERE product_id='sd000002-7002-4002-9002-dddddddd0002' AND locale='ru';

-- =========================================================
-- SD-003 Containerized Field Kitchen
-- =========================================================
UPDATE product_i18n SET specifications=JSON_OBJECT('Lösungen','Mobile Küchen, Bäckereien, Dusch- und Hygieneeinheiten, Kühllager','Bereitstellung','Schnell verlegbare ISO-Container-Konfigurationen','Anwendungsfall','Vorgeschobene Operationsbasen und netzunabhängige Lager'), tags=JSON_ARRAY('Feldküche','containerisierte Einheiten','mobile Bäckerei','Hygiene') WHERE product_id='sd000003-7003-4003-9003-dddddddd0003' AND locale='de';
UPDATE product_i18n SET specifications=JSON_OBJECT('الحلول','مطابخ متنقلة، مخابز، وحدات استحمام ونظافة، تخزين مبرّد','النشر','تكوينات حاويات ISO سريعة الانتشار','حالة الاستخدام','قواعد عمليات متقدمة ومعسكرات خارج الشبكة'), tags=JSON_ARRAY('مطبخ ميداني','وحدات حاوية','مخبز متنقل','نظافة') WHERE product_id='sd000003-7003-4003-9003-dddddddd0003' AND locale='ar';
UPDATE product_i18n SET specifications=JSON_OBJECT('Решения','Мобильные кухни, пекарни, душевые и санитарно-гигиенические модули, холодильные склады','Развёртывание','Быстроразвёртываемые конфигурации ISO-контейнеров','Применение','Передовые оперативные базы и автономные лагеря'), tags=JSON_ARRAY('полевая кухня','контейнерные модули','мобильная пекарня','гигиена') WHERE product_id='sd000003-7003-4003-9003-dddddddd0003' AND locale='ru';

-- =========================================================
-- SD-004 Field Support & Logistics
-- =========================================================
UPDATE product_i18n SET specifications=JSON_OBJECT('Lösungen','Unterkünfte, Verteilungssysteme, Reparaturstationen, Materialumschlag','Lieferung','Sichere Fracht per Luft, Land oder See','Rolle','Kontinuität der Lieferkette für Frontoperationen'), tags=JSON_ARRAY('Feldlogistik','Militärzelte','Wartungswerkstatt','Kraftstoff- und Wassersysteme') WHERE product_id='sd000004-7004-4004-9004-dddddddd0004' AND locale='de';
UPDATE product_i18n SET specifications=JSON_OBJECT('الحلول','مآوي، أنظمة توزيع، محطات إصلاح، مناولة المواد','التسليم','شحن آمن جواً أو براً أو بحراً','الدور','استمرارية سلسلة الإمداد لعمليات الخطوط الأمامية'), tags=JSON_ARRAY('لوجستيات ميدانية','خيام عسكرية','ورشة صيانة','أنظمة الوقود والمياه') WHERE product_id='sd000004-7004-4004-9004-dddddddd0004' AND locale='ar';
UPDATE product_i18n SET specifications=JSON_OBJECT('Решения','Укрытия, системы распределения, ремонтные станции, погрузочно-разгрузочные работы','Доставка','Безопасная перевозка воздушным, наземным или морским транспортом','Роль','Непрерывность цепи поставок для передовых операций'), tags=JSON_ARRAY('полевая логистика','военные палатки','ремонтная мастерская','системы топлива и воды') WHERE product_id='sd000004-7004-4004-9004-dddddddd0004' AND locale='ru';

-- =========================================================
-- SD-005 Naval & Marine Systems
-- =========================================================
UPDATE product_i18n SET specifications=JSON_OBJECT('Lösungen','Radar, EO-Suiten, Marinekommunikation, Sonar, Schiffsschutz','Anwender','Marinestreitkräfte, Küstenwachen, maritime Sicherheitsbehörden','Schwerpunkt','Hafen-, Küsten- und Schiffssicherheit'), tags=JSON_ARRAY('Marinesysteme','maritime Sicherheit','Küstenüberwachung','Sonar') WHERE product_id='sd000005-7005-4005-9005-dddddddd0005' AND locale='de';
UPDATE product_i18n SET specifications=JSON_OBJECT('الحلول','رادار، أنظمة EO، اتصالات بحرية، سونار، حماية السفن','المستخدمون','القوات البحرية، خفر السواحل، وكالات الأمن البحري','التركيز','أمن الموانئ والسواحل والسفن'), tags=JSON_ARRAY('أنظمة بحرية','أمن بحري','مراقبة ساحلية','سونار') WHERE product_id='sd000005-7005-4005-9005-dddddddd0005' AND locale='ar';
UPDATE product_i18n SET specifications=JSON_OBJECT('Решения','Радар, комплексы EO, морская связь, сонар, защита судов','Пользователи','Военно-морские силы, береговая охрана, агентства морской безопасности','Фокус','Безопасность портов, побережья и судов'), tags=JSON_ARRAY('военно-морские системы','морская безопасность','береговое наблюдение','сонар') WHERE product_id='sd000005-7005-4005-9005-dddddddd0005' AND locale='ru';

-- =========================================================
-- SD-006 Power, Battery & Generator
-- =========================================================
UPDATE product_i18n SET specifications=JSON_OBJECT('Lösungen','Dieselgeneratoren, Lithium-Ionen-Batterien, Hybridstromeinheiten, Stromverteilung','Umgebung','Extreme Hitze und abgelegene Feldbedingungen','Auftrag','Kontinuierliche Stromversorgung für Führungs- und Elektroniksysteme'), tags=JSON_ARRAY('Generator','Batterie','militärische Stromversorgung','Hybridstrom') WHERE product_id='sd000006-7006-4006-9006-dddddddd0006' AND locale='de';
UPDATE product_i18n SET specifications=JSON_OBJECT('الحلول','مولّدات ديزل، بطاريات ليثيوم أيون، وحدات طاقة هجينة، توزيع الطاقة','البيئة','حرارة شديدة وظروف ميدانية نائية','المهمة','طاقة مستمرة لأنظمة القيادة والإلكترونيات'), tags=JSON_ARRAY('مولّد','بطارية','طاقة عسكرية','طاقة هجينة') WHERE product_id='sd000006-7006-4006-9006-dddddddd0006' AND locale='ar';
UPDATE product_i18n SET specifications=JSON_OBJECT('Решения','Дизельные генераторы, литий-ионные аккумуляторы, гибридные энергоблоки, распределение энергии','Условия','Экстремальная жара и удалённые полевые условия','Задача','Непрерывное питание для систем управления и электроники'), tags=JSON_ARRAY('генератор','аккумулятор','военное электропитание','гибридное питание') WHERE product_id='sd000006-7006-4006-9006-dddddddd0006' AND locale='ru';

-- =========================================================
-- SD-007 Shield & Riot Control
-- =========================================================
UPDATE product_i18n SET specifications=JSON_OBJECT('Lösungen','Schilde, Anzüge, Helme, Schlagstöcke, Zubehör','Materialien','Polycarbonat- und Schlagtrauma-Schutzsysteme','Anwender','Polizei, Gendarmerie, innere Sicherheitskräfte'), tags=JSON_ARRAY('Schutzschild','Aufstandsbekämpfungsanzug','Strafverfolgung','Menschenmengenkontrolle') WHERE product_id='sd000007-7007-4007-9007-dddddddd0007' AND locale='de';
UPDATE product_i18n SET specifications=JSON_OBJECT('الحلول','دروع، بدلات، خوذات، هراوات، ملحقات','المواد','أنظمة حماية من البولي كربونات ومن الصدمات الكليلة','المستخدمون','الشرطة، الدرك، قوات الأمن الداخلي'), tags=JSON_ARRAY('درع مكافحة الشغب','بدلة مضادة للشغب','إنفاذ القانون','إدارة الحشود') WHERE product_id='sd000007-7007-4007-9007-dddddddd0007' AND locale='ar';
UPDATE product_i18n SET specifications=JSON_OBJECT('Решения','Щиты, костюмы, шлемы, дубинки, аксессуары','Материалы','Поликарбонатные системы защиты от ударных травм','Пользователи','Полиция, жандармерия, силы внутренней безопасности'), tags=JSON_ARRAY('противоударный щит','костюм для разгона беспорядков','правоохранительные органы','управление толпой') WHERE product_id='sd000007-7007-4007-9007-dddddddd0007' AND locale='ru';

-- =========================================================
-- SD-008 Surveillance, Sensors & Security
-- =========================================================
UPDATE product_i18n SET specifications=JSON_OBJECT('Lösungen','Wärmebildkameras, seismische/akustische/Faser-Sensoren, UAV, Radare','Auftrag','Sicherheit von Grenzen, Stützpunkten und kritischer Infrastruktur','Reaktion','Echtzeit-Erkennung und -Überwachung'), tags=JSON_ARRAY('EO/IR','Wärmebildkamera','UAV','Perimetersicherung','Radar') WHERE product_id='sd000008-7008-4008-9008-dddddddd0008' AND locale='de';
UPDATE product_i18n SET specifications=JSON_OBJECT('الحلول','كاميرات حرارية، أجهزة استشعار زلزالية/صوتية/ليفية، طائرات UAV، رادارات','المهمة','أمن الحدود والقواعد والبنية التحتية الحيوية','الاستجابة','كشف ومراقبة آنيان'), tags=JSON_ARRAY('EO/IR','كاميرا حرارية','UAV','أمن المحيط','رادار') WHERE product_id='sd000008-7008-4008-9008-dddddddd0008' AND locale='ar';
UPDATE product_i18n SET specifications=JSON_OBJECT('Решения','Тепловизионные камеры, сейсмические/акустические/волоконные датчики, UAV, радары','Задача','Безопасность границ, баз и критической инфраструктуры','Реагирование','Обнаружение и мониторинг в реальном времени'), tags=JSON_ARRAY('EO/IR','тепловизионная камера','UAV','охрана периметра','радар') WHERE product_id='sd000008-7008-4008-9008-dddddddd0008' AND locale='ru';

-- =========================================================
-- SD-009 Tactical Gear & Textile
-- =========================================================
UPDATE product_i18n SET specifications=JSON_OBJECT('Lösungen','Uniformen, Tragesysteme, Gürtel, Stiefel, Wetterschutzausrüstung','Leistungsfähigkeit','Textilbeschaffung in großen Mengen','Umgebung','Extreme Hitze, Kälte und schwieriges Gelände'), tags=JSON_ARRAY('Kampfuniform','MOLLE','taktische Stiefel','Militärtextil') WHERE product_id='sd000009-7009-4009-9009-dddddddd0009' AND locale='de';
UPDATE product_i18n SET specifications=JSON_OBJECT('الحلول','بدلات، معدات حمل، أحزمة، أحذية، معدات للأحوال الجوية','القدرة','توريد منسوجات بكميات كبيرة','البيئة','حرارة وبرودة شديدتان وتضاريس وعرة'), tags=JSON_ARRAY('بدلة قتالية','MOLLE','أحذية تكتيكية','منسوجات عسكرية') WHERE product_id='sd000009-7009-4009-9009-dddddddd0009' AND locale='ar';
UPDATE product_i18n SET specifications=JSON_OBJECT('Решения','Обмундирование, разгрузочные системы, ремни, ботинки, погодное снаряжение','Возможности','Закупка текстиля в больших объёмах','Условия','Экстремальная жара, холод и пересечённая местность'), tags=JSON_ARRAY('боевая форма','MOLLE','тактические ботинки','военный текстиль') WHERE product_id='sd000009-7009-4009-9009-dddddddd0009' AND locale='ru';

-- =========================================================
-- SD-010 Training & Simulation Software
-- =========================================================
UPDATE product_i18n SET specifications=JSON_OBJECT('Lösungen','Schieß-, Konvoi-, C2-, Flug- und Marinesimulatoren','Nutzen','Geringeres Trainingsrisiko und reduzierte Kosten für scharfen Schuss','Anwender','Verteidigungsakademien und Ausbildungszentren'), tags=JSON_ARRAY('Simulation','Schießausbildung','C2','Trainingssoftware','Planspiel') WHERE product_id='sd000010-7010-4010-9010-dddddddd0010' AND locale='de';
UPDATE product_i18n SET specifications=JSON_OBJECT('الحلول','محاكيات رماية وقوافل وC2 وطيران ومحاكيات بحرية','الفائدة','تقليل مخاطر التدريب وتكلفة الذخيرة الحية','المستخدمون','أكاديميات الدفاع ومراكز التدريب'), tags=JSON_ARRAY('محاكاة','رماية','C2','برمجيات تدريب','ألعاب حرب') WHERE product_id='sd000010-7010-4010-9010-dddddddd0010' AND locale='ar';
UPDATE product_i18n SET specifications=JSON_OBJECT('Решения','Тренажёры стрельбы, колонн, C2, авиационные и военно-морские симуляторы','Выгода','Снижение риска подготовки и затрат на боевую стрельбу','Пользователи','Оборонные академии и учебные центры'), tags=JSON_ARRAY('симуляция','стрелковая подготовка','C2','учебное ПО','военные игры') WHERE product_id='sd000010-7010-4010-9010-dddddddd0010' AND locale='ru';
