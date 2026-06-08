// reCAPTCHA — admin-yonetimli (site_settings) + env fallback.
import { getRecaptchaSettings } from '@/modules/siteSettings/service';

const DEFAULT_TEST_SECRET_KEY = '6LeIxAcTAAAAAGG-vFI1TnRWxMZNFuojJ4WifJWe';

/** Calisma zamani reCAPTCHA config (DB > env > test). */
export async function getRecaptchaRuntime(): Promise<{ secret: string; enabled: boolean }> {
  try {
    const s = await getRecaptchaSettings();
    return { secret: s.secretKey || DEFAULT_TEST_SECRET_KEY, enabled: s.enabled };
  } catch {
    // DB erisilemezse env fallback
    const raw = process.env.RECAPTCHA_ENABLED;
    const enabled = raw == null || raw === '' ? true : ['1', 'true', 'yes', 'on'].includes(String(raw).toLowerCase());
    return { secret: process.env.RECAPTCHA_SECRET_KEY || DEFAULT_TEST_SECRET_KEY, enabled };
  }
}

export function shouldBypassRecaptchaForOrigin(origin?: string | null) {
  if (!origin) return false;
  if (process.env.NODE_ENV === 'production') return false;

  try {
    const url = new URL(origin);
    return url.hostname === 'localhost' || url.hostname === '127.0.0.1';
  } catch {
    return false;
  }
}

export async function verifyRecaptchaToken(token: string, remoteIp?: string, secret?: string) {
  const secretKey = secret || (await getRecaptchaRuntime()).secret;

  const params = new URLSearchParams();
  params.set('secret', secretKey);
  params.set('response', token);
  if (remoteIp) params.set('remoteip', remoteIp);

  const res = await fetch('https://www.google.com/recaptcha/api/siteverify', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: params.toString(),
  });

  if (!res.ok) {
    return { success: false, errorCodes: ['verification-request-failed'] as string[] };
  }

  const data = (await res.json()) as {
    success?: boolean;
    'error-codes'?: string[];
  };

  return {
    success: Boolean(data.success),
    errorCodes: Array.isArray(data['error-codes']) ? data['error-codes'] : [],
  };
}
