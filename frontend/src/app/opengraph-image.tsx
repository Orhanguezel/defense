import { ImageResponse } from 'next/og';

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
          background: 'linear-gradient(135deg, #121214 0%, #1A1A1D 60%, #2D3134 100%)',
          color: '#ffffff',
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
              color: '#C5A880',
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
              background: '#C5A880',
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
              color: '#f0ece6',
              letterSpacing: -2,
            }}
          >
            Savunma Tedarik ve İhracat Çözümleri
          </div>
          <div
            style={{
              display: 'flex',
              fontSize: 28,
              color: '#c8c2b8',
              maxWidth: 820,
            }}
          >
            Taktik ekipman, zırh sistemleri ve ihracat süreçlerinde güvenilir çözüm ortağı.
          </div>
        </div>

        {/* Footer */}
        <div
          style={{
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'space-between',
            fontSize: 22,
            color: '#8c8880',
          }}
        >
          <div style={{ display: 'flex' }}>sultandefense.com</div>
          <div style={{ display: 'flex', color: '#C5A880', fontWeight: 600 }}>
            Tedarik · Uyum · İhracat
          </div>
        </div>
      </div>
    ),
    size,
  );
}
