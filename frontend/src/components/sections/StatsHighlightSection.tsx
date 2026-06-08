'use client';

import { useEffect, useRef, useState } from 'react';

type StatItem = {
  /** Display value, may include a non-numeric suffix e.g. "20+" */
  value: string | number;
  label: string;
};

type StatsHighlightSectionProps = {
  /** Left vertical heading, e.g. "B2B EXPORT" */
  title?: string;
  items: StatItem[];
};

/** Split "376+" -> { num: 376, suffix: "+" } ; "20" -> { num: 20, suffix: "" } */
function parseValue(value: string | number): { num: number; suffix: string; raw: string } {
  const raw = String(value).trim();
  const match = raw.match(/^(\d+)(.*)$/);
  if (!match) return { num: 0, suffix: '', raw };
  return { num: Number(match[1]), suffix: match[2] ?? '', raw };
}

function AnimatedValue({ value, start }: { value: string | number; start: boolean }) {
  const { num, suffix, raw } = parseValue(value);
  const [displayValue, setDisplayValue] = useState(0);

  useEffect(() => {
    if (!start || num <= 0) return;

    let frame = 0;
    const duration = 1400;
    const startedAt = performance.now();

    const tick = (now: number) => {
      const progress = Math.min((now - startedAt) / duration, 1);
      const eased = 1 - Math.pow(1 - progress, 3);
      setDisplayValue(Math.round(num * eased));
      if (progress < 1) frame = requestAnimationFrame(tick);
    };

    frame = requestAnimationFrame(tick);
    return () => cancelAnimationFrame(frame);
  }, [start, num]);

  if (num <= 0) return <span>{raw}</span>;
  return (
    <span>
      {displayValue}
      {suffix}
    </span>
  );
}

export function StatsHighlightSection({ title, items }: StatsHighlightSectionProps) {
  const sectionRef = useRef<HTMLElement | null>(null);
  const [started, setStarted] = useState(false);

  useEffect(() => {
    const node = sectionRef.current;
    if (!node || !items.length || started) return;

    const observer = new IntersectionObserver(
      ([entry]) => {
        if (!entry?.isIntersecting) return;
        setStarted(true);
        observer.disconnect();
      },
      { threshold: 0.3 },
    );

    observer.observe(node);
    return () => observer.disconnect();
  }, [started, items.length]);

  if (!items.length) return null;

  return (
    <section
      ref={sectionRef}
      className="relative z-10 flex min-h-[80vh] flex-col items-center justify-center overflow-hidden py-16"
    >
      {/* okunabilirlik icin koyu scrim (arka plan resmi gorunur kalir) */}
      <div className="pointer-events-none absolute inset-0 bg-black/55" aria-hidden="true" />

      <div className="relative mx-auto flex max-w-7xl flex-col gap-5 px-4 py-10 lg:flex-row lg:items-stretch lg:gap-6 lg:px-6 lg:py-14">
        {/* Sol dik başlık */}
        {title && (
          <div className="flex shrink-0 items-center lg:items-stretch">
            <h2
              className="text-xl font-black uppercase leading-none tracking-[0.28em] text-(--color-brand-light) lg:[writing-mode:vertical-rl] lg:rotate-180 lg:py-2"
              style={{ fontFamily: 'var(--font-heading)' }}
            >
              {title}
            </h2>
            <span className="ml-4 hidden w-px self-stretch bg-(--color-brand)/40 lg:block" aria-hidden="true" />
          </div>
        )}

        {/* 4'lü istatistik */}
        <div className="grid flex-1 grid-cols-2 gap-4 lg:grid-cols-4 lg:gap-5">
          {items.map((item) => (
            <div
              key={item.label}
              className="flex flex-col justify-center border px-4 py-5 lg:px-6 lg:py-6"
              style={{
                background: 'linear-gradient(180deg, var(--color-brand-light) 0%, var(--color-brand) 100%)',
                borderColor: 'color-mix(in srgb, var(--section-bg-white) 18%, transparent)',
                boxShadow: 'inset 0 1px 0 color-mix(in srgb, var(--section-bg-white) 16%, transparent)',
              }}
            >
              <div
                className="text-3xl font-black leading-none text-(--section-bg-white) sm:text-4xl"
                style={{ fontFamily: 'var(--font-heading)' }}
              >
                <AnimatedValue value={item.value} start={started} />
              </div>
              <p className="mt-2 text-sm font-medium leading-tight text-(--section-bg-white)/95 sm:text-base">
                {item.label}
              </p>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
