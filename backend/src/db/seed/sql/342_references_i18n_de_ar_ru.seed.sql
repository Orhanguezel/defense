-- Sultan Defense — references_i18n de/ar/ru. Marka adlari ozel isim (GARANTI KOMPOZIT, KAREL...)
-- ceviri gerektirmez; EN satirlari de/ar/ru'ya kopyalanir ki marka bandi her dilde gorunsun.
SET NAMES utf8mb4;

INSERT INTO `references_i18n`
  (id, reference_id, locale, title, slug, summary, content, featured_image_alt, meta_title, meta_description)
SELECT UUID(), reference_id, 'de', title, slug, summary, content, featured_image_alt, meta_title, meta_description
FROM `references_i18n` WHERE locale='en'
ON DUPLICATE KEY UPDATE
  title=VALUES(title), slug=VALUES(slug), summary=VALUES(summary), content=VALUES(content),
  featured_image_alt=VALUES(featured_image_alt), updated_at=NOW(3);

INSERT INTO `references_i18n`
  (id, reference_id, locale, title, slug, summary, content, featured_image_alt, meta_title, meta_description)
SELECT UUID(), reference_id, 'ar', title, slug, summary, content, featured_image_alt, meta_title, meta_description
FROM `references_i18n` WHERE locale='en'
ON DUPLICATE KEY UPDATE
  title=VALUES(title), slug=VALUES(slug), summary=VALUES(summary), content=VALUES(content),
  featured_image_alt=VALUES(featured_image_alt), updated_at=NOW(3);

INSERT INTO `references_i18n`
  (id, reference_id, locale, title, slug, summary, content, featured_image_alt, meta_title, meta_description)
SELECT UUID(), reference_id, 'ru', title, slug, summary, content, featured_image_alt, meta_title, meta_description
FROM `references_i18n` WHERE locale='en'
ON DUPLICATE KEY UPDATE
  title=VALUES(title), slug=VALUES(slug), summary=VALUES(summary), content=VALUES(content),
  featured_image_alt=VALUES(featured_image_alt), updated_at=NOW(3);
