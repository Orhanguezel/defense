import type { MetadataRoute } from 'next';

export default function manifest(): MetadataRoute.Manifest {
  return {
    name: 'Sultan Defense',
    short_name: 'Sultan Defense',
    description: 'Sultan Defense — A to Z defense procurement and tactical equipment supplier.',
    start_url: '/tr',
    display: 'standalone',
    background_color: '#1A1A1D',
    theme_color: '#C5A880',
    icons: [
      {
        src: '/icon',
        sizes: '64x64',
        type: 'image/png',
      },
      {
        src: '/apple-icon',
        sizes: '180x180',
        type: 'image/png',
      },
    ],
  };
}
