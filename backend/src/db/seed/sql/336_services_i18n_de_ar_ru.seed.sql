-- =============================================================
-- FILE: 336_services_i18n_de_ar_ru.seed.sql
-- Sultan Defense services i18n — German (de), Arabic (ar), Russian (ru)
-- Translated from the EN rows of 310_sultandefense_services.seed.sql
-- slug kept IDENTICAL to the EN row for every locale
-- =============================================================

SET NAMES utf8mb4;
SET time_zone = '+00:00';

INSERT INTO services_i18n
(service_id, locale, title, slug, description, content, alt, tags, meta_title, meta_description)
VALUES
  -- ---------------------------------------------------------------------------
  -- Service 1 — Strategic Sourcing & Manufacturer Liaison
  -- ---------------------------------------------------------------------------
  ('sv010001-0001-4001-9001-000000000001', 'de', 'Strategische Beschaffung & Hersteller-Liaison', 'strategic-sourcing',
   'Wir identifizieren lizenzierte türkische Rüstungshersteller, die zu Ihren operativen Anforderungen und technischen Spezifikationen passen.',
   '<p>Sultan Defense ist kein direkter Hersteller; wir sind der Beschaffungspartner, der einen schnellen und zuverlässigen Zugang zu den richtigen Herstellern bietet. Wir analysieren die Anforderungen, gleichen technische Spezifikationen mit qualifizierten Produktionskapazitäten ab und koordinieren den offiziellen Angebotsprozess mit einem starken Fokus auf das Preis-Leistungs-Verhältnis.</p>',
   'Strategische Rüstungsbeschaffung', '["defense procurement","manufacturer liaison","technical matching"]',
   'Strategische Beschaffung | Sultan Defense',
   'Abgleich lizenzierter Hersteller und strategische Beschaffung für die Beschaffung von Verteidigungsausrüstung.'),
  ('sv010001-0001-4001-9001-000000000001', 'ar', 'التوريد الاستراتيجي والتنسيق مع المصنّعين', 'strategic-sourcing',
   'نحدّد مصنّعي الصناعات الدفاعية الأتراك المرخّصين الذين يلبّون احتياجاتكم التشغيلية ومواصفاتكم الفنية.',
   '<p>Sultan Defense ليست جهة تصنيع مباشرة؛ بل نحن شريك التوريد الذي يوفّر وصولاً سريعاً وموثوقاً إلى المصنّعين المناسبين. نحلّل المتطلبات، ونطابق المواصفات الفنية مع القدرات الإنتاجية المؤهلة، وننسّق عملية تقديم العروض الرسمية مع التركيز القوي على توازن السعر والأداء.</p>',
   'التوريد الدفاعي الاستراتيجي', '["defense procurement","manufacturer liaison","technical matching"]',
   'التوريد الاستراتيجي | Sultan Defense',
   'مطابقة المصنّعين المرخّصين والتوريد الاستراتيجي لشراء المعدات الدفاعية.'),
  ('sv010001-0001-4001-9001-000000000001', 'ru', 'Стратегические закупки и взаимодействие с производителями', 'strategic-sourcing',
   'Мы определяем лицензированных турецких производителей оборонной продукции, соответствующих вашим оперативным потребностям и техническим требованиям.',
   '<p>Sultan Defense не является прямым производителем; мы являемся партнёром по закупкам, обеспечивающим быстрый и надёжный доступ к нужным производителям. Мы анализируем требования, сопоставляем технические спецификации с квалифицированными производственными возможностями и координируем официальный процесс подготовки коммерческого предложения с упором на оптимальное соотношение цены и качества.</p>',
   'Стратегические оборонные закупки', '["defense procurement","manufacturer liaison","technical matching"]',
   'Стратегические закупки | Sultan Defense',
   'Подбор лицензированных производителей и стратегические закупки для приобретения оборонной техники.'),

  -- ---------------------------------------------------------------------------
  -- Service 2 — Export Compliance & EUC Management
  -- ---------------------------------------------------------------------------
  ('sv010001-0001-4001-9001-000000000002', 'de', 'Exportkonformität & EUC-Management', 'export-compliance-euc',
   'Wir koordinieren Endverbleibserklärungen (EUC), Exportgenehmigungen und regulatorische Abläufe mit einem Compliance-First-Ansatz.',
   '<p>Der internationale Rüstungshandel erfordert eine strenge Dokumentation und rechtliche Prüfung. Sultan Defense steuert die Abläufe für die Endverbleibserklärung (EUC), die Koordination türkischer Exportgenehmigungen sowie die Anforderungen an die Versandkonformität transparent und nachvollziehbar.</p>',
   'Exportkonformität und EUC-Management', '["euc","export permit","compliance","defense export"]',
   'Exportkonformität & EUC-Management | Sultan Defense',
   'Koordination von EUC, Exportgenehmigungen und regulatorischer Konformität für die Verteidigungsbeschaffung.'),
  ('sv010001-0001-4001-9001-000000000002', 'ar', 'الامتثال للتصدير وإدارة شهادة المستخدم النهائي (EUC)', 'export-compliance-euc',
   'ننسّق شهادات المستخدم النهائي (EUC) وتصاريح التصدير وسير العمل التنظيمي باتباع نهج يضع الامتثال أولاً.',
   '<p>تتطلب تجارة العتاد العسكري الدولية توثيقاً صارماً ومراجعة قانونية دقيقة. تدير Sultan Defense سير عمل شهادة المستخدم النهائي (EUC)، وتنسيق تصاريح التصدير التركية، ومتطلبات الامتثال للشحن بشفافية وقابلية للتتبّع.</p>',
   'الامتثال للتصدير وإدارة شهادة المستخدم النهائي', '["euc","export permit","compliance","defense export"]',
   'الامتثال للتصدير وإدارة EUC | Sultan Defense',
   'تنسيق شهادة المستخدم النهائي وتصاريح التصدير والامتثال التنظيمي لشراء المعدات الدفاعية.'),
  ('sv010001-0001-4001-9001-000000000002', 'ru', 'Экспортный комплаенс и управление сертификатами конечного пользователя (EUC)', 'export-compliance-euc',
   'Мы координируем сертификаты конечного пользователя (EUC), экспортные разрешения и нормативные процедуры с приоритетом соблюдения требований.',
   '<p>Международная торговля военной продукцией требует строгой документации и юридической экспертизы. Sultan Defense управляет процедурами оформления сертификата конечного пользователя (EUC), координацией турецких экспортных разрешений и требованиями к соответствию при отгрузке с обеспечением прозрачности и прослеживаемости.</p>',
   'Экспортный комплаенс и управление EUC', '["euc","export permit","compliance","defense export"]',
   'Экспортный комплаенс и управление EUC | Sultan Defense',
   'Координация EUC, экспортных разрешений и нормативного соответствия для оборонных закупок.'),

  -- ---------------------------------------------------------------------------
  -- Service 3 — Quality Assurance & Factory Acceptance
  -- ---------------------------------------------------------------------------
  ('sv010001-0001-4001-9001-000000000003', 'de', 'Qualitätssicherung & Werksabnahme', 'quality-assurance-factory-acceptance',
   'Wir koordinieren Qualitätskontrolle, Konformitätsprüfungen und Werksabnahmeprozesse vor dem Versand.',
   '<p>Die operative Eignung ist für jeden Beschaffungsartikel entscheidend. Sultan Defense koordiniert mit den Fertigungspartnern die Qualitätskontrolle (QC), die Werksabnahmeprüfungen (FAT) sowie die Verpackungs- und Dokumentationsprüfungen. Die Anforderungen von NATO, AQAP, MIL-STD, NIJ und ISO 9001 werden, soweit zutreffend, berücksichtigt.</p>',
   'Qualitätssicherung und Werksabnahme', '["quality control","fat","aqap","mil-std","iso 9001"]',
   'Qualitätssicherung & Werksabnahme | Sultan Defense',
   'Qualitätskontrolle, FAT und Normkonformität für die Verteidigungsbeschaffung.'),
  ('sv010001-0001-4001-9001-000000000003', 'ar', 'ضمان الجودة والقبول في المصنع', 'quality-assurance-factory-acceptance',
   'ننسّق مراقبة الجودة وفحوصات المطابقة وإجراءات القبول في المصنع قبل الشحن.',
   '<p>تُعدّ الملاءمة التشغيلية أمراً بالغ الأهمية لكل بند توريد. تنسّق Sultan Defense مع الشركاء المصنّعين مراقبة الجودة (QC)، واختبارات القبول في المصنع (FAT)، وفحوصات التغليف والتوثيق. وتُراعى متطلبات NATO وAQAP وMIL-STD وNIJ وISO 9001 حيثما انطبق ذلك.</p>',
   'ضمان الجودة والقبول في المصنع', '["quality control","fat","aqap","mil-std","iso 9001"]',
   'ضمان الجودة والقبول في المصنع | Sultan Defense',
   'تنسيق مراقبة الجودة واختبارات القبول في المصنع والمطابقة للمعايير لشراء المعدات الدفاعية.'),
  ('sv010001-0001-4001-9001-000000000003', 'ru', 'Контроль качества и заводская приёмка', 'quality-assurance-factory-acceptance',
   'Мы координируем контроль качества, проверки соответствия и процедуры заводской приёмки перед отгрузкой.',
   '<p>Эксплуатационная пригодность критически важна для каждой позиции закупки. Sultan Defense координирует с производственными партнёрами контроль качества (QC), заводские приёмочные испытания (FAT), а также проверки упаковки и документации. Требования NATO, AQAP, MIL-STD, NIJ и ISO 9001 учитываются в применимых случаях.</p>',
   'Контроль качества и заводская приёмка', '["quality control","fat","aqap","mil-std","iso 9001"]',
   'Контроль качества и заводская приёмка | Sultan Defense',
   'Координация контроля качества, FAT и соответствия стандартам для оборонных закупок.'),

  -- ---------------------------------------------------------------------------
  -- Service 4 — Global Logistics & Secure Delivery
  -- ---------------------------------------------------------------------------
  ('sv010001-0001-4001-9001-000000000004', 'de', 'Globale Logistik & Sichere Lieferung', 'global-logistics-secure-delivery',
   'Wir planen eine sichere, nachverfolgbare und regionsgerechte Lieferung von militärischer Fracht auf dem Luft-, Land- oder Seeweg.',
   '<p>Transporte von Verteidigungsausrüstung in den Nahen Osten, nach Afrika und in die Turkrepubliken erfordern Routenerfahrung und dokumentarische Disziplin. Sultan Defense vereint die Auswahl des Transportwegs, die Dokumentensätze, die Verpackung, die Versicherung und die Lieferkoordination in einem einzigen Arbeitsablauf.</p>',
   'Globale Logistik und sichere Lieferung', '["military logistics","secure shipment","air freight","sea freight"]',
   'Globale Logistik & Sichere Lieferung | Sultan Defense',
   'Sichere Luft-, Land- und Seelogistik für die Beschaffung von Verteidigungsausrüstung.'),
  ('sv010001-0001-4001-9001-000000000004', 'ar', 'الخدمات اللوجستية العالمية والتسليم الآمن', 'global-logistics-secure-delivery',
   'نخطّط لتسليم آمن وقابل للتتبّع ومراعٍ لخصوصية كل منطقة للشحنات العسكرية جواً أو براً أو بحراً.',
   '<p>تتطلب شحنات المعدات الدفاعية عبر الشرق الأوسط وأفريقيا والجمهوريات التركية خبرة بالمسارات وانضباطاً في التوثيق. تجمع Sultan Defense بين اختيار وسيلة النقل، ومجموعات المستندات، والتغليف، والتأمين، وتنسيق التسليم في سير عمل واحد.</p>',
   'الخدمات اللوجستية العالمية والتسليم الآمن', '["military logistics","secure shipment","air freight","sea freight"]',
   'الخدمات اللوجستية العالمية والتسليم الآمن | Sultan Defense',
   'تنسيق لوجستي آمن جواً وبراً وبحراً لشراء المعدات الدفاعية.'),
  ('sv010001-0001-4001-9001-000000000004', 'ru', 'Глобальная логистика и безопасная доставка', 'global-logistics-secure-delivery',
   'Мы планируем безопасную, отслеживаемую и учитывающую особенности региона доставку военных грузов воздушным, наземным или морским транспортом.',
   '<p>Перевозки оборонной техники на Ближний Восток, в Африку и тюркские республики требуют опыта работы с маршрутами и дисциплины в оформлении документов. Sultan Defense объединяет выбор вида транспорта, комплекты документов, упаковку, страхование и координацию доставки в едином рабочем процессе.</p>',
   'Глобальная логистика и безопасная доставка', '["military logistics","secure shipment","air freight","sea freight"]',
   'Глобальная логистика и безопасная доставка | Sultan Defense',
   'Координация безопасной воздушной, наземной и морской логистики для оборонных закупок.')
ON DUPLICATE KEY UPDATE
  title            = VALUES(title),
  slug             = VALUES(slug),
  description      = VALUES(description),
  content          = VALUES(content),
  alt              = VALUES(alt),
  tags             = VALUES(tags),
  meta_title       = VALUES(meta_title),
  meta_description = VALUES(meta_description);
