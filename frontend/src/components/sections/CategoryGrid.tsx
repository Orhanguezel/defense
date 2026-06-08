'use client';

import type { MouseEvent } from 'react';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
import { ArrowRight } from 'lucide-react';
import { OptimizedImage } from '@/components/ui/OptimizedImage';
import { absoluteAssetUrl } from '@/lib/utils';
import { localizedPath } from '@/seo';
import { GALLERY_IMAGE_PLACEHOLDER } from '@/lib/placeholders';

/** Hedef listeye yumuşak kaydır (sticky header offset için scroll-margin elementte) */
function scrollToList() {
  if (typeof document === 'undefined') return;
  const el = document.getElementById('urun-listesi');
  if (el) el.scrollIntoView({ behavior: 'smooth', block: 'start' });
}

export type CategoryCard = {
  name: string;
  slug: string;
  description?: string;
  image_url?: string;
  alt?: string;
};

type Props = {
  categories: CategoryCard[];
  locale: string;
  heading: string;
  subtitle?: string;
  viewLabel: string;
};

export function CategoryGrid({ categories, locale, heading, subtitle, viewLabel }: Props) {
  const router = useRouter();
  if (!categories.length) return null;

  function handleSelect(e: MouseEvent, href: string) {
    // Aynı sayfada filtreyi uygula + listeye odaklan (sayfa degismedigi icin his veriyoruz)
    e.preventDefault();
    router.push(href, { scroll: false });
    scrollToList();
  }

  return (
    <section style={{ marginTop: 8, marginBottom: 8 }}>
      <h2
        style={{
          fontFamily: 'var(--font-heading)',
          fontSize: 22,
          fontWeight: 800,
          color: 'var(--color-text-primary)',
          margin: '0 0 4px',
        }}
      >
        {heading}
      </h2>
      {subtitle ? (
        <p style={{ fontSize: 14, color: 'var(--color-text-secondary)', margin: '0 0 20px', maxWidth: 760, lineHeight: 1.6 }}>
          {subtitle}
        </p>
      ) : null}

      <div
        style={{
          display: 'grid',
          gap: 16,
          gridTemplateColumns: 'repeat(auto-fill, minmax(240px, 1fr))',
        }}
      >
        {categories.map((cat) => {
          const href = `${localizedPath(locale, '/products')}?category=${encodeURIComponent(cat.name)}`;
          const img = absoluteAssetUrl(cat.image_url) || GALLERY_IMAGE_PLACEHOLDER;
          return (
            <Link
              key={cat.slug || cat.name}
              href={href}
              onClick={(e) => handleSelect(e, href)}
              title={cat.name}
              className="group"
              style={{
                position: 'relative',
                display: 'flex',
                flexDirection: 'column',
                overflow: 'hidden',
                borderLeft: '4px solid var(--color-brand)',
                background: 'var(--color-bg-dark)',
                textDecoration: 'none',
                minHeight: 260,
                boxShadow: '0 10px 30px rgba(0,0,0,0.25)',
              }}
            >
              <span style={{ position: 'relative', display: 'block', height: 150, overflow: 'hidden' }}>
                <OptimizedImage
                  src={img}
                  alt={cat.alt || cat.name}
                  fill
                  sizes="(max-width: 640px) 100vw, (max-width: 1024px) 50vw, 25vw"
                  className="object-cover opacity-80 transition-all duration-500 group-hover:scale-105 group-hover:opacity-100"
                />
                <span
                  aria-hidden="true"
                  style={{
                    position: 'absolute',
                    inset: 0,
                    background: 'linear-gradient(180deg, transparent 40%, var(--color-bg-dark) 100%)',
                  }}
                />
              </span>

              <span style={{ display: 'flex', flex: 1, flexDirection: 'column', padding: '16px 18px 18px' }}>
                <span
                  style={{
                    fontFamily: 'var(--font-heading)',
                    fontSize: 15,
                    fontWeight: 800,
                    lineHeight: 1.25,
                    color: 'var(--section-bg-white)',
                    textTransform: 'uppercase',
                    letterSpacing: '0.03em',
                  }}
                >
                  {cat.name}
                </span>
                {cat.description ? (
                  <span
                    style={{
                      marginTop: 8,
                      fontSize: 12.5,
                      lineHeight: 1.55,
                      color: 'color-mix(in srgb, var(--section-bg-white) 70%, transparent)',
                      display: '-webkit-box',
                      WebkitLineClamp: 2,
                      WebkitBoxOrient: 'vertical',
                      overflow: 'hidden',
                    }}
                  >
                    {cat.description}
                  </span>
                ) : null}
                <span
                  className="group-hover:gap-2"
                  style={{
                    marginTop: 'auto',
                    paddingTop: 14,
                    display: 'inline-flex',
                    alignItems: 'center',
                    gap: 6,
                    fontSize: 10.5,
                    fontWeight: 900,
                    letterSpacing: '0.18em',
                    textTransform: 'uppercase',
                    color: 'var(--color-brand-light)',
                  }}
                >
                  {viewLabel} <ArrowRight className="size-3" />
                </span>
              </span>
            </Link>
          );
        })}
      </div>
    </section>
  );
}
