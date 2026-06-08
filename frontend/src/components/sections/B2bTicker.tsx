'use client';

type B2bTickerProps = {
  /** Pipe-separated phrases, e.g. "Defense & Tactical Supply | Bulk Orders" */
  text?: string;
};

export function B2bTicker({ text }: B2bTickerProps) {
  const phrases = text
    ? text.split('|').map((p) => p.trim()).filter(Boolean)
    : [];

  if (!phrases.length) return null;

  return (
    <div
      className="b2b-ticker-wrap relative z-10 overflow-hidden border-y py-3"
      style={{
        borderColor: 'color-mix(in srgb, var(--color-brand) 35%, transparent)',
        background: 'color-mix(in srgb, var(--color-bg-dark) 80%, transparent)',
      }}
    >
      <style>{`
        @keyframes b2b-ticker-scroll { from { transform: translateX(0); } to { transform: translateX(-50%); } }
        .b2b-ticker-track { display:inline-flex; white-space:nowrap; animation: b2b-ticker-scroll 38s linear infinite; }
        .b2b-ticker-wrap:hover .b2b-ticker-track { animation-play-state: paused; }
        @media (prefers-reduced-motion: reduce){ .b2b-ticker-track { animation: none; } }
      `}</style>
      <div className="b2b-ticker-track">
        {[0, 1].map((dup) => (
          <span key={dup} className="inline-flex shrink-0" aria-hidden={dup === 1}>
            {phrases.map((phrase, i) => (
              <span
                key={`${dup}-${i}`}
                className="inline-flex items-center px-6 text-[12px] font-semibold uppercase tracking-[0.18em] text-(--section-bg-white) sm:text-[13px]"
              >
                <span className="mr-6 inline-block size-1.5 rounded-full bg-(--color-brand)" />
                {phrase}
              </span>
            ))}
          </span>
        ))}
      </div>
    </div>
  );
}
