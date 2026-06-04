import { ImageResponse } from 'next/og';

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
          background: '#121214',
          color: '#ffffff',
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
            border: '1px solid rgba(197,168,128,0.20)',
            borderRadius: 24,
            padding: '40px',
            background: 'linear-gradient(180deg, rgba(197,168,128,0.04), rgba(197,168,128,0.00))',
          }}
        >
          <div
            style={{
              display: 'flex',
              fontSize: 20,
              textTransform: 'uppercase',
              letterSpacing: 4,
              color: '#C5A880',
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
                color: '#f0ece6',
                letterSpacing: -2,
              }}
            >
              Savunma Tedarikinde Güvenilir Çözüm Ortağı
            </div>
            <div style={{ display: 'flex', fontSize: 26, color: '#c8c2b8', maxWidth: 900 }}>
              Taktik ekipman, zırh sistemleri ve ihracat süreçlerinde güvenilir çözüm ortağı.
            </div>
          </div>
          <div
            style={{
              display: 'flex',
              justifyContent: 'space-between',
              fontSize: 20,
              color: '#8c8880',
            }}
          >
            <div style={{ display: 'flex' }}>sultandefense.com</div>
            <div style={{ display: 'flex', color: '#C5A880', fontWeight: 600 }}>
              Tedarik · Uyum · İhracat
            </div>
          </div>
        </div>
      </div>
    ),
    size,
  );
}
