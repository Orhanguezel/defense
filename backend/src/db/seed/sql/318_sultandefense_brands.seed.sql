-- =============================================================
-- FILE: 318_sultandefense_brands.seed.sql
-- Sultan Defense — Anasayfa "is birligi yaptigimiz firmalar" bandi
-- Gercek savunma sanayi markalari (referans satirlarini gunceller).
-- Logolar: backend uploads/brands/*.png (gitignore'da; deploy ile gider)
-- =============================================================
SET NAMES utf8mb4;
UPDATE `references` SET featured_image='/uploads/brands/garanti.png',  website_url='https://www.garantikompozit.com', featured_image_asset_id=NULL WHERE id='ref10001-4001-4001-8001-000000000001';
UPDATE `references` SET featured_image='/uploads/brands/karel.png',    website_url='https://www.karel.com.tr',         featured_image_asset_id=NULL WHERE id='ref10002-4002-4002-8002-000000000002';
UPDATE `references` SET featured_image='/uploads/brands/nurol.png',    website_url='https://www.nurolteknoloji.com.tr',featured_image_asset_id=NULL WHERE id='ref10003-4003-4003-8003-000000000003';
UPDATE `references` SET featured_image='/uploads/brands/savronik.png', website_url='https://www.savronik.com.tr',      featured_image_asset_id=NULL WHERE id='ref10004-4004-4004-8004-000000000004';
UPDATE `references` SET featured_image='/uploads/brands/asisguard.png',website_url='https://www.asisguard.com.tr',     featured_image_asset_id=NULL WHERE id='ref10005-4005-4005-8005-000000000005';
UPDATE `references` SET featured_image='/uploads/brands/milsoft.png',  website_url='https://www.milsoft.com.tr',       featured_image_asset_id=NULL WHERE id='ref10006-4006-4006-8006-000000000006';
UPDATE references_i18n SET title='GARANTİ KOMPOZİT' WHERE reference_id='ref10001-4001-4001-8001-000000000001';
UPDATE references_i18n SET title='KAREL'            WHERE reference_id='ref10002-4002-4002-8002-000000000002';
UPDATE references_i18n SET title='NUROL TEKNOLOJİ'  WHERE reference_id='ref10003-4003-4003-8003-000000000003';
UPDATE references_i18n SET title='SAVRONİK'         WHERE reference_id='ref10004-4004-4004-8004-000000000004';
UPDATE references_i18n SET title='ASİSGUARD'        WHERE reference_id='ref10005-4005-4005-8005-000000000005';
UPDATE references_i18n SET title='MİLSOFT'          WHERE reference_id='ref10006-4006-4006-8006-000000000006';
