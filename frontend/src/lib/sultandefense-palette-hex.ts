/**
 * OG ImageResponse, manifest ve benzeri ortamlar CSS custom property okuyamaz.
 * Anlamları `src/styles/globals.css` (sultan-imperial-armor primitive) ile hizalıdır.
 * Tema: Antrasit + Mat Osmanlı Altını + Derin Bordo.
 */
export const SD_PALETTE_HEX = {
  gold950: '#241c13',
  soil900: '#1a1a1d', // Antrasit
  gold900: '#3e2f20',
  gold800: '#5c4730',
  gold550: '#8c6f3f',
  gold500: '#c5a880', // Mat Osmanlı Altını
  gold400: '#d4b996',
  gold300: '#d9c2a0',
  green900: '#3a0c10', // Derin bordo (koyu)
  green500: '#93262d', // Bordo
  sectionWhite: '#ffffff',
  textOnDarkHead: '#edeae3',
  textOnDarkBody: '#cbc6bd',
  textOnDarkMuted: '#9a968c',
  surfaceBaseDark: '#1a1a1d',
} as const;
