import 'server-only';

import { getTranslations } from 'next-intl/server';
import type { Metadata } from 'next';
import Link from 'next/link';
import { API_BASE_URL } from '@/lib/utils';
import { normalizeRichContent } from '@/lib/rich-content';
import { JsonLd, buildPageMetadata, jsonld, localizedPath, localizedUrl, organizationJsonLd } from '@/seo';
import { Breadcrumbs } from '@/components/seo/Breadcrumbs';

async function fetchCmsPage(locale: string) {
  try {
    const res = await fetch(`${API_BASE_URL}/custom_pages/by-slug/export?locale=${locale}`, {
      next: { revalidate: 300 },
    });
    if (!res.ok) return null;
    return await res.json();
  } catch {
    return null;
  }
}

export async function generateMetadata({
  params,
}: {
  params: Promise<{ locale: string }>;
}): Promise<Metadata> {
  const { locale } = await params;
  const t = await getTranslations({ locale });
  const page = await fetchCmsPage(locale);

  return buildPageMetadata({
    locale,
    pathname: '/export',
    title: page?.meta_title || page?.title || t('export.title'),
    description: page?.meta_description || page?.summary || t('export.metaDescription'),
  });
}

export default async function ExportPage({
  params,
}: {
  params: Promise<{ locale: string }>;
}) {
  const { locale } = await params;
  const t = await getTranslations({ locale });
  const page = await fetchCmsPage(locale);

  const title = page?.title || t('export.title');
  const content = normalizeRichContent(page?.content);

  const breadcrumbs = [
    { label: 'Sultan Defense', href: localizedPath(locale, '/') },
    { label: title },
  ];

  return (
    <>
      <style>{`
        .cms-content{margin-top:24px;font-size:15px;line-height:1.8;color:var(--color-text-secondary);max-width:900px}
        .cms-content p{margin-bottom:16px}
        .cms-content h2,.cms-content h3{font-family:var(--font-heading);color:var(--color-text-primary);margin:32px 0 12px;font-weight:700}
        .cms-content h2{font-size:22px}
        .cms-content h3{font-size:18px}
        .cms-content a{color:var(--color-brand);text-decoration:none}
        .cms-content a:hover{text-decoration:underline}
        .cms-content ul,.cms-content ol{margin:12px 0;padding-left:24px}
        .cms-content li{margin-bottom:8px}
        .cms-content strong{color:var(--color-text-primary)}
      `}</style>

      <JsonLd
        data={jsonld.graph([
          jsonld.org(organizationJsonLd(locale, { description: page?.summary || t('export.metaDescription') })),
          jsonld.breadcrumb(
            breadcrumbs.map((item, idx) => ({
              name: item.label,
              url: idx === 0 ? localizedUrl(locale, '/') : localizedUrl(locale, '/export'),
            })),
          ),
        ])}
      />

      <div style={{ maxWidth: 1024, margin: '0 auto', padding: '16px 16px 72px' }}>
        <Breadcrumbs items={breadcrumbs} />

        <h1
          style={{
            fontFamily: 'var(--font-heading)',
            fontSize: 32,
            fontWeight: 800,
            lineHeight: 1.2,
            color: 'var(--color-text-primary)',
            margin: '16px 0 20px',
          }}
        >
          {title}
        </h1>

        {content ? (
          <div className="cms-content" dangerouslySetInnerHTML={{ __html: content }} />
        ) : (
          <p style={{ fontSize: 17, lineHeight: 1.8, color: 'var(--color-text-secondary)', maxWidth: 800 }}>
            {t('export.lead')}
          </p>
        )}

        <div
          style={{
            marginTop: 48,
            padding: '32px 32px',
            background: 'var(--color-bg-dark)',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'space-between',
            flexWrap: 'wrap',
            gap: 20,
          }}
        >
          <div>
            <h2 style={{ fontFamily: 'var(--font-heading)', fontSize: 22, fontWeight: 700, color: 'var(--color-text-on-dark)', margin: 0 }}>
              {t('common.offerCtaTitle')}
            </h2>
            <p style={{ fontSize: 15, marginTop: 8, maxWidth: 640, color: 'color-mix(in srgb, var(--section-bg-white) 72%, transparent)' }}>
              {t('common.offerCtaDescription')}
            </p>
          </div>
          <Link
            href={localizedPath(locale, '/request-quote')}
            style={{
              padding: '12px 28px',
              background: 'var(--color-brand)',
              color: 'var(--color-on-brand)',
              fontWeight: 700,
              fontSize: 14,
              textTransform: 'uppercase',
              letterSpacing: '0.08em',
              textDecoration: 'none',
              borderRadius: 2,
              whiteSpace: 'nowrap',
            }}
          >
            {t('common.requestOffer')}
          </Link>
        </div>
      </div>
    </>
  );
}
