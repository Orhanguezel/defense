import Link from 'next/link';
import { getLocale } from 'next-intl/server';
import { BrandCtaPanel } from '@/components/patterns/BrandCtaPanel';
import { SeoIssueBeacon } from '@/components/monitoring/SeoIssueBeacon';
import { FALLBACK_LOCALE } from '@/i18n/locales';

async function detectLocale(): Promise<string> {
  try {
    const locale = await getLocale();
    if (locale) return locale;
  } catch {}
  return FALLBACK_LOCALE;
}

const LABELS: Record<string, { title: string; description: string; cta: string }> = {
  tr: {
    title: 'Sayfa bulunamadı',
    description: 'İstediğiniz sayfa artık mevcut olmayabilir veya yanlış yazılmış olabilir.',
    cta: 'Ana sayfaya dön',
  },
  en: {
    title: 'Page not found',
    description: 'The page you requested may no longer exist or may have been mistyped.',
    cta: 'Go to homepage',
  },
};

export default async function NotFound() {
  const locale = await detectLocale();
  const t = LABELS[locale] || LABELS.en;

  if (!t) return null;

  return (
    <main className="section-py">
      <SeoIssueBeacon type="404" pathname="/404" reason="app-router-not-found" />
      <div className="mx-auto max-w-2xl px-4 text-center lg:px-8">
        <p className="text-sm font-semibold uppercase tracking-[0.2em] text-(--color-brand)">
          404
        </p>
        <div className="mt-6">
          <BrandCtaPanel
            title={t.title}
            description={t.description}
            action={(
              <Link
                href={`/${locale}`}
                className="btn-contrast mt-5 inline-flex rounded-lg px-5 py-3 font-medium transition-colors"
              >
                {t.cta}
              </Link>
            )}
          />
        </div>
      </div>
    </main>
  );
}
