import type { Metadata } from 'next';
import { getTranslations } from 'next-intl/server';
import { ShieldCheck } from 'lucide-react';

import { buildPageMetadata, localizedPath } from '@/seo';
import Link from 'next/link';

const standards = [
  'ISO 9001:2015',
  'AQAP',
  'MIL-STD',
  'NIJ',
  'NATO Stock Number (NSN)',
  'End User Certificate (EUC)',
];

export async function generateMetadata({
  params,
}: {
  params: Promise<{ locale: string }>;
}): Promise<Metadata> {
  const { locale } = await params;
  return buildPageMetadata({
    locale,
    pathname: '/certifications',
    title: 'Quality Standards & Export Compliance',
    description:
      'Sultan Defense coordinates certified manufacturing partners, export documentation, EUC processes and internationally recognized defense standards.',
  });
}

export default async function CertificationsPage({
  params,
}: {
  params: Promise<{ locale: string }>;
}) {
  const { locale } = await params;
  const t = await getTranslations({ locale });
  const isTr = locale.startsWith('tr');

  return (
    <main className="mx-auto max-w-5xl px-4 py-16 lg:px-8">
      <p className="text-xs font-bold uppercase tracking-[0.18em] text-(--color-brand)">
        {isTr ? 'Sertifikalar ve Uyumluluk' : 'Certifications & Compliance'}
      </p>
      <h1 className="mt-4 text-4xl font-bold text-(--color-text-primary)">
        {isTr ? 'Kalite Standartları ve İhracat Uyumluluğu' : 'Quality Standards & Export Compliance'}
      </h1>
      <p className="mt-6 max-w-3xl text-lg leading-8 text-(--color-text-secondary)">
        {isTr
          ? 'Sultan Defense, uluslararası kabul görmüş kalite sistemlerine sahip üretici partnerlerle çalışır ve savunma tedarik süreçlerinde belge, son kullanıcı sertifikası ve ihracat uyumluluğunu koordine eder.'
          : 'Sultan Defense works with manufacturing partners that hold internationally recognized quality systems and coordinates documentation, end-user certificates and export compliance for defense procurement.'}
      </p>

      <div className="mt-10 grid gap-4 sm:grid-cols-2">
        {standards.map((standard) => (
          <div key={standard} className="flex items-center gap-3 border border-(--color-border) bg-(--color-bg-secondary) p-4">
            <ShieldCheck className="size-5 shrink-0 text-(--color-brand)" aria-hidden />
            <span className="font-semibold text-(--color-text-primary)">{standard}</span>
          </div>
        ))}
      </div>

      <section className="mt-12 border-t border-(--color-border) pt-8">
        <h2 className="text-2xl font-bold text-(--color-text-primary)">
          {isTr ? 'Tedarik Sürecinde Kontrol' : 'Control Across Procurement'}
        </h2>
        <p className="mt-4 leading-8 text-(--color-text-secondary)">
          {isTr
            ? 'Sevkiyat öncesinde kalite kontrol, fabrika kabul testleri ve ürün dokümantasyonu üretici partnerlerle birlikte takip edilir. Amaç, NATO, MIL-STD, NIJ ve ilgili ülke regülasyonlarına uygun, izlenebilir teslimat sağlamaktır.'
            : 'Before shipment, quality control, factory acceptance tests and product documentation are followed together with manufacturing partners. The goal is traceable delivery aligned with NATO, MIL-STD, NIJ and destination-country requirements.'}
        </p>
        <Link href={localizedPath(locale, '/request-quote')} className="btn-primary mt-8 inline-flex px-6 py-3 text-sm font-semibold">
          {t('nav.offer')}
        </Link>
      </section>
    </main>
  );
}
