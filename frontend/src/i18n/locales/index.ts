import type { AbstractIntlMessages } from 'next-intl';
import en from '../../../public/locales/en.json';
import de from '../../../public/locales/de.json';
import ar from '../../../public/locales/ar.json';
import ru from '../../../public/locales/ru.json';

// Aktif diller: EN (varsayilan) · DE · AR (RTL) · RU. Turkce (tr.json) PASIF —
// dosya referans icin duruyor ama LOCALE_MESSAGES'a dahil degil (rota/sitemap/switcher disi).
// JSON mesajlar dizi (ör. home.heroCards) icerdiginden AbstractIntlMessages ile birebir
// uyumlu degil; t.raw() ile okunur. Cast guvenli.
export const LOCALE_MESSAGES: Record<string, AbstractIntlMessages> = {
  en,
  de,
  ar,
  ru,
} as unknown as Record<string, AbstractIntlMessages>;

export const AVAILABLE_LOCALES = Object.keys(LOCALE_MESSAGES);
export const FALLBACK_LOCALE = 'en';

/** RTL diller (Arapca). html dir bunlara gore ayarlanir. */
export const RTL_LOCALES = ['ar'];
export function isRtlLocale(locale: string): boolean {
  return RTL_LOCALES.includes(locale);
}

export function hasLocale(locale: string): boolean {
  return locale in LOCALE_MESSAGES;
}

export function getLocaleMessages(locale: string): AbstractIntlMessages {
  return LOCALE_MESSAGES[locale] ?? (LOCALE_MESSAGES[FALLBACK_LOCALE] as AbstractIntlMessages);
}
