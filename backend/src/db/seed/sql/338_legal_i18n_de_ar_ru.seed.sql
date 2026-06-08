-- =============================================================
-- FILE: 338_legal_i18n_de_ar_ru.seed.sql
-- Sultan Defense LEGAL pages — German (de), Arabic (ar), Russian (ru)
-- Translated from the English (en) rows of 305_sultandefense_pages.seed.sql
-- Pages:
--   bc010002 Privacy Policy   -> slug 'privacy'                (de/ar/ru)
--   bc010003 Terms            -> slug 'terms'                  (de/ar/ru)
--   bc010004 Data Notice      -> slug 'kvkk-aydinlatma-metni'  (de/ar/ru)
--   bc010005 Cookie Policy    -> slug 'cookies'                (de/ar/ru)
-- =============================================================

SET NAMES utf8mb4;
SET time_zone = '+00:00';
SET FOREIGN_KEY_CHECKS = 0;

START TRANSACTION;

INSERT INTO `custom_pages_i18n`
(`id`, `page_id`, `locale`, `title`, `slug`, `content`, `summary`, `meta_title`, `meta_description`, `tags`)
VALUES
  -- ===================== PRIVACY POLICY (bc010002) =====================
  (
    UUID(),
    'bc010002-5002-4002-9002-cccccccc0002',
    'de',
    'Datenschutzerklärung',
    'privacy',
    JSON_OBJECT('html', '<p>Die Sultan Defense Ltd., Co. verarbeitet personenbezogene Daten im Einklang mit den Grundsätzen von KVKK und DSGVO. Über diese Website, per E-Mail oder über Angebotsformulare übermittelte Informationen werden ausschließlich für die geschäftliche Kommunikation, die Beschaffungsbewertung und die Angebotsprozesse verwendet.</p><h2>Lieferantenmodell und Datenweitergabe</h2><p>Sultan Defense ist ein Beschaffungspartner im Verteidigungsbereich und kein direkter Hersteller. Bei geprüften Anfragen können technische Anforderungen und relevante Unternehmensinformationen zur Erfüllung der Anfrage an lizenzierte Herstellerpartner weitergegeben werden.</p><h2>Ihre Rechte</h2><p>Sie können Auskunft, Berichtigung, Löschung oder Widerspruch bezüglich Ihrer Daten über export@sultandefense.com beantragen.</p>'),
    'Datenschutzgrundsätze von Sultan Defense für KVKK/DSGVO und B2B-Beschaffungsdaten.',
    'Datenschutzerklärung | Sultan Defense',
    'Datenschutzerklärung von Sultan Defense zur Einhaltung von KVKK/DSGVO und zur Datenweitergabe im Beschaffungsprozess.',
    'datenschutzerklärung, kvkk, dsgvo, verteidigungsbeschaffung'
  ),
  (
    UUID(),
    'bc010002-5002-4002-9002-cccccccc0002',
    'ar',
    'سياسة الخصوصية',
    'privacy',
    JSON_OBJECT('html', '<p>تعالج شركة Sultan Defense Ltd., Co. البيانات الشخصية بما يتوافق مع مبادئ KVKK وGDPR. تُستخدم المعلومات المقدمة عبر هذا الموقع أو البريد الإلكتروني أو نماذج طلب عروض الأسعار حصراً لأغراض التواصل المؤسسي وتقييم التوريد وعمليات تقديم العروض.</p><h2>نموذج التوريد ومشاركة البيانات</h2><p>تُعد Sultan Defense شريك توريد في قطاع الدفاع وليست جهة تصنيع مباشرة. وبالنسبة للاستفسارات المُتحقق منها، قد تتم مشاركة المتطلبات الفنية والمعلومات المؤسسية ذات الصلة مع شركاء التصنيع المرخصين لتلبية الطلب.</p><h2>حقوقك</h2><p>يمكنك طلب الوصول إلى بياناتك أو تصحيحها أو حذفها أو الاعتراض على معالجتها عبر export@sultandefense.com.</p>'),
    'مبادئ الخصوصية لدى Sultan Defense وفق KVKK/GDPR وبيانات التوريد بين الشركات.',
    'سياسة الخصوصية | Sultan Defense',
    'سياسة الخصوصية لدى Sultan Defense تشمل الامتثال لـ KVKK/GDPR ومشاركة بيانات التوريد.',
    'سياسة الخصوصية, kvkk, gdpr, توريد الدفاع'
  ),
  (
    UUID(),
    'bc010002-5002-4002-9002-cccccccc0002',
    'ru',
    'Политика конфиденциальности',
    'privacy',
    JSON_OBJECT('html', '<p>Компания Sultan Defense Ltd., Co. обрабатывает персональные данные в соответствии с принципами KVKK и GDPR. Информация, предоставленная через данный веб-сайт, по электронной почте или через формы запроса предложений, используется исключительно для корпоративной коммуникации, оценки закупок и процессов подготовки предложений.</p><h2>Модель поставок и передача данных</h2><p>Sultan Defense является партнёром по закупкам в оборонной сфере, а не прямым производителем. В рамках проверенных запросов технические требования и соответствующая корпоративная информация могут передаваться лицензированным партнёрам-производителям для выполнения запроса.</p><h2>Ваши права</h2><p>Вы можете запросить доступ к своим данным, их исправление, удаление или возражение против обработки по адресу export@sultandefense.com.</p>'),
    'Принципы конфиденциальности Sultan Defense в отношении KVKK/GDPR и данных закупок B2B.',
    'Политика конфиденциальности | Sultan Defense',
    'Политика конфиденциальности Sultan Defense: соответствие KVKK/GDPR и передача данных в процессе закупок.',
    'политика конфиденциальности, kvkk, gdpr, оборонные закупки'
  ),
  -- ===================== TERMS & CONDITIONS (bc010003) =====================
  (
    UUID(),
    'bc010003-5003-4003-9003-cccccccc0003',
    'de',
    'Allgemeine Geschäftsbedingungen',
    'terms',
    JSON_OBJECT('html', '<p>Mit dem Zugriff auf diese Website erklären Sie sich mit diesen Geschäftsbedingungen einverstanden. Produktabbildungen und technische Angaben dienen ausschließlich der Information und stellen kein verbindliches Angebot, keine technische Spezifikation und keine Ausfuhrgenehmigung dar.</p><h2>Wichtiger Hinweis</h2><p>Sultan Defense agiert als globaler Lieferant, Exportpartner und Beschaffungskoordinator. Wir sind nicht der direkte Hersteller der aufgeführten Produkte. Alle Produkte unterliegen Exportkontrollen, den Anforderungen an das Endverbleibszertifikat (EUC) sowie der einschlägigen rechtlichen Prüfung.</p><h2>Medien und geistiges Eigentum</h2><p>Abbildungen können den jeweiligen Herstellern, Markeninhabern oder lizenzierten Quellen gehören und dienen der Darstellung der Beschaffungskompetenzen.</p>'),
    'Nutzungsbedingungen der Website von Sultan Defense und Haftungsgrenzen der Verteidigungsbeschaffung.',
    'Allgemeine Geschäftsbedingungen | Sultan Defense',
    'Geschäftsbedingungen von Sultan Defense zu Beschaffungsmodell, Exportkontrollen, EUC-Anforderungen und Mediennutzung.',
    'agb, exportkontrolle, euc, verteidigungsbeschaffung'
  ),
  (
    UUID(),
    'bc010003-5003-4003-9003-cccccccc0003',
    'ar',
    'الشروط والأحكام',
    'terms',
    JSON_OBJECT('html', '<p>بدخولك إلى هذا الموقع فإنك توافق على هذه الشروط والأحكام. تُعد صور المنتجات والبيانات الفنية لأغراض المعلومات فقط ولا تشكّل عرض أسعار رسمياً أو مواصفة فنية أو ترخيص تصدير.</p><h2>تنبيه هام</h2><p>تعمل Sultan Defense بصفتها مورّداً عالمياً وشريك تصدير ومنسّق توريد. ولسنا الجهة المصنّعة المباشرة للمنتجات المدرجة. تخضع جميع المنتجات لضوابط التصدير ومتطلبات شهادة المستخدم النهائي والمراجعة القانونية ذات الصلة.</p><h2>الوسائط والملكية الفكرية</h2><p>قد تعود الصور إلى الجهات المصنّعة أو مالكي العلامات التجارية أو المصادر المرخصة المعنية، وتُستخدم لتمثيل قدرات التوريد.</p>'),
    'شروط استخدام موقع Sultan Defense وحدود المسؤولية في توريد الدفاع.',
    'الشروط والأحكام | Sultan Defense',
    'شروط Sultan Defense تشمل نموذج التوريد وضوابط التصدير ومتطلبات شهادة المستخدم النهائي واستخدام الوسائط.',
    'الشروط والأحكام, ضوابط التصدير, euc, توريد الدفاع'
  ),
  (
    UUID(),
    'bc010003-5003-4003-9003-cccccccc0003',
    'ru',
    'Условия использования',
    'terms',
    JSON_OBJECT('html', '<p>Получая доступ к данному веб-сайту, вы соглашаетесь с настоящими условиями использования. Изображения продукции и технические сведения носят информационный характер и не являются официальным предложением, технической спецификацией или экспортной лицензией.</p><h2>Важное уведомление</h2><p>Sultan Defense выступает в качестве глобального поставщика, экспортного партнёра и координатора закупок. Мы не являемся прямым производителем перечисленной продукции. Вся продукция подлежит экспортному контролю, требованиям сертификата конечного пользователя и соответствующей юридической проверке.</p><h2>Медиаматериалы и интеллектуальная собственность</h2><p>Изображения могут принадлежать соответствующим производителям, владельцам брендов или лицензированным источникам и используются для демонстрации возможностей закупок.</p>'),
    'Условия использования сайта Sultan Defense и пределы ответственности в оборонных закупках.',
    'Условия использования | Sultan Defense',
    'Условия Sultan Defense: модель закупок, экспортный контроль, требования сертификата конечного пользователя и использование медиаматериалов.',
    'условия использования, экспортный контроль, euc, оборонные закупки'
  ),
  -- ===================== DATA / PDPL NOTICE (bc010004) =====================
  (
    UUID(),
    'bc010004-5004-4004-9004-cccccccc0004',
    'de',
    'PDPL-Informationsmitteilung',
    'kvkk-aydinlatma-metni',
    JSON_OBJECT('html', '<p>Nach dem türkischen Datenschutzgesetz Nr. 6698 ist die verantwortliche Stelle die Sultan Defense Ltd., Co. Personenbezogene Daten können zur Bearbeitung von Angebots- und Kontaktanfragen, zur technischen Bewertung mit Herstellerpartnern, für Exportkonformitätsprozesse und zur Erfüllung gesetzlicher Pflichten verarbeitet werden.</p><h2>Erhebungsmethoden</h2><p>Daten können über Webformulare, E-Mail, Telefon, Unternehmensunterlagen und amtlichen Schriftverkehr erhoben werden.</p><h2>Antragstellung</h2><p>Für Anträge nach dem PDPL können Sie sich an export@sultandefense.com wenden.</p>'),
    'PDPL-Informationsmitteilung von Sultan Defense und Grundsätze der Datenverarbeitung.',
    'PDPL-Informationsmitteilung | Sultan Defense',
    'PDPL-Informationsmitteilung von Sultan Defense: Verarbeitungszwecke und Kanäle zur Antragstellung.',
    'pdpl, kvkk, datenschutzhinweis'
  ),
  (
    UUID(),
    'bc010004-5004-4004-9004-cccccccc0004',
    'ar',
    'إشعار توضيحي بشأن PDPL',
    'kvkk-aydinlatma-metni',
    JSON_OBJECT('html', '<p>بموجب قانون حماية البيانات الشخصية التركي رقم 6698، فإن المسؤول عن البيانات هو شركة Sultan Defense Ltd., Co. قد تتم معالجة البيانات الشخصية لإدارة طلبات عروض الأسعار والتواصل، وللتقييم الفني مع شركاء التصنيع، ولعمليات الامتثال للتصدير، وللوفاء بالالتزامات القانونية.</p><h2>طرق الجمع</h2><p>قد تُجمع البيانات عبر النماذج الإلكترونية والبريد الإلكتروني والهاتف والمستندات المؤسسية والمراسلات الرسمية.</p><h2>تقديم الطلب</h2><p>يمكنك التواصل عبر export@sultandefense.com لتقديم الطلبات بموجب PDPL.</p>'),
    'إشعار PDPL التوضيحي لدى Sultan Defense ومبادئ معالجة البيانات.',
    'إشعار توضيحي بشأن PDPL | Sultan Defense',
    'إشعار Sultan Defense التوضيحي بشأن PDPL: أغراض المعالجة وقنوات تقديم الطلبات.',
    'pdpl, kvkk, إشعار البيانات الشخصية'
  ),
  (
    UUID(),
    'bc010004-5004-4004-9004-cccccccc0004',
    'ru',
    'Информационное уведомление PDPL',
    'kvkk-aydinlatma-metni',
    JSON_OBJECT('html', '<p>В соответствии с турецким Законом о защите персональных данных № 6698 оператором данных является компания Sultan Defense Ltd., Co. Персональные данные могут обрабатываться для управления запросами на предложения и обращениями, технической оценки с партнёрами-производителями, процессов соблюдения экспортных требований и выполнения правовых обязательств.</p><h2>Способы сбора</h2><p>Данные могут собираться через веб-формы, электронную почту, телефон, корпоративные документы и официальную переписку.</p><h2>Подача обращения</h2><p>Для подачи обращений в рамках PDPL вы можете связаться с нами по адресу export@sultandefense.com.</p>'),
    'Информационное уведомление PDPL от Sultan Defense и принципы обработки данных.',
    'Информационное уведомление PDPL | Sultan Defense',
    'Информационное уведомление Sultan Defense о PDPL: цели обработки и каналы подачи обращений.',
    'pdpl, kvkk, уведомление о персональных данных'
  ),
  -- ===================== COOKIE POLICY (bc010005) =====================
  (
    UUID(),
    'bc010005-5005-4005-9005-cccccccc0005',
    'de',
    'Cookie-Richtlinie',
    'cookies',
    JSON_OBJECT('html', '<p>Sultan Defense kann Cookies für wesentliche Website-Funktionen, Spracheinstellungen, Leistungsmessung und die Erkennung technischer Probleme verwenden.</p><h2>Cookie-Arten</h2><ul><li>Unbedingt erforderliche Cookies</li><li>Präferenz-Cookies</li><li>Analyse- und Leistungs-Cookies</li></ul><p>Sie können Cookies über Ihre Browsereinstellungen verwalten oder löschen.</p>'),
    'Informationen von Sultan Defense zur Cookie-Nutzung und zur Verwaltung von Präferenzen.',
    'Cookie-Richtlinie | Sultan Defense',
    'Cookie-Richtlinie von Sultan Defense zu Cookie-Arten und zur Verwaltung der Browsereinstellungen.',
    'cookie-richtlinie, cookies, analyse'
  ),
  (
    UUID(),
    'bc010005-5005-4005-9005-cccccccc0005',
    'ar',
    'سياسة ملفات تعريف الارتباط',
    'cookies',
    JSON_OBJECT('html', '<p>قد تستخدم Sultan Defense ملفات تعريف الارتباط من أجل الوظائف الأساسية للموقع وتفضيلات اللغة وقياس الأداء واكتشاف المشكلات الفنية.</p><h2>أنواع ملفات تعريف الارتباط</h2><ul><li>ملفات تعريف الارتباط الضرورية</li><li>ملفات تعريف الارتباط الخاصة بالتفضيلات</li><li>ملفات تعريف الارتباط الخاصة بالتحليلات والأداء</li></ul><p>يمكنك إدارة ملفات تعريف الارتباط أو حذفها من خلال إعدادات المتصفح.</p>'),
    'معلومات Sultan Defense حول استخدام ملفات تعريف الارتباط وإدارة التفضيلات.',
    'سياسة ملفات تعريف الارتباط | Sultan Defense',
    'سياسة ملفات تعريف الارتباط لدى Sultan Defense تشمل أنواعها وإدارة تفضيلات المتصفح.',
    'سياسة ملفات تعريف الارتباط, cookies, تحليلات'
  ),
  (
    UUID(),
    'bc010005-5005-4005-9005-cccccccc0005',
    'ru',
    'Политика использования файлов cookie',
    'cookies',
    JSON_OBJECT('html', '<p>Sultan Defense может использовать файлы cookie для основных функций веб-сайта, языковых настроек, измерения производительности и выявления технических проблем.</p><h2>Типы файлов cookie</h2><ul><li>Строго необходимые файлы cookie</li><li>Файлы cookie настроек</li><li>Аналитические файлы cookie и файлы cookie производительности</li></ul><p>Вы можете управлять файлами cookie или удалять их через настройки вашего браузера.</p>'),
    'Информация Sultan Defense об использовании файлов cookie и управлении настройками.',
    'Политика использования файлов cookie | Sultan Defense',
    'Политика Sultan Defense в отношении файлов cookie: типы файлов cookie и управление настройками браузера.',
    'политика cookie, cookies, аналитика'
  )
ON DUPLICATE KEY UPDATE
  `title` = VALUES(`title`),
  `slug` = VALUES(`slug`),
  `content` = VALUES(`content`),
  `summary` = VALUES(`summary`),
  `meta_title` = VALUES(`meta_title`),
  `meta_description` = VALUES(`meta_description`),
  `tags` = VALUES(`tags`),
  `updated_at` = NOW(3);

COMMIT;
SET FOREIGN_KEY_CHECKS = 1;
