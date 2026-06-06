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
  return value
    .replace(/<[^>]+>/g, ' ')
    .replace(/&nbsp;/g, ' ')
    .replace(/\s+/g, ' ')
    .trim();
}

/**
 * Ürün katalog feed'i — defans ürünleri kart grid'i olarak gösterir
 * (blog/haber formatı değil). Sonsuz scroll ile sayfalama korunur.
 */
export function ProjectFeed({
  initialProjects,
  locale,
  apiUrl,
  title,
  subtitle,
  readMoreLabel,
  extraParams,
}: ProjectFeedProps) {
  const t = useTranslations();
  const finalReadMore = readMoreLabel || t('common.readMore');
  const [projects, setProjects] = useState<ProjectItem[]>(initialProjects);
  const [loading, setLoading] = useState(false);
  const [hasMore, setHasMore] = useState(true);
  const [page, setPage] = useState(1);
  const sentinelRef = useRef<HTMLDivElement>(null);
  const PAGE_SIZE = 12;

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
        <div className="mb-8">
          <h2
            className="text-2xl font-bold text-(--color-text-primary) lg:text-3xl"
            style={{ fontFamily: 'var(--font-heading)' }}
          >
            {title}
          </h2>
          {subtitle && (
            <p className="mt-2 text-sm text-(--color-text-secondary)">{subtitle}</p>
          )}
        </div>
      )}

      {/* Ürün kart grid'i */}
      <div className="grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-3">
        {projects.map((project) => {
          const img = absoluteAssetUrl(project.image_url) || absoluteAssetUrl(project.images?.[0]);
          const categoryName = project.category?.name || project.specifications?.tip || '';
          const desc = stripHtml(project.description);
          const href = localePath(locale, `/urunler/${project.slug}`);

          return (
            <article
              key={project.id}
              className="group flex flex-col overflow-hidden border border-(--color-border) bg-(--color-bg-secondary) transition-all duration-300 hover:-translate-y-1 hover:border-(--color-brand) hover:shadow-2xl"
            >
              <Link
                href={href}
                title={project.title}
                className="relative block aspect-4/3 overflow-hidden bg-(--color-bg-muted)"
              >
                {img && (
                  <OptimizedImage
                    src={img}
                    alt={project.title}
                    fill
                    sizes="(max-width: 640px) 100vw, (max-width: 1024px) 50vw, 400px"
                    className="object-cover transition-transform duration-500 group-hover:scale-105"
                  />
                )}
                {categoryName && (
                  <span className="absolute left-0 top-4 bg-(--color-brand) px-3 py-1 text-[10px] font-black uppercase tracking-[0.15em] text-(--color-on-brand)">
                    {categoryName}
                  </span>
                )}
                <span className="absolute inset-x-0 bottom-0 h-1 bg-(--color-brand) opacity-0 transition-opacity duration-300 group-hover:opacity-100" />
              </Link>

              <div className="flex flex-1 flex-col p-5 lg:p-6">
                <h3
                  className="line-clamp-2 text-base font-bold uppercase leading-snug tracking-wide text-(--color-text-primary) transition-colors group-hover:text-(--color-brand-text) lg:text-lg"
                  style={{ fontFamily: 'var(--font-heading)' }}
                >
                  <Link href={href} title={project.title}>{project.title}</Link>
                </h3>
                {desc && (
                  <p className="mt-2 line-clamp-2 text-sm leading-relaxed text-(--color-text-secondary)">
                    {desc}
                  </p>
                )}
                <Link
                  href={href}
                  className="mt-4 inline-flex items-center gap-1.5 text-[11px] font-black uppercase tracking-[0.2em] text-(--color-brand-text) transition-all duration-300 group-hover:gap-3"
                >
                  {finalReadMore}
                  <ArrowRight className="size-3.5" />
                </Link>
              </div>
            </article>
          );
        })}
      </div>

      {/* Sonsuz scroll sentinel */}
      <div ref={sentinelRef} className="h-px" />
      {loading && (
        <div className="flex justify-center py-8">
          <div className="size-6 animate-spin rounded-full border-2 border-(--color-brand) border-t-transparent" />
        </div>
      )}
    </div>
  );
}
