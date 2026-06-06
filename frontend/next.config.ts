import type { NextConfig } from 'next';
import createNextIntlPlugin from 'next-intl/plugin';

const withNextIntl = createNextIntlPlugin('./src/i18n/request.ts');

const nextConfig: NextConfig = {
  reactStrictMode: true,
  output: 'standalone',

  images: {
    formats: ['image/avif', 'image/webp'],
    deviceSizes: [640, 750, 828, 1080, 1200, 1920],
    minimumCacheTTL: 2592000,
    dangerouslyAllowLocalIP: process.env.NODE_ENV === 'development',
    dangerouslyAllowSVG: true,
    remotePatterns: [
      { protocol: 'https', hostname: 'res.cloudinary.com' },
      { protocol: 'https', hostname: 'sultandefense.com' },
      { protocol: 'https', hostname: 'www.sultandefense.com' },
      { protocol: 'https', hostname: 'api.sultandefense.com' },
      { protocol: 'https', hostname: 'picsum.photos' },
      { protocol: 'https', hostname: 'fastly.picsum.photos' },
      ...(process.env.NODE_ENV === 'development'
        ? [
            { protocol: 'http' as const, hostname: 'localhost', port: '8090' },
            { protocol: 'http' as const, hostname: '127.0.0.1', port: '8090' },
          ]
        : []),
    ],
  },

  async rewrites() {
    const apiBase = process.env.INTERNAL_API_URL?.replace(/\/api\/?$/, '') || 'http://127.0.0.1:8090';
    return [
      {
        source: '/uploads/:path*',
        destination: `${apiBase}/uploads/:path*`,
      },
    ];
  },

  async redirects() {
    // Eski TR (ve legacy) slug -> yeni Ingilizce slug. Tum diller Ingilizce rota kullanir.
    const LEGACY: [string, string][] = [
      ['hakkimizda', 'about'],
      ['neden-biz', 'about'],
      ['urunler', 'products'],
      ['projeler', 'products'],
      ['projects', 'products'],
      ['hizmetler', 'capabilities'],
      ['galeri', 'gallery'],
      ['iletisim', 'contact'],
      ['teklif', 'request-quote'],
      ['arama', 'search'],
      ['referanslar', 'references'],
    ];
    const legacyRedirects = LEGACY.flatMap(([from, to]) => [
      { source: `/:locale/${from}`, destination: `/:locale/${to}`, permanent: true },
      { source: `/:locale/${from}/:slug*`, destination: `/:locale/${to}/:slug*`, permanent: true },
    ]);
    return [
      { source: '/Default', destination: '/tr', permanent: true },
      { source: '/default', destination: '/tr', permanent: true },
      { source: '/:locale/Default', destination: '/:locale', permanent: true },
      { source: '/:locale/default', destination: '/:locale', permanent: true },
      ...legacyRedirects,
      { source: '/', destination: '/tr', permanent: true },
    ];
  },

  experimental: {
    optimizePackageImports: ['lucide-react', 'sonner', '@tanstack/react-query'],
  },

  async headers() {
    const isDev = process.env.NODE_ENV === 'development';
    return [
      {
        source: '/(.*)',
        headers: [
          { key: 'X-Content-Type-Options', value: 'nosniff' },
          { key: 'X-Frame-Options', value: 'DENY' },
          { key: 'Referrer-Policy', value: 'strict-origin-when-cross-origin' },
          ...(isDev ? [{ key: 'Cache-Control', value: 'no-store, no-cache, must-revalidate' }] : []),
        ],
      },
      ...(!isDev
        ? [
            {
              source: '/_next/static/(.*)',
              headers: [
                { key: 'Cache-Control', value: 'public, max-age=31536000, immutable' },
              ],
            },
          ]
        : []),
    ];
  },

  compiler: {
    removeConsole: process.env.NODE_ENV === 'production' ? { exclude: ['error', 'warn'] } : false,
  },

  compress: true,
  poweredByHeader: false,
};

// Workspace'te iki ayrı node_modules/next örneği; plugin ile NextConfig tipleri çakışıyor.
export default withNextIntl(nextConfig as Parameters<typeof withNextIntl>[0]);
