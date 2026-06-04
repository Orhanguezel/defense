import { ImageResponse } from 'next/og';

export const runtime = 'nodejs';
export const size = {
  width: 64,
  height: 64,
};
export const contentType = 'image/png';

export default function Icon() {
  return new ImageResponse(
    (
      <div
        style={{
          width: '100%',
          height: '100%',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          background: '#1A1A1D',
          color: '#C5A880',
          borderRadius: 14,
          fontSize: 30,
          fontWeight: 900,
          fontFamily: 'Inter, Arial, sans-serif',
        }}
      >
        SD
      </div>
    ),
    size,
  );
}
