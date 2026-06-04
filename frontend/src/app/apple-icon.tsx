import { ImageResponse } from 'next/og';

export const runtime = 'nodejs';
export const size = {
  width: 180,
  height: 180,
};
export const contentType = 'image/png';

export default function AppleIcon() {
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
          borderRadius: 36,
          fontSize: 68,
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
