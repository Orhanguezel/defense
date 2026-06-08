'use client';

import { useState } from 'react';
import { useTranslations } from 'next-intl';
import { toast } from 'sonner';
import api from '@/lib/axios';
import { trackGoogleAdsConversion } from '@/lib/google-ads';

export function ContactFormClient({
  locale,
  categories = [],
}: {
  locale: string;
  categories?: string[];
}) {
  const t = useTranslations('contact.form');
  const tc = useTranslations('common');
  const [sending, setSending] = useState(false);

  async function handleSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    setSending(true);
    const fd = new FormData(e.currentTarget);
    const get = (k: string) => (fd.get(k) ? String(fd.get(k)).trim() : '');

    try {
      await api.post('/contacts', {
        name: get('name'),
        email: get('email'),
        phone: get('phone'),
        message: get('message'),
        subject: get('product_category') || undefined,
        website: get('website'), // honeypot
        source: 'sultandefense',
        locale,
        form_data: {
          company: get('company'),
          country: get('country'),
          product_category: get('product_category'),
          estimated_quantity: get('quantity'),
          destination_country: get('destination_country'),
          preferred_delivery_option: get('delivery_option'),
        },
      });
      trackGoogleAdsConversion('contact_submit');
      toast.success(t('success'));
      (e.target as HTMLFormElement).reset();
    } catch {
      toast.error(t('error'));
    } finally {
      setSending(false);
    }
  }

  const cls = 'w-full rounded-xl border border-(--color-border) bg-(--color-bg-muted)/50 px-4 py-3.5 text-sm text-(--color-text-primary) placeholder-(--color-text-muted) outline-none transition-all duration-300 focus:border-(--color-brand) focus:bg-(--color-surface) focus:shadow-lg focus:shadow-(--color-brand)/5';
  const label = 'mb-1.5 block text-xs font-semibold text-(--color-text-secondary)';

  return (
    <form onSubmit={handleSubmit} className="surface-card space-y-5 rounded-2xl p-8 border border-(--color-border) shadow-sm">
      <div>
        <h2 className="text-2xl font-bold font-heading text-(--color-text-primary)">{t('title')}</h2>
        <p className="mt-2 text-sm leading-relaxed text-(--color-text-secondary)">{t('intro')}</p>
      </div>

      {/* honeypot */}
      <input type="text" name="website" tabIndex={-1} autoComplete="off" className="hidden" aria-hidden="true" />

      <div className="grid gap-5 sm:grid-cols-2">
        <div>
          <label className={label}>{t('fullName')} *</label>
          <input name="name" required placeholder={t('fullName')} className={cls} />
        </div>
        <div>
          <label className={label}>{t('company')}</label>
          <input name="company" placeholder={t('company')} className={cls} />
        </div>
        <div>
          <label className={label}>{t('email')} *</label>
          <input name="email" type="email" required placeholder={t('email')} className={cls} />
        </div>
        <div>
          <label className={label}>{t('phone')}</label>
          <input name="phone" placeholder={t('phone')} className={cls} />
        </div>
        <div>
          <label className={label}>{t('country')}</label>
          <input name="country" placeholder={t('country')} className={cls} />
        </div>
        <div>
          <label className={label}>{t('productCategory')}</label>
          <select name="product_category" className={cls} defaultValue="">
            <option value="" disabled>{t('selectPlaceholder')}</option>
            {categories.map((c) => (
              <option key={c} value={c}>{c}</option>
            ))}
            <option value={t('other')}>{t('other')}</option>
          </select>
        </div>
        <div>
          <label className={label}>{t('quantity')}</label>
          <input name="quantity" placeholder={t('quantity')} className={cls} />
        </div>
        <div>
          <label className={label}>{t('destinationCountry')}</label>
          <input name="destination_country" placeholder={t('destinationCountry')} className={cls} />
        </div>
        <div className="sm:col-span-2">
          <label className={label}>{t('deliveryOption')}</label>
          <select name="delivery_option" className={cls} defaultValue="">
            <option value="" disabled>{t('selectPlaceholder')}</option>
            <option value={t('opt.delDDP')}>{t('opt.delDDP')}</option>
            <option value={t('opt.delStandard')}>{t('opt.delStandard')}</option>
            <option value={t('opt.delDiscuss')}>{t('opt.delDiscuss')}</option>
          </select>
        </div>
      </div>

      <div>
        <label className={label}>{t('message')} *</label>
        <textarea
          name="message"
          required
          rows={5}
          placeholder={t('messagePlaceholder')}
          className={cls}
          style={{ resize: 'vertical' }}
        />
      </div>

      <div className="pt-2">
        <button
          type="submit"
          disabled={sending}
          className="btn-primary w-full rounded-xl px-8 py-4 text-sm font-bold uppercase tracking-widest transition-all duration-300 hover:scale-[1.02] active:scale-95 disabled:opacity-50 flex items-center justify-center gap-3 shadow-xl shadow-(--color-brand)/10"
        >
          {sending ? (
            <>
              <div className="h-4 w-4 animate-spin rounded-full border-2 border-(--color-on-brand)/30 border-t-(--color-on-brand)" />
              {tc('loading')}
            </>
          ) : t('submit')}
        </button>
      </div>
    </form>
  );
}
