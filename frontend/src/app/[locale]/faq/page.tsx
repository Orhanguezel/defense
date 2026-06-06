import type { Metadata } from 'next';
import { getTranslations } from 'next-intl/server';

import { buildPageMetadata, localizedPath } from '@/seo';
import Link from 'next/link';

const faqEn = [
  {
    q: 'What does Sultan Defense supply?',
    a: 'Sultan Defense supplies defense and tactical equipment through certified manufacturing partners, covering ballistic protection, command electronics, field logistics, naval systems, power solutions, riot control, surveillance, tactical textiles and simulation software.',
  },
  {
    q: 'Is Sultan Defense a manufacturer?',
    a: 'No. Sultan Defense is a B2B procurement and export partner. The company coordinates sourcing, documentation, quality follow-up and delivery through approved manufacturers.',
  },
  {
    q: 'How can we request an official quotation?',
    a: 'Send your requirement list, quantity, destination country and organization credentials to export@sultandefense.com or contact +90 545 552 75 35.',
  },
  {
    q: 'Which regions do you serve?',
    a: 'The primary focus is the Middle East, Africa and the Turkic Republics, with project-based support for qualified international buyers.',
  },
];

const faqTr = [
  {
    q: 'Sultan Defense hangi ürünleri tedarik eder?',
    a: 'Sultan Defense; balistik koruma, komuta elektroniği, saha lojistiği, deniz sistemleri, güç çözümleri, çevik kuvvet ekipmanları, gözetleme sistemleri, taktik tekstil ve simülasyon yazılımlarını sertifikalı üretici partnerler üzerinden tedarik eder.',
  },
  {
    q: 'Sultan Defense üretici midir?',
    a: 'Hayır. Sultan Defense, B2B savunma tedarik ve ihracat partneridir. Onaylı üreticiler üzerinden kaynak bulma, dokümantasyon, kalite takibi ve teslimat koordinasyonu sağlar.',
  },
  {
    q: 'Resmi teklif nasıl talep edilir?',
    a: 'İhtiyaç listenizi, adetleri, hedef ülkeyi ve kurum bilgilerinizi export@sultandefense.com adresine iletebilir veya +90 545 552 75 35 hattından ekibe ulaşabilirsiniz.',
  },
  {
    q: 'Hangi bölgelere hizmet veriyorsunuz?',
    a: 'Öncelikli odak Orta Doğu, Afrika ve Türk Cumhuriyetleri olup, uygun uluslararası alıcılar için proje bazlı destek sağlanır.',
  },
];

export async function generateMetadata({
  params,
}: {
  params: Promise<{ locale: string }>;
}): Promise<Metadata> {
  const { locale } = await params;
  return buildPageMetadata({
    locale,
    pathname: '/faq',
    title: 'Frequently Asked Questions',
    description: 'Answers about Sultan Defense procurement, export compliance, quotations and regional defense supply support.',
  });
}

export default async function FaqPage({ params }: { params: Promise<{ locale: string }> }) {
  const { locale } = await params;
  const t = await getTranslations({ locale });
  const items = locale.startsWith('tr') ? faqTr : faqEn;

  return (
    <main className="mx-auto max-w-4xl px-4 py-16 lg:px-8">
      <p className="text-xs font-bold uppercase tracking-[0.18em] text-(--color-brand)">FAQ</p>
      <h1 className="mt-4 text-4xl font-bold text-(--color-text-primary)">
        {locale.startsWith('tr') ? 'Sık Sorulan Sorular' : 'Frequently Asked Questions'}
      </h1>
      <div className="mt-10 divide-y divide-(--color-border) border-y border-(--color-border)">
        {items.map((item) => (
          <section key={item.q} className="py-6">
            <h2 className="text-xl font-bold text-(--color-text-primary)">{item.q}</h2>
            <p className="mt-3 leading-8 text-(--color-text-secondary)">{item.a}</p>
          </section>
        ))}
      </div>
      <Link href={localizedPath(locale, '/teklif')} className="btn-primary mt-10 inline-flex px-6 py-3 text-sm font-semibold">
        {t('nav.offer')}
      </Link>
    </main>
  );
}
