import api from '@/lib/axios';
import { localizedPath } from '@/seo';

export type SiteSearchHitType =
  | 'product'
  | 'service'
  | 'news'
  | 'blog'
  | 'legal'
  | 'corporate';

export type SiteSearchHit = {
  id: string;
  title: string;
  type: SiteSearchHitType;
  url: string;
  description?: string;
};

function asArray<T>(data: unknown): T[] {
  if (Array.isArray(data)) return data as T[];
  if (data && typeof data === 'object' && Array.isArray((data as { items?: unknown }).items)) {
    return (data as { items: T[] }).items;
  }
  return [];
}

const MIN_QUERY_LEN = 2;

export function siteSearchQueryValid(q: string): boolean {
  return q.trim().length >= MIN_QUERY_LEN;
}

function customPageUrl(locale: string, moduleKey: string, slug: string): string | null {
  if (!slug) return null;

  if (moduleKey === 'news') {
    return localizedPath(locale, `/haberler/${encodeURIComponent(slug)}`);
  }
  if (moduleKey === 'blog') {
    return localizedPath(locale, `/blog/${encodeURIComponent(slug)}`);
  }
  if (moduleKey === 'sultandefense_legal') {
    return localizedPath(locale, `/legal/${encodeURIComponent(slug)}`);
  }
  if (moduleKey === 'sultandefense_about') {
    if (slug === 'about') return localizedPath(locale, '/about');
    return localizedPath(locale, '/about');
  }

  return null;
}

function customPageType(moduleKey: string, slug: string): SiteSearchHitType | null {
  if (moduleKey === 'news') return 'news';
  if (moduleKey === 'blog') return 'blog';
  if (moduleKey === 'sultandefense_legal') return 'legal';
  if (moduleKey === 'sultandefense_about') return 'corporate';
  return null;
}

export async function fetchSiteSearch(locale: string, rawQuery: string): Promise<SiteSearchHit[]> {
  const q = rawQuery.trim();
  if (!siteSearchQueryValid(q)) return [];

  const [productsRes, servicesRes, pagesRes] = await Promise.all([
    api
      .get<unknown>('/products', {
        params: { q, locale, item_type: 'sultandefense', is_active: '1', limit: 20 },
      })
      .catch(() => ({ data: [] })),
    api
      .get<unknown>('/services', {
        params: { q, locale, module_key: 'sultandefense', is_active: '1', limit: 15 },
      })
      .catch(() => ({ data: [] })),
    api
      .get<unknown>('/custom-pages', {
        params: { search: q, locale, is_published: '1', limit: 25 },
      })
      .catch(() => ({ data: [] })),
  ]);

  const hits: SiteSearchHit[] = [];

  for (const p of asArray<Record<string, unknown>>(productsRes.data)) {
    const slug = typeof p.slug === 'string' ? p.slug : '';
    const id = typeof p.id === 'string' ? p.id : slug;
    if (!slug) continue;
    const title = typeof p.title === 'string' && p.title ? p.title : slug;
    const summary = typeof p.summary === 'string' ? p.summary : undefined;
    const metaDesc = typeof p.meta_description === 'string' ? p.meta_description : undefined;
    hits.push({
      id,
      title,
      type: 'product',
      url: localizedPath(locale, `/products/${encodeURIComponent(slug)}`),
      description: summary ?? metaDesc,
    });
  }

  for (const s of asArray<Record<string, unknown>>(servicesRes.data)) {
    const slug = typeof s.slug === 'string' ? s.slug : '';
    const id = typeof s.id === 'string' ? s.id : slug;
    if (!slug) continue;
    const title = typeof s.title === 'string' && s.title ? s.title : slug;
    const summary = typeof s.summary === 'string' ? s.summary : undefined;
    hits.push({
      id,
      title,
      type: 'service',
      url: localizedPath(locale, `/capabilities/${encodeURIComponent(slug)}`),
      description: summary ?? undefined,
    });
  }

  for (const row of asArray<Record<string, unknown>>(pagesRes.data)) {
    const slug = typeof row.slug === 'string' ? row.slug : '';
    const moduleKey = typeof row.module_key === 'string' ? row.module_key : '';
    const id = typeof row.id === 'string' ? row.id : slug;
    if (!slug || !moduleKey) continue;

    const hitType = customPageType(moduleKey, slug);
    const url = customPageUrl(locale, moduleKey, slug);
    if (!hitType || !url) continue;

    const title = typeof row.title === 'string' && row.title ? row.title : slug;
    const summary = typeof row.summary === 'string' ? row.summary : undefined;
    hits.push({
      id,
      title,
      type: hitType,
      url,
      description: summary ?? undefined,
    });
  }

  const order: Record<SiteSearchHitType, number> = {
    product: 0,
    service: 1,
    corporate: 2,
    legal: 3,
    news: 4,
    blog: 5,
  };
  hits.sort((a, b) => {
    const d = order[a.type] - order[b.type];
    return d !== 0 ? d : a.title.localeCompare(b.title, locale, { sensitivity: 'base' });
  });

  return hits;
}
