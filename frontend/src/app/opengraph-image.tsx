import { ImageResponse } from 'next/og';
import { SD_PALETTE_HEX as C } from '@/lib/sultandefense-palette-hex';

export const runtime = 'nodejs';
export const alt = 'Sultan Defense';
export const size = {
  width: 1200,
  height: 630,
};
export const contentType = 'image/png';

export default function OpenGraphImage() {
  return new ImageResponse(
    (
      <div
        style={{
          width: '100%',
          height: '100%',
          display: 'flex',
          flexDirection: 'column',
          justifyContent: 'space-between',
          background: `linear-gradient(135deg, ${C.gold950} 0%, ${C.soil900} 42%, ${C.gold900} 100%)`,
          color: C.sectionWhite,
          padding: '56px',
          fontFamily: 'Arial, sans-serif',
        }}
      >
        {/* Header */}
        <div
          style={{
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'space-between',
          }}
        >
          <div
            style={{
              display: 'flex',
              fontSize: 22,
              letterSpacing: 4,
              textTransform: 'uppercase',
              color: C.gold400,
              fontWeight: 600,
            }}
          >
            Sultan Defense
          </div>
          <div
            style={{
              display: 'flex',
              width: 80,
              height: 3,
              background: C.gold550,
            }}
          />
        </div>

        {/* Main content */}
        <div style={{ display: 'flex', flexDirection: 'column', gap: 20 }}>
          <div
            style={{
              display: 'flex',
              fontSize: 72,
              lineHeight: 1.08,
              fontWeight: 700,
              maxWidth: 900,
              color: C.textOnDarkHead,
              letterSpacing: -2,
            }}
          >
            Defense Procurement
          </div>
          <div
            style={{
              display: 'flex',
              fontSize: 28,
              color: C.gold300,
              maxWidth: 820,
            }}
          >
            Tactical equipment and defense technologies for qualified B2B procurement.
          </div>
        </div>

        {/* Footer */}
        <div
          style={{
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'space-between',
            fontSize: 22,
            color: C.green500,
          }}
        >
          <div style={{ display: 'flex' }}>sultandefense.com</div>
          <div style={{ display: 'flex', color: C.gold400, fontWeight: 600 }}>
            Compliance · Sourcing · Export
          </div>
        </div>
      </div>
    ),
    size,
  );
}
