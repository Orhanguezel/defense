-- =============================================================
-- FILE: 333_seo_pages_i18n_de_ar_ru.seed.sql
-- Sultan Defense page-level SEO — i18n (de, ar, ru)
-- Key: sultandefense__seo_pages (locale: de, ar, ru)
-- Mirrors 312_sultandefense_seo_pages.seed.sql structure
-- =============================================================

SET NAMES utf8mb4;
SET time_zone = '+00:00';

-- ---------- German (de) ----------
INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES (
  UUID(),
  'sultandefense__seo_pages',
  'de',
  CAST(JSON_OBJECT(
    'home', JSON_OBJECT('title', 'Verteidigungsbeschaffung & taktische Ausrüstung', 'description', 'Sultan Defense liefert taktische Ausrüstung, Militärelektronik, Logistiksysteme und Verteidigungstechnologien über durchgängige Beschaffungsprozesse.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'projeler', JSON_OBJECT('title', 'Verteidigungsproduktkategorien', 'description', 'Entdecken Sie die Kategorien ballistischer Schutz, Kommunikation, Feldlogistik, Marinesysteme, Energielösungen, Überwachung und taktische Textilien.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'hizmetler', JSON_OBJECT('title', 'Verteidigungsbeschaffungsprozess', 'description', 'Strategische Beschaffung, Herstellerkoordination, EUC- und Exportkonformität, Qualitätssicherung und sichere globale Logistik.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'galeri', JSON_OBJECT('title', 'Verteidigungsproduktgalerie', 'description', 'Bilder von Verteidigungs-, Sicherheits-, Logistik- und taktischer Ausrüstung aus dem Beschaffungsnetzwerk von Sultan Defense.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'haberler', JSON_OBJECT('title', 'Nachrichten zur Verteidigungsbeschaffung', 'description', 'Aktuelles zu Verteidigungsbeschaffung, Exportkonformität, Logistik und der türkischen Verteidigungsindustrie.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'hakkimizda', JSON_OBJECT('title', 'Über uns', 'description', 'Über Sultan Defense, seit 1996 ein globaler Partner für Verteidigungsbeschaffung, Beschaffung taktischer Ausrüstung und Exportkonformität.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'iletisim', JSON_OBJECT('title', 'Kontakt', 'description', 'Kontaktieren Sie die Exportspezialisten von Sultan Defense. Büro in Izmir, Telefon- und E-Mail-Informationen.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'teklif', JSON_OBJECT('title', 'Beschaffungsangebot anfordern', 'description', 'Fordern Sie ein offizielles Beschaffungsangebot von Sultan Defense für Ihre Verteidigungs- und Sicherheitsanforderungen an.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'legal_privacy', JSON_OBJECT('title', 'Datenschutzrichtlinie', 'description', 'Datenschutzgrundsätze von Sultan Defense für KVKK/GDPR und die Verarbeitung von B2B-Beschaffungsdaten.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'legal_terms', JSON_OBJECT('title', 'Allgemeine Geschäftsbedingungen', 'description', 'Beschaffungsmodell, Exportkontrollen, EUC-Anforderungen und Website-Nutzungsbedingungen von Sultan Defense.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false)
  ) AS CHAR CHARACTER SET utf8mb4),
  NOW(3), NOW(3)
)
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`), `updated_at` = VALUES(`updated_at`);

-- ---------- Arabic (ar) ----------
INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES (
  UUID(),
  'sultandefense__seo_pages',
  'ar',
  CAST(JSON_OBJECT(
    'home', JSON_OBJECT('title', 'مشتريات الدفاع والمعدات التكتيكية', 'description', 'توفّر Sultan Defense المعدات التكتيكية والإلكترونيات العسكرية وأنظمة اللوجستيات وتقنيات الدفاع من خلال عمليات شراء متكاملة من البداية إلى النهاية.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'projeler', JSON_OBJECT('title', 'فئات المنتجات الدفاعية', 'description', 'استكشف فئات الحماية الباليستية والاتصالات ولوجستيات الميدان والأنظمة البحرية وحلول الطاقة والمراقبة والمنسوجات التكتيكية.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'hizmetler', JSON_OBJECT('title', 'عملية مشتريات الدفاع', 'description', 'التوريد الاستراتيجي والتنسيق مع المصنّعين والامتثال لشهادة المستخدم النهائي EUC وضوابط التصدير وضمان الجودة واللوجستيات العالمية الآمنة.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'galeri', JSON_OBJECT('title', 'معرض المنتجات الدفاعية', 'description', 'صور للمعدات الدفاعية والأمنية واللوجستية والتكتيكية من شبكة المشتريات الخاصة بـ Sultan Defense.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'haberler', JSON_OBJECT('title', 'أخبار مشتريات الدفاع', 'description', 'مستجدات حول مشتريات الدفاع والامتثال للتصدير واللوجستيات وصناعة الدفاع التركية.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'hakkimizda', JSON_OBJECT('title', 'من نحن', 'description', 'تعرّف على Sultan Defense، الشريك العالمي في مشتريات الدفاع وتوريد المعدات التكتيكية والامتثال للتصدير منذ عام 1996.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'iletisim', JSON_OBJECT('title', 'اتصل بنا', 'description', 'تواصل مع خبراء التصدير في Sultan Defense. معلومات مكتب إزمير والهاتف والبريد الإلكتروني.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'teklif', JSON_OBJECT('title', 'اطلب عرض سعر للمشتريات', 'description', 'اطلب عرض سعر رسمي للمشتريات من Sultan Defense لتلبية احتياجاتك الدفاعية والأمنية.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'legal_privacy', JSON_OBJECT('title', 'سياسة الخصوصية', 'description', 'مبادئ الخصوصية لدى Sultan Defense وفق KVKK/GDPR ومعالجة بيانات المشتريات B2B.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'legal_terms', JSON_OBJECT('title', 'الشروط والأحكام', 'description', 'نموذج المشتريات وضوابط التصدير ومتطلبات EUC وشروط استخدام الموقع الخاصة بـ Sultan Defense.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false)
  ) AS CHAR CHARACTER SET utf8mb4),
  NOW(3), NOW(3)
)
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`), `updated_at` = VALUES(`updated_at`);

-- ---------- Russian (ru) ----------
INSERT INTO `site_settings` (`id`, `key`, `locale`, `value`, `created_at`, `updated_at`)
VALUES (
  UUID(),
  'sultandefense__seo_pages',
  'ru',
  CAST(JSON_OBJECT(
    'home', JSON_OBJECT('title', 'Оборонные закупки и тактическое снаряжение', 'description', 'Sultan Defense поставляет тактическое снаряжение, военную электронику, логистические системы и оборонные технологии через сквозные процессы закупок.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'projeler', JSON_OBJECT('title', 'Категории оборонной продукции', 'description', 'Ознакомьтесь с категориями: баллистическая защита, связь, полевая логистика, морские системы, энергетические решения, наблюдение и тактический текстиль.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'hizmetler', JSON_OBJECT('title', 'Процесс оборонных закупок', 'description', 'Стратегические закупки, координация с производителями, соответствие требованиям EUC и экспортному контролю, контроль качества и безопасная глобальная логистика.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'galeri', JSON_OBJECT('title', 'Галерея оборонной продукции', 'description', 'Изображения оборонного, охранного, логистического и тактического снаряжения из закупочной сети Sultan Defense.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'haberler', JSON_OBJECT('title', 'Новости оборонных закупок', 'description', 'Актуальная информация об оборонных закупках, экспортном контроле, логистике и турецкой оборонной промышленности.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'hakkimizda', JSON_OBJECT('title', 'О нас', 'description', 'О компании Sultan Defense — глобальном партнёре в области оборонных закупок, поставки тактического снаряжения и экспортного контроля с 1996 года.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'iletisim', JSON_OBJECT('title', 'Контакты', 'description', 'Свяжитесь со специалистами по экспорту Sultan Defense. Офис в Измире, телефон и электронная почта.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'teklif', JSON_OBJECT('title', 'Запросить коммерческое предложение', 'description', 'Запросите официальное коммерческое предложение на закупку у Sultan Defense для ваших оборонных и охранных задач.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'legal_privacy', JSON_OBJECT('title', 'Политика конфиденциальности', 'description', 'Принципы конфиденциальности Sultan Defense в соответствии с KVKK/GDPR и обработка данных закупок B2B.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false),
    'legal_terms', JSON_OBJECT('title', 'Условия использования', 'description', 'Модель закупок, экспортный контроль, требования EUC и условия использования сайта Sultan Defense.', 'og_image', '/logo/png/sultandefense_logo_512.png', 'no_index', false)
  ) AS CHAR CHARACTER SET utf8mb4),
  NOW(3), NOW(3)
)
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`), `updated_at` = VALUES(`updated_at`);
