'use client';

import { useEffect, useRef, useState, useCallback } from 'react';
import Link from 'next/link';
import { ArrowRight } from 'lucide-react';
import { OptimizedImage } from '@/components/ui/OptimizedImage';
import { absoluteAssetUrl } from '@/lib/utils';
import { useTranslations } from 'next-intl';

interface ProjectItem {
  id: string;
  title: string;
  slug: string;
  description?: string;
  image_url?: string;
  count?: number;
  images?: string[];
  category?: { name: string; slug: string };
  specifications?: Record<string, string>;
  tags?: string[];
  created_at?: string;
}

interface ProjectFeedProps {
  initialProjects: ProjectItem[];
  locale: string;
  apiUrl: string;
  backendUrl: string;
  title?: string;
  subtitle?: string;
  sidebarProjects?: ProjectItem[];
  sidebarTitle?: string;
  readMoreLabel?: string;
  extraParams?: string;
}

function localePath(locale: string, path: string): string {
  return `/${locale}${path}`;
}

function stripHtml(value?: string): string {
  if (!value) return '';
  return value.replace(/<[^>]+>/g, ' ').replace(/&nbsp;/g, ' ').replace(/\s+/g, ' ').trim();
}

/**
 * Ürün feed'i — büyük görselli editöryel düzen (haber/blog hissi yok).
 * Tarih ve "kaydet" gibi blog öğeleri kaldırıldı; altın aksanlı premium stil.
 */
export function ProjectFeed({
  initialProjects,
  locale,
  apiUrl,
  title,
  subtitle,
  sidebarProjects,
  sidebarTitle,
  readMoreLabel,
  extraParams,
}: ProjectFeedProps) {
  const t = useTranslations();
  const finalReadMore = readMoreLabel || t('common.readMore');
  const finalSidebarTitle = sidebarTitle || t('projects.loveTitle');
  const [projects, setProjects] = useState<ProjectItem[]>(initialProjects);
  const [loading, setLoading] = useState(false);
  const [hasMore, setHasMore] = useState(true);
  const [page, setPage] = useState(1);
  const sentinelRef = useRef<HTMLDivElement>(null);
  const PAGE_SIZE = 10;

  const loadMore = useCallback(async () => {
    if (loading || !hasMore) return;
    setLoading(true);
    try {
      const res = await fetch(
        `${apiUrl}/products?item_type=sultandefense&is_active=1&locale=${locale}&limit=${PAGE_SIZE}&offset=${page * PAGE_SIZE}${extraParams || ''}`
      );
      if (!res.ok) { setHasMore(false); return; }
      const data = await res.json();
      const items: ProjectItem[] = Array.isArray(data) ? data : data?.items ?? [];
      if (items.length < PAGE_SIZE) setHasMore(false);
      if (items.length > 0) {
        setProjects((prev) => [...prev, ...items]);
        setPage((p) => p + 1);
      } else {
        setHasMore(false);
      }
    } catch {
      setHasMore(false);
    } finally {
      setLoading(false);
    }
  }, [loading, hasMore, page, apiUrl, locale, extraParams]);

  useEffect(() => {
    const el = sentinelRef.current;
    if (!el) return;
    const obs = new IntersectionObserver(
      (entries) => { if (entries[0]?.isIntersecting) loadMore(); },
      { rootMargin: '400px' }
    );
    obs.observe(el);
    return () => obs.disconnect();
  }, [loadMore]);

  return (
    <div className="mx-auto max-w-7xl px-4 lg:px-6">
      {title && (
        <div className="mb-10">
          <div className="flex items-center gap-3">
            <span className="h-7 w-1.5 bg-(--color-brand)" />
            <h2
              className="text-2xl font-black uppercase tracking-[0.06em] text-(--color-text-primary) lg:text-3xl"
              style={{ fontFamily: 'var(--font-heading)' }}
            >
              {title}
            </h2>
          </div>
          {subtitle && (
            <p className="mt-2 pl-4 text-sm text-(--color-text-secondary)">{subtitle}</p>
          )}
        </div>
      )}

      <div className="lg:grid lg:grid-cols-[1fr_340px] lg:gap-12">
        {/* Main feed — büyük görselli editöryel liste */}
        <div className="space-y-14">
          {projects.map((project) => {
            const mainImage = absoluteAssetUrl(project.image_url) || absoluteAssetUrl(project.images?.[0]);
            const specs = project.specifications || {};
            const categoryName = project.category?.name || specs.tip || '';
            const manufacturers = specs.üreticiler || specs.manufacturers || specs.mimarlar || '';
            const desc = stripHtml(project.description);
            const href = localePath(locale, `/urunler/${project.slug}`);

            return (
              <article key={project.id} className="group border-b border-(--color-border) pb-14 last:border-0">
                {/* Görsel önce */}
                {mainImage && (
                  <Link
                    href={href}
                    title={project.title}
                    className="relative block aspect-16/10 overflow-hidden bg-(--color-bg-muted)"
                  >
                    <OptimizedImage
                      src={mainImage}
                      alt={project.title}
                      fill
                      sizes="(max-width: 1024px) 100vw, 720px"
                      className="object-cover transition-transform duration-700 group-hover:scale-[1.03]"
                    />
                    {categoryName && (
                      <span className="absolute left-0 top-5 bg-(--color-brand) px-4 py-1.5 text-[11px] font-black uppercase tracking-[0.18em] text-(--color-on-brand)">
                        {categoryName}
                      </span>
                    )}
                    <span className="absolute inset-x-0 bottom-0 h-1 w-0 bg-(--color-brand) transition-all duration-500 group-hover:w-full" />
                  </Link>
                )}

                {/* Meta + başlık */}
                <div className="mt-6">
                  <Link href={href} title={project.title}>
                    <h2
                      className="text-2xl font-black uppercase leading-tight tracking-[0.04em] text-(--color-text-primary) transition-colors group-hover:text-(--color-brand-text) lg:text-3xl"
                      style={{ fontFamily: 'var(--font-heading)' }}
                    >
                      {project.title}
                    </h2>
                  </Link>

                  {desc && (
                    <p className="mt-3 max-w-3xl text-[15px] leading-relaxed text-(--color-text-secondary)">
                      {desc.length > 220 ? `${desc.slice(0, 220)}…` : desc}
                    </p>
                  )}

                  {manufacturers && (
                    <p className="mt-3 text-xs uppercase tracking-wide text-(--color-text-muted)">
                      {t('projects.manufacturers')}:{' '}
                      <span className="font-semibold text-(--color-brand-text)">{manufacturers}</span>
                    </p>
                  )}

                  <Link
                    href={href}
                    className="mt-5 inline-flex items-center gap-2 border-b-2 border-(--color-brand) pb-1 text-xs font-black uppercase tracking-[0.22em] text-(--color-brand-text) transition-all duration-300 hover:gap-3.5"
                  >
                    {finalReadMore}
                    <ArrowRight className="size-4" />
                  </Link>
                </div>
              </article>
            );
          })}

          {/* Sonsuz scroll sentinel */}
          <div ref={sentinelRef} className="h-px" />
          {loading && (
            <div className="flex justify-center py-8">
              <div className="size-6 animate-spin rounded-full border-2 border-(--color-brand) border-t-transparent" />
            </div>
          )}
        </div>

        {/* Sidebar — desktop */}
        <aside className="mt-12 lg:mt-0 lg:block">
          <div className="sticky top-24 space-y-8">
            {sidebarProjects && sidebarProjects.length > 0 && (
              <div className="border-t-2 border-(--color-brand) pt-5">
                <h3
                  className="mb-5 text-sm font-black uppercase tracking-[0.18em] text-(--color-text-primary)"
                  style={{ fontFamily: 'var(--font-heading)' }}
                >
                  {finalSidebarTitle}
                </h3>
                <div className="space-y-5">
                  {sidebarProjects.map((p) => {
                    const img = absoluteAssetUrl(p.image_url) || absoluteAssetUrl(p.images?.[0]);
                    return (
                      <Link
                        key={p.id}
                        href={localePath(locale, `/urunler/${p.slug}`)}
                        className="group flex gap-4"
                      >
                        {img && (
                          <div className="relative aspect-4/3 w-24 shrink-0 overflow-hidden bg-(--color-bg-muted)">
                            <OptimizedImage
                              src={img}
                              alt={p.title}
                              fill
                              sizes="96px"
                              className="object-cover transition-transform duration-300 group-hover:scale-105"
                            />
                          </div>
                        )}
                        <h4 className="text-sm font-bold uppercase leading-snug tracking-wide text-(--color-text-primary) transition-colors group-hover:text-(--color-brand-text)">
                          {p.title}
                        </h4>
                      </Link>
                    );
                  })}
                </div>
              </div>
            )}

            <div className="border border-(--color-border) bg-(--color-bg-muted) p-6">
              <p
                className="text-sm font-black uppercase tracking-wide text-(--color-text-primary)"
                style={{ fontFamily: 'var(--font-heading)' }}
              >
                {t('projects.getQuoteTitle')}
              </p>
              <p className="mt-2 text-xs leading-relaxed text-(--color-text-secondary)">
                {t('projects.getQuoteDesc')}
              </p>
              <Link
                href={localePath(locale, '/teklif')}
                className="mt-4 inline-block bg-(--color-brand) px-5 py-2.5 text-[11px] font-black uppercase tracking-[0.2em] text-(--color-on-brand) transition-opacity hover:opacity-90"
              >
                {t('nav.offer')}
              </Link>
            </div>
          </div>
        </aside>
      </div>
    </div>
  );
}
