import type { MetadataRoute } from 'next';
import { SD_PALETTE_HEX as C } from '@/lib/sultandefense-palette-hex';

export default function manifest(): MetadataRoute.Manifest {
  return {
    name: 'Sultan Defense',
    short_name: 'Sultan Defense',
    description:
      'Sultan Defense — savunma sanayi ürünlerinde güvenilir tedarik ve ihracat çözüm ortağınız.',
    start_url: '/tr',
    display: 'standalone',
    background_color: C.surfaceBaseDark,
    theme_color: C.soil900,
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
