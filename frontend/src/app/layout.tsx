import type { ReactNode } from 'react';
import type { Metadata } from 'next';
import '@/styles/globals.css';
import { SITE_URL } from '@/lib/utils';

const siteUrl = process.env.NEXT_PUBLIC_SITE_URL ?? SITE_URL;
const metadataBase = new URL(siteUrl);

export const metadata: Metadata = {
  metadataBase,
  title: {
    default: 'Sultan Defense | Defense Procurement',
    template: '%s | Sultan Defense',
  },
  description: `B2B defense procurement and export partner for tactical equipment and defense technologies. Sultan Defense — ${metadataBase.host}`,
  openGraph: {
    type: 'website',
    siteName: 'Sultan Defense',
    url: metadataBase,
  },
};

export default function RootLayout({ children }: { children: ReactNode }) {
  return children;
}
