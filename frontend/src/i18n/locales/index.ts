import type { AbstractIntlMessages } from 'next-intl';
import en from '../../../public/locales/en.json';
import tr from '../../../public/locales/tr.json';
import de from '../../../public/locales/de.json';

// JSON mesajlar dizi (ör. home.heroCards / home.b2bExport.stats) içerdiğinden
// AbstractIntlMessages ile birebir uyumlu degil; t.raw() ile okunur. Cast guvenli.
export const LOCALE_MESSAGES: Record<string, AbstractIntlMessages> = {
  tr,
  en,
  de,
} as unknown as Record<string, AbstractIntlMessages>;

export const AVAILABLE_LOCALES = Object.keys(LOCALE_MESSAGES);
export const FALLBACK_LOCALE = 'tr';

export function hasLocale(locale: string): boolean {
  return locale in LOCALE_MESSAGES;
}

export function getLocaleMessages(locale: string): AbstractIntlMessages {
  return LOCALE_MESSAGES[locale] ?? (LOCALE_MESSAGES[FALLBACK_LOCALE] as AbstractIntlMessages);
}
