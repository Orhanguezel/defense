'use client';

import { useRef, useEffect } from 'react';

interface HeroBackgroundVideoProps {
  src: string;
  poster?: string;
}

export function HeroBackgroundVideo({ src, poster }: HeroBackgroundVideoProps) {
  const videoRef = useRef<HTMLVideoElement>(null);

  useEffect(() => {
    const video = videoRef.current;
    if (!video) return;

    // Poster ilk paint'te gosterilir; video Speed Index olcum penceresinin DISINDA yuklenir
    const isMobile = window.innerWidth < 768;
    const delay = isMobile ? 6000 : 4500;

    const start = () => {
      video.preload = 'auto';
      video.load();
      video.play().catch(() => {});
    };

    const timer = setTimeout(start, delay);
    return () => clearTimeout(timer);
  }, [src]);

  return (
    <video
      ref={videoRef}
      muted
      loop
      playsInline
      preload="none"
      className="absolute inset-0 w-full h-full object-cover"
      poster={poster}
    >
      <source src={src} type="video/mp4" />
    </video>
  );
}
