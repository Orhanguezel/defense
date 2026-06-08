'use client';

import React, { useState, useEffect, useRef } from 'react';
import Link from 'next/link';
import { useTranslations, useLocale } from 'next-intl';
import { usePathname } from 'next/navigation';
import {
  Search, Globe, User, Share2, ClipboardList, X, ChevronLeft,
  Instagram, Facebook, Linkedin, Youtube, Twitter, Phone, Mail, MapPin,
  MessageCircle, Link2, Check
} from 'lucide-react';

interface FloatingWidgetsProps {
  activeLocales?: { code: string; label: string }[];
  socials?: Record<string, string>;
  contactInfo?: {
    company_name?: string;
    address?: string;
    city?: string;
    phone?: string;
    email?: string;
  };
}

export function FloatingWidgets({ activeLocales = [], socials = {}, contactInfo = {} }: FloatingWidgetsProps) {
  const [activeTab, setActiveTab] = useState<'none' | 'search' | 'lang' | 'info' | 'social'>('none');
  const [expanded, setExpanded] = useState(false); // mobil: tutaca dokununca acilir
  const [searchQuery, setSearchQuery] = useState('');
  const locale = useLocale();
  const pathname = usePathname();
  const t = useTranslations('nav');
  const tCommon = useTranslations('common');
  const searchInputRef = useRef<HTMLInputElement>(null);

  // Close when escaping
  useEffect(() => {
    const handleEsc = (e: KeyboardEvent) => {
      if (e.key === 'Escape') setActiveTab('none');
    };
    window.addEventListener('keydown', handleEsc);
    return () => window.removeEventListener('keydown', handleEsc);
  }, []);

  // Focus search input when tab opens
  useEffect(() => {
    if (activeTab === 'search') {
      setTimeout(() => searchInputRef.current?.focus(), 100);
    }
  }, [activeTab]);

  const toggleTab = (tab: typeof activeTab) => {
    setActiveTab(prev => prev === tab ? 'none' : tab);
  };

  const handleSearch = (e: React.FormEvent) => {
    e.preventDefault();
    if (searchQuery.trim()) {
      window.location.href = `/${locale}/search?q=${encodeURIComponent(searchQuery.trim())}`;
      setActiveTab('none');
    }
  };

  const socialIcons = [
    { key: 'instagram', icon: Instagram, url: socials.instagram },
    { key: 'facebook', icon: Facebook, url: socials.facebook },
    { key: 'linkedin', icon: Linkedin, url: socials.linkedin },
    { key: 'youtube', icon: Youtube, url: socials.youtube },
    { key: 'x', icon: Twitter, url: socials.x },
  ].filter(s => s.url);

  // "Bu sayfayi paylas" — gecerli sayfa URL'i ile (config gerektirmez)
  const [pageUrl, setPageUrl] = useState('');
  const [copied, setCopied] = useState(false);
  useEffect(() => {
    if (typeof window !== 'undefined') setPageUrl(window.location.href);
  }, [pathname]);

  const shareItems = [
    { key: 'wa', icon: MessageCircle, url: `https://wa.me/?text=${encodeURIComponent(pageUrl)}` },
    { key: 'fb', icon: Facebook, url: `https://www.facebook.com/sharer/sharer.php?u=${encodeURIComponent(pageUrl)}` },
    { key: 'x', icon: Twitter, url: `https://twitter.com/intent/tweet?url=${encodeURIComponent(pageUrl)}` },
    { key: 'in', icon: Linkedin, url: `https://www.linkedin.com/sharing/share-offsite/?url=${encodeURIComponent(pageUrl)}` },
  ];

  const copyLink = async () => {
    try {
      await navigator.clipboard.writeText(pageUrl || window.location.href);
      setCopied(true);
      setTimeout(() => setCopied(false), 1500);
    } catch { /* ignore */ }
  };

  return (
    <>
      {/* ── SEARCH OVERLAY (Moved outside transformed parent) ── */}
      {activeTab === 'search' && (
        <div className="fixed inset-0 z-[9999] flex items-center justify-center overflow-hidden bg-black/95 backdrop-blur-3xl pointer-events-auto animate-in fade-in duration-500">
          <button
            type="button"
            onClick={() => setActiveTab('none')}
            className="absolute right-10 top-10 text-(--section-bg-white)/50 transition-colors hover:text-(--section-bg-white)"
            aria-label={tCommon('closeMenu')}
          >
            <X size={48} strokeWidth={1} />
          </button>

          <div className="w-full max-w-4xl px-10">
            <form onSubmit={handleSearch} className="relative group">
              <input
                ref={searchInputRef}
                type="text"
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                placeholder={t('searchPlaceholder')}
                className="w-full border-b-2 border-(--color-glass-border) bg-transparent pb-4 pr-16 text-3xl font-medium tracking-tight text-(--section-bg-white) outline-none transition-colors focus:border-(--color-glass-hover) lg:text-5xl"
              />
              <button
                type="submit"
                className="absolute bottom-6 right-0 text-(--section-bg-white)/40 transition-colors hover:text-(--section-bg-white)"
              >
                <Search size={32} />
              </button>
            </form>
            <div className="mt-12 flex flex-wrap gap-8 text-sm font-bold uppercase tracking-widest text-(--section-bg-white)/40">
              <span style={{ color: 'var(--color-brand-light)' }}>{t('trendingSearches')}</span>
              <button
                type="button"
                onClick={() => setSearchQuery(t('trendSeedling'))}
                className="transition-colors hover:text-(--section-bg-white)"
              >
                {t('trendSeedling')}
              </button>
              <button
                type="button"
                onClick={() => setSearchQuery(t('trendGrafted'))}
                className="transition-colors hover:text-(--section-bg-white)"
              >
                {t('trendGrafted')}
              </button>
              <button
                type="button"
                onClick={() => setSearchQuery(t('trendTomato'))}
                className="transition-colors hover:text-(--section-bg-white)"
              >
                {t('trendTomato')}
              </button>
            </div>
          </div>
        </div>
      )}

      <div className="group fixed right-0 top-1/2 -translate-y-1/2 z-9000 flex flex-row-reverse items-center pointer-events-none">

        {/* Mobil tutac — dokununca bari acar (masaustunde gizli; bar her zaman acik) */}
        <button
          type="button"
          onClick={() => setExpanded((v) => !v)}
          aria-label="Araçlar"
          aria-expanded={expanded}
          className="pointer-events-auto flex h-16 w-6 items-center justify-center rounded-l-md text-(--color-on-brand) shadow-2xl lg:hidden"
          style={{ background: 'var(--color-brand)' }}
        >
          <ChevronLeft size={16} className={`transition-transform duration-300 ${expanded ? 'rotate-180' : ''}`} />
        </button>

        {/* ── FLOATING BAR ── (mobilde varsayilan gizli; tutac/hover ile acilir) */}
        <div
          data-open={expanded}
          className="relative flex w-0 flex-col overflow-hidden opacity-0 shadow-2xl transition-all duration-300 pointer-events-auto group-hover:w-[60px] group-hover:opacity-100 group-hover:overflow-visible data-[open=true]:w-[60px] data-[open=true]:opacity-100 data-[open=true]:overflow-visible lg:w-[60px] lg:opacity-100 lg:overflow-visible"
          style={{ background: 'var(--color-bg-dark)' }}
        >

          {/* Search Button */}
          <div className="relative">
            <button
              type="button"
              onClick={() => toggleTab('search')}
              aria-label={t('ariaSearch')}
              className={`flex h-[60px] w-[60px] items-center justify-center transition-colors ${
                activeTab === 'search'
                  ? 'text-(--color-on-brand)'
                  : 'text-(--section-bg-white)/70 hover:bg-(--color-glass-hover)'
              }`}
              style={activeTab === 'search' ? { background: 'var(--color-brand)' } : undefined}
            >
              <Search size={22} />
            </button>
          </div>

          {/* Language Switcher */}
          <div className="relative">
            {activeTab === 'lang' && (
              <div
                className="absolute right-full top-0 flex h-[60px] animate-in slide-in-from-right-10 duration-300 shadow-xl"
                style={{ background: 'var(--color-bg-dark)' }}
              >
                {activeLocales.map((loc) => (
                  <Link
                    key={loc.code}
                    href={pathname.replace(`/${locale}`, `/${loc.code}`)}
                    onClick={() => setActiveTab('none')}
                    className={`flex min-w-[60px] items-center justify-center border-r border-(--color-border-on-dark) px-4 text-xs font-bold uppercase transition-colors hover:bg-(--color-glass-bg-strong) ${
                      locale === loc.code ? '' : 'text-(--section-bg-white)/60'
                    }`}
                    style={locale === loc.code ? { color: 'var(--color-brand-light)' } : undefined}
                  >
                    {loc.code}
                  </Link>
                ))}
              </div>
            )}
            <button
              type="button"
              onClick={() => toggleTab('lang')}
              aria-label={t('ariaLanguage')}
              className={`flex h-[60px] w-[60px] items-center justify-center border-t border-(--color-border-on-dark) text-xs font-bold uppercase transition-colors ${
                activeTab === 'lang'
                  ? 'text-(--color-on-brand)'
                  : 'text-(--section-bg-white)/70 hover:bg-(--color-glass-hover)'
              }`}
              style={activeTab === 'lang' ? { background: 'var(--color-brand)' } : undefined}
            >
              {locale}
            </button>
          </div>

          {/* Info Button */}
          <div className="relative">
            {activeTab === 'info' && (
              <div className="absolute right-full top-0 w-[300px] bg-(--color-bg-secondary) p-8 shadow-2xl animate-in slide-in-from-right-10 duration-300">
                <div className="space-y-6">
                  <div>
                    <h4 className="mb-2 text-lg font-bold text-(--color-text-primary)">
                      {contactInfo.company_name || 'Sultan Defense'}
                    </h4>
                    <div className="flex gap-3 text-sm leading-relaxed text-(--color-text-muted)">
                      <MapPin size={18} className="shrink-0" style={{ color: 'var(--color-brand)' }} />
                      <span>{contactInfo.address}<br />{contactInfo.city}</span>
                    </div>
                  </div>
                  <div className="space-y-3 border-t border-(--color-border) pt-4">
                    <a
                      href={`tel:${contactInfo.phone}`}
                      className="flex items-center gap-3 font-medium text-(--color-text-secondary) transition-colors hover:text-(--color-brand)"
                    >
                      <Phone size={18} />
                      <span>{contactInfo.phone}</span>
                    </a>
                    <a
                      href={`mailto:${contactInfo.email}`}
                      className="flex items-center gap-3 font-medium text-(--color-text-secondary) transition-colors hover:text-(--color-brand)"
                    >
                      <Mail size={18} />
                      <span>{contactInfo.email}</span>
                    </a>
                  </div>
                </div>
              </div>
            )}
            <button
              type="button"
              onClick={() => toggleTab('info')}
              aria-label={t('ariaContactInfo')}
              className={`flex h-[60px] w-[60px] items-center justify-center border-t border-(--color-border-on-dark) transition-colors ${
                activeTab === 'info'
                  ? 'text-(--color-on-brand)'
                  : 'text-(--section-bg-white)/70 hover:bg-(--color-glass-hover)'
              }`}
              style={activeTab === 'info' ? { background: 'var(--color-brand)' } : undefined}
            >
              <User size={22} />
            </button>
          </div>

          {/* Social Share */}
          <div className="relative">
            {activeTab === 'social' && (
              <div
                className="absolute right-full top-0 flex h-[60px] animate-in slide-in-from-right-10 duration-300 shadow-xl"
                style={{ background: 'var(--color-bg-dark)' }}
              >
                {/* Bu sayfayi paylas */}
                {shareItems.map((s) => (
                  <a
                    key={s.key}
                    href={s.url}
                    target="_blank"
                    rel="noopener noreferrer"
                    title={tCommon('share')}
                    className="flex w-[60px] items-center justify-center border-r border-(--color-border-on-dark) text-(--section-bg-white)/50 transition-colors hover:bg-(--color-glass-bg-strong) hover:text-(--section-bg-white)"
                  >
                    <s.icon size={20} />
                  </a>
                ))}
                {/* Linki kopyala */}
                <button
                  type="button"
                  onClick={copyLink}
                  title={tCommon('copyLink')}
                  className="flex w-[60px] items-center justify-center border-r border-(--color-border-on-dark) text-(--section-bg-white)/50 transition-colors hover:bg-(--color-glass-bg-strong) hover:text-(--section-bg-white)"
                >
                  {copied ? <Check size={20} /> : <Link2 size={20} />}
                </button>
                {/* Sirket sosyal hesaplari (tanimliysa) */}
                {socialIcons.map((s) => (
                  <a
                    key={s.key}
                    href={s.url}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="flex w-[60px] items-center justify-center border-r border-(--color-border-on-dark) text-(--color-brand-light) transition-colors hover:bg-(--color-glass-bg-strong) hover:text-(--section-bg-white)"
                  >
                    <s.icon size={20} />
                  </a>
                ))}
              </div>
            )}
            <button
              type="button"
              onClick={() => toggleTab('social')}
              aria-label={t('ariaSocialLinks')}
              className={`flex h-[60px] w-[60px] items-center justify-center border-t border-(--color-border-on-dark) transition-colors ${
                activeTab === 'social'
                  ? 'text-(--color-on-brand)'
                  : 'text-(--section-bg-white)/70 hover:bg-(--color-glass-hover)'
              }`}
              style={activeTab === 'social' ? { background: 'var(--color-brand)' } : undefined}
            >
              <Share2 size={22} />
            </button>
          </div>

          {/* Teklif Al Widget */}
          <Link
            href={`/${locale}/request-quote`}
            className="group flex h-[80px] w-[60px] flex-col items-center justify-center overflow-hidden border-t border-(--color-border-on-dark) text-(--color-on-brand) transition-all hover:opacity-95"
            style={{ background: 'var(--color-brand-dark)' }}
          >
            <ClipboardList size={22} className="group-hover:scale-110 transition-transform mb-1" />
            <span className="text-[10px] font-bold uppercase tracking-tighter text-center leading-none">{t('offerWidgetLine1')}<br/>{t('offerWidgetLine2')}</span>
          </Link>

        </div>
      </div>

      {/* Background Dim for Language/Social/Info if needed?
          Actually usually these side widgets don't dim the whole page unless it's the search modal.
      */}
      {activeTab !== 'none' && activeTab !== 'search' && (
        <div className="fixed inset-0 z-[90]" onClick={() => setActiveTab('none')} />
      )}
    </>
  );
}
