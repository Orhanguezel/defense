import { ImageResponse } from 'next/og';
import { SD_PALETTE_HEX as C } from '@/lib/sultandefense-palette-hex';

export const runtime = 'nodejs';
export const alt = 'Sultan Defense';
export const size = {
  width: 1200,
  height: 600,
};
export const contentType = 'image/png';

export default function TwitterImage() {
  return new ImageResponse(
    (
      <div
        style={{
          width: '100%',
          height: '100%',
          display: 'flex',
          background: C.surfaceBaseDark,
          color: C.sectionWhite,
          padding: '48px',
          fontFamily: 'Arial, sans-serif',
        }}
      >
        <div
          style={{
            display: 'flex',
            flex: 1,
            flexDirection: 'column',
            justifyContent: 'space-between',
            border: '1px solid rgba(184, 134, 45, 0.2)',
            borderRadius: 24,
            padding: '40px',
            background: 'linear-gradient(180deg, rgba(212, 168, 67, 0.06), rgba(212, 168, 67, 0))',
          }}
        >
          <div
            style={{
              display: 'flex',
              fontSize: 20,
              textTransform: 'uppercase',
              letterSpacing: 4,
              color: C.gold500,
              fontWeight: 600,
            }}
          >
            Sultan Defense
          </div>
          <div style={{ display: 'flex', flexDirection: 'column', gap: 16 }}>
            <div
              style={{
                display: 'flex',
                fontSize: 64,
                fontWeight: 700,
                lineHeight: 1.06,
                maxWidth: 900,
                color: C.textOnDarkHead,
                letterSpacing: -2,
              }}
            >
              Defense Procurement and Export Partner
            </div>
            <div style={{ display: 'flex', fontSize: 26, color: C.textOnDarkBody, maxWidth: 900 }}>
              Tactical equipment, certified sourcing and export coordination for global security buyers.
            </div>
          </div>
          <div
            style={{
              display: 'flex',
              justifyContent: 'space-between',
              fontSize: 20,
              color: C.textOnDarkMuted,
            }}
          >
            <div style={{ display: 'flex' }}>sultandefense.com</div>
            <div style={{ display: 'flex', color: C.gold500, fontWeight: 600 }}>
              Compliance · Sourcing · Export
            </div>
          </div>
        </div>
      </div>
    ),
    size,
  );
}
