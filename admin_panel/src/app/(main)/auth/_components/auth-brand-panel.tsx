'use client';

import Image from 'next/image';
import { useGetSiteSettingByKeyQuery } from '@/integrations/hooks';

const LOGO_FALLBACK = '/logo/sultandefense-logo-light.svg';

type Props = {
  heading: string;
  subtext: string;
};

export function AuthBrandPanel({ heading, subtext }: Props) {
  const { data: logoSetting } = useGetSiteSettingByKeyQuery('site_logo');
  const { data: configSetting } = useGetSiteSettingByKeyQuery('ui_admin_config');

  const logoVal = logoSetting?.value as any;
  const configVal = configSetting?.value as any;

  const rawLogoUrl: string = logoVal?.url || LOGO_FALLBACK;
  const isSvg = rawLogoUrl.endsWith('.svg');
  const logoUrl = rawLogoUrl;
  const logoAlt: string = logoVal?.alt || 'Logo';
  const appName: string = configVal?.branding?.app_name || 'Sultan Defense';

  return (
    <div className="hidden lg:flex lg:w-1/2 xl:w-2/5 flex-col relative overflow-hidden">
      {/* ── Tactical Background Image ── */}
      <Image
        src="/login-bg.png"
        alt="Sultan Defense tactical background"
        fill
        className="object-cover object-center"
        priority
        unoptimized
      />

      {/* ── Multi-layer gradient overlay ── */}
      <div
        className="absolute inset-0"
        style={{
          background: [
            'linear-gradient(135deg, rgba(13,27,42,0.92) 0%, rgba(27,38,59,0.78) 50%, rgba(13,27,42,0.88) 100%)',
            'radial-gradient(ellipse at 20% 80%, rgba(43,212,217,0.18) 0%, transparent 60%)',
            'radial-gradient(ellipse at 80% 10%, rgba(43,212,217,0.10) 0%, transparent 55%)',
          ].join(', '),
        }}
      />

      {/* ── Subtle tactical grid overlay ── */}
      <div
        className="absolute inset-0 opacity-[0.04]"
        style={{
          backgroundImage: `
            linear-gradient(rgba(43,212,217,1) 1px, transparent 1px),
            linear-gradient(90deg, rgba(43,212,217,1) 1px, transparent 1px)
          `,
          backgroundSize: '40px 40px',
        }}
      />

      {/* ── Content ── */}
      <div className="relative z-10 flex flex-col justify-between h-full p-10">
        {/* Top: classification badge */}
        <div className="flex items-center gap-2">
          <div
            className="w-2 h-2 rounded-full animate-pulse"
            style={{ backgroundColor: '#2BD4D9' }}
          />
          <span
            className="text-xs font-mono font-semibold tracking-[0.2em] uppercase"
            style={{ color: 'rgba(43,212,217,0.7)' }}
          >
            Secure Admin Portal
          </span>
        </div>

        {/* Center: logo + heading */}
        <div className="flex flex-col items-center text-center gap-6">
          {/* Glassmorphic card */}
          <div
            className="p-8 rounded-2xl flex flex-col items-center gap-5 w-full max-w-xs"
            style={{
              background: 'rgba(255,255,255,0.05)',
              border: '1px solid rgba(43,212,217,0.2)',
              backdropFilter: 'blur(16px)',
              boxShadow: '0 8px 32px rgba(0,0,0,0.4), 0 0 0 1px rgba(43,212,217,0.08) inset',
            }}
          >
            {/* Logo */}
            <div className="relative w-20 h-20">
              <Image
                src={logoUrl}
                alt={logoAlt}
                fill
                className="object-contain drop-shadow-lg"
                unoptimized={isSvg}
              />
            </div>

            {/* Brand name */}
            <p
              className="text-xs font-mono font-semibold tracking-[0.25em] uppercase"
              style={{ color: 'rgba(43,212,217,0.6)' }}
            >
              {appName}
            </p>

            {/* Divider */}
            <div
              className="w-12 h-px"
              style={{ background: 'linear-gradient(90deg, transparent, rgba(43,212,217,0.5), transparent)' }}
            />

            {/* Heading */}
            <h1
              className="text-3xl font-light leading-tight"
              style={{ color: '#E0E1DD' }}
            >
              {heading}
            </h1>

            {/* Sub text */}
            <p
              className="text-sm leading-relaxed"
              style={{ color: 'rgba(176,192,208,0.8)' }}
            >
              {subtext}
            </p>
          </div>
        </div>

        {/* Bottom: copyright + cyan accent bar */}
        <div className="space-y-3">
          <div
            className="h-px w-full"
            style={{ background: 'linear-gradient(90deg, transparent, rgba(43,212,217,0.3), transparent)' }}
          />
          <p
            className="text-xs font-mono text-center"
            style={{ color: 'rgba(138,151,166,0.6)' }}
          >
            © {new Date().getFullYear()} Sultan Defense Ltd., Co. — All rights reserved.
          </p>
        </div>
      </div>
    </div>
  );
}
