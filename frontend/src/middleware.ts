import createMiddleware from 'next-intl/middleware';
import { NextResponse, type NextRequest } from 'next/server';
import { routing } from './i18n/routing';

const intlMiddleware = createMiddleware(routing);

// Turkce pasif: eski /tr URL'lerini /en'e yonlendir (next-intl islemeden once).
export default function middleware(req: NextRequest) {
  const { pathname } = req.nextUrl;
  if (pathname === '/tr' || pathname.startsWith('/tr/')) {
    const url = req.nextUrl.clone();
    url.pathname = pathname.replace(/^\/tr(?=\/|$)/, '/en') || '/en';
    return NextResponse.redirect(url, 308);
  }
  return intlMiddleware(req);
}

export const config = {
  matcher: ['/((?!api|_next|_vercel|.*\\..*).*)'],
};
