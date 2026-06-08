'use client';

import { useState } from 'react';
import { useTranslations } from 'next-intl';
import { toast } from 'sonner';
import api from '@/lib/axios';
import { trackGoogleAdsConversion } from '@/lib/google-ads';

export function OfferFormClient({
  locale,
  preselectedProduct,
  categories = [],
}: {
  locale: string;
  preselectedProduct?: string;
  categories?: string[];
}) {
  const t = useTranslations('offer.form');
  const tc = useTranslations('common');
  const [sending, setSending] = useState(false);

  async function handleSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    setSending(true);
    const fd = new FormData(e.currentTarget);
    const get = (k: string) => (fd.get(k) ? String(fd.get(k)).trim() : '');

    try {
      await api.post('/offers', {
        customer_name: get('full_name'),
        email: get('email'),
        phone: get('phone'),
        company_name: get('company'),
        country_code: get('country') || undefined,
        subject: get('product_name') || get('product_category'),
        message: get('message'),
        source: 'sultandefense',
        locale,
        consent_terms: fd.get('consent') ? 1 : 0,
        form_data: {
          job_title: get('job_title'),
          company_website: get('website'),
          product_category: get('product_category'),
          product_name: get('product_name'),
          estimated_quantity: get('quantity'),
          project_type: get('project_type'),
          technical_specs: get('tech_specs'),
          destination_country: get('destination_country'),
          delivery_city: get('delivery_city'),
          preferred_delivery_term: get('delivery_term'),
          ddp_required: get('ddp_required'),
          purchase_timeline: get('timeline'),
        },
      });
      trackGoogleAdsConversion('offer_submit');
      toast.success(t('success'));
      (e.target as HTMLFormElement).reset();
    } catch {
      toast.error(t('error'));
    } finally {
      setSending(false);
    }
  }

  const cls =
    'w-full rounded border border-(--color-border) bg-(--color-bg-secondary) px-4 py-3 text-sm text-(--color-text-primary) outline-none placeholder:text-(--color-text-muted) focus:border-(--color-brand) focus:ring-1 focus:ring-(--color-brand)/30';
  const sectionTitle = 'text-xs font-black uppercase tracking-[0.18em] text-(--color-brand-text) border-b border-(--color-border) pb-2 mb-1';
  const label = 'mb-1.5 block text-xs font-semibold text-(--color-text-secondary)';

  const projectTypeOptions = [
    'useDistributor', 'useGovernment', 'useSecurity', 'useMilitary',
    'useHumanitarian', 'useReseller', 'useOther',
  ];

  return (
    <form onSubmit={handleSubmit} className="space-y-7">
      <p className="text-sm leading-relaxed text-(--color-text-secondary)">{t('intro')}</p>

      {/* 1 — Buyer information */}
      <fieldset className="space-y-4">
        <legend className={sectionTitle}>{t('secBuyer')}</legend>
        <div className="grid gap-4 sm:grid-cols-2">
          <div>
            <label className={label}>{t('fullName')} *</label>
            <input name="full_name" required placeholder={t('fullName')} className={cls} />
          </div>
          <div>
            <label className={label}>{t('company')}</label>
            <input name="company" placeholder={t('company')} className={cls} />
          </div>
          <div>
            <label className={label}>{t('jobTitle')}</label>
            <input name="job_title" placeholder={t('jobTitle')} className={cls} />
          </div>
          <div>
            <label className={label}>{t('country')}</label>
            <input name="country" placeholder={t('country')} className={cls} />
          </div>
          <div>
            <label className={label}>{t('email')} *</label>
            <input name="email" type="email" required placeholder={t('email')} className={cls} />
          </div>
          <div>
            <label className={label}>{t('phone')}</label>
            <input name="phone" placeholder={t('phone')} className={cls} />
          </div>
          <div className="sm:col-span-2">
            <label className={label}>{t('website')}</label>
            <input name="website" placeholder={t('website')} className={cls} />
          </div>
        </div>
      </fieldset>

      {/* 2 — Product requirements */}
      <fieldset className="space-y-4">
        <legend className={sectionTitle}>{t('secProduct')}</legend>
        <div className="grid gap-4 sm:grid-cols-2">
          <div>
            <label className={label}>{t('productCategory')}</label>
            <select name="product_category" className={cls} defaultValue="">
              <option value="" disabled>{t('selectPlaceholder')}</option>
              {categories.map((c) => (
                <option key={c} value={c}>{c}</option>
              ))}
              <option value={t('multipleCategories')}>{t('multipleCategories')}</option>
              <option value={t('other')}>{t('other')}</option>
            </select>
          </div>
          <div>
            <label className={label}>{t('quantity')}</label>
            <input name="quantity" placeholder={t('quantity')} className={cls} />
          </div>
          <div className="sm:col-span-2">
            <label className={label}>{t('productName')}</label>
            <input
              name="product_name"
              defaultValue={preselectedProduct || ''}
              placeholder={t('productName')}
              className={cls}
            />
          </div>
          <div>
            <label className={label}>{t('projectType')}</label>
            <select name="project_type" className={cls} defaultValue="">
              <option value="" disabled>{t('selectPlaceholder')}</option>
              {projectTypeOptions.map((k) => (
                <option key={k} value={t(`opt.${k}`)}>{t(`opt.${k}`)}</option>
              ))}
            </select>
          </div>
          <div className="sm:col-span-2">
            <label className={label}>{t('techSpecs')}</label>
            <textarea name="tech_specs" rows={2} placeholder={t('techSpecsHint')} className={cls} style={{ resize: 'vertical' }} />
          </div>
        </div>
      </fieldset>

      {/* 3 — Delivery & export */}
      <fieldset className="space-y-4">
        <legend className={sectionTitle}>{t('secDelivery')}</legend>
        <div className="grid gap-4 sm:grid-cols-2">
          <div>
            <label className={label}>{t('destinationCountry')}</label>
            <input name="destination_country" placeholder={t('destinationCountry')} className={cls} />
          </div>
          <div>
            <label className={label}>{t('deliveryCity')}</label>
            <input name="delivery_city" placeholder={t('deliveryCity')} className={cls} />
          </div>
          <div>
            <label className={label}>{t('deliveryTerm')}</label>
            <select name="delivery_term" className={cls} defaultValue="">
              <option value="" disabled>{t('selectPlaceholder')}</option>
              <option value={t('opt.delDDP')}>{t('opt.delDDP')}</option>
              <option value={t('opt.delStandard')}>{t('opt.delStandard')}</option>
              <option value={t('opt.delDiscuss')}>{t('opt.delDiscuss')}</option>
            </select>
          </div>
          <div>
            <label className={label}>{t('ddpRequired')}</label>
            <select name="ddp_required" className={cls} defaultValue="">
              <option value="" disabled>{t('selectPlaceholder')}</option>
              <option value={t('opt.ddpYes')}>{t('opt.ddpYes')}</option>
              <option value={t('opt.ddpNo')}>{t('opt.ddpNo')}</option>
              <option value={t('opt.ddpEvaluate')}>{t('opt.ddpEvaluate')}</option>
            </select>
          </div>
          <div className="sm:col-span-2">
            <label className={label}>{t('timeline')}</label>
            <select name="timeline" className={cls} defaultValue="">
              <option value="" disabled>{t('selectPlaceholder')}</option>
              <option value={t('opt.tlImmediately')}>{t('opt.tlImmediately')}</option>
              <option value={t('opt.tl30')}>{t('opt.tl30')}</option>
              <option value={t('opt.tl60')}>{t('opt.tl60')}</option>
              <option value={t('opt.tl90')}>{t('opt.tl90')}</option>
              <option value={t('opt.tlProject')}>{t('opt.tlProject')}</option>
            </select>
          </div>
        </div>
      </fieldset>

      {/* 4 — Additional */}
      <fieldset className="space-y-4">
        <legend className={sectionTitle}>{t('secAdditional')}</legend>
        <div>
          <label className={label}>{t('message')}</label>
          <textarea name="message" rows={4} placeholder={t('message')} className={cls} style={{ resize: 'vertical' }} />
        </div>
        <p className="text-xs leading-relaxed text-(--color-text-muted)">{t('attachNote')}</p>
        <label className="flex items-start gap-2 text-xs leading-relaxed text-(--color-text-secondary)">
          <input type="checkbox" name="consent" required className="mt-0.5 size-4 shrink-0 accent-(--color-brand)" />
          <span>{t('consent')}</span>
        </label>
      </fieldset>

      <button
        type="submit"
        disabled={sending}
        className="btn-primary w-full rounded-lg px-6 py-3.5 text-sm font-bold uppercase tracking-widest transition-colors disabled:opacity-50"
      >
        {sending ? tc('loading') : t('submit')}
      </button>
    </form>
  );
}
