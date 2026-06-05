# Rushly — Brand & Style Guide

> Extracted from the production `rushly-v2` codebase (Next.js 16 / Tailwind v4 / `app/globals.css`).
> Use this as the single source of truth when building assets — emails, landing pages, PDFs, labels, ads — so everything stays on-brand.

Rushly is a same-day care-package delivery service to the Provo MTC. The visual language is **warm, trustworthy, and premium-but-approachable**: deep navy paired with a soft tan/cream palette, bold geometric sans headings with an occasional elegant italic serif accent.

---

## 1. Color Palette

The entire system runs on **9 core tokens**. Define them once and reference everywhere.

| Token       | Hex       | Role                                                        |
|-------------|-----------|-------------------------------------------------------------|
| `--navy`    | `#2D425B` | Primary brand color. Headlines, dark surfaces, primary CTAs |
| `--navy2`   | `#3A5270` | Lighter navy — **only** as the second stop in gradients     |
| `--tan`     | `#D6AB7F` | Accent / highlight. Italic accents, eyebrows, selected state, secondary CTAs |
| `--tan2`    | `#E8C9A0` | Lighter tan — hover state for tan elements, gradient stop    |
| `--cream`   | `#F7F3EE` | Page / section background, input fill                       |
| `--cream2`  | `#EDE6DC` | Borders, dividers, inactive tracks                          |
| `--muted`   | `#7A8FA6` | Secondary text, labels, captions                            |
| `--white`   | `#FFFFFF` | Cards, primary background                                   |
| `--red`     | `#D94F4F` | Errors and required-field markers only                     |

```css
:root {
  --navy:   #2D425B;
  --navy2:  #3a5270;
  --tan:    #D6AB7F;
  --tan2:   #e8c9a0;
  --cream:  #F7F3EE;
  --cream2: #EDE6DC;
  --muted:  #7a8fa6;
  --white:  #ffffff;
  --red:    #d94f4f;
}
```

### Signature gradient (the "navy header")
The recurring dark surface — used on card headers, hero panels, total bars, success rings:
```css
background: linear-gradient(140deg, var(--navy) 0%, var(--navy2) 100%);
```
Often decorated with faint translucent circles for depth:
```css
/* large soft white circle, top-right */
background: rgba(255,255,255,0.04);
/* warm tan glow */
background: rgba(214,171,127,0.07);
```

### Common alpha values (for tints over light/dark)
- Tan tint backgrounds: `rgba(214,171,127,0.10–0.15)` with border `rgba(214,171,127,0.25–0.30)`
- Tan focus ring: `0 0 0 3px rgba(214,171,127,0.15)`
- Navy card shadow: `0 12px 48px rgba(45,66,91,0.12), 0 2px 8px rgba(45,66,91,0.06)`
- Text on navy: white at `0.5` (subtitles), `0.38` (captions), tan at `0.55–0.75` (eyebrows)

---

## 2. Typography

Three Google fonts, each with a distinct job. Loaded via `next/font` and exposed as CSS variables.

| Font                  | CSS var             | Weights        | Used for |
|-----------------------|---------------------|----------------|----------|
| **Montserrat**        | `--font-montserrat` | 700, 800, 900  | Headings, eyebrows, labels, buttons, prices, logo |
| **Lato**              | `--font-lato`       | 300, 400, 700  | Body copy, paragraphs, input values |
| **Playfair Display**  | `--font-playfair`   | 400, 700 + *italic* | Elegant italic accents **inside** headings only |

```
Headings / UI  →  Montserrat, 900 (hero) · 800 (labels/buttons) · 700 (eyebrows)
Body           →  Lato, 400 · 700 for emphasis · 300 light
Accent         →  Playfair Display, italic — the "em" word in a headline
```

### The signature headline pattern
The brand's most recognizable type treatment: a bold Montserrat heading with **one word italicized in Playfair + tan**.

```html
<h1 class="heading">Same-day delivery, <em>done right</em>.</h1>
```
```css
.heading {
  font-family: var(--font-montserrat), Montserrat, sans-serif;
  font-weight: 900;
  line-height: 1.1;
  color: var(--navy);
}
.heading em {
  font-family: var(--font-playfair), "Playfair Display", serif;
  font-style: italic;
  color: var(--tan);
}
```

### Eyebrow (kicker) — appears above most headings
```css
.eyebrow {
  font-family: var(--font-montserrat), Montserrat, sans-serif;
  font-size: 12px;            /* 9px in compact card UI */
  font-weight: 700;
  letter-spacing: 0.22em;     /* tight cards use 2.5–3px */
  text-transform: uppercase;
  color: var(--tan);
}
```

### Type scale
Marketing uses fluid `clamp()`; product/card UI uses fixed px.

| Use                         | Size                          | Weight | Font |
|-----------------------------|-------------------------------|--------|------|
| Hero headline               | `clamp(36px, 4.5vw, 56px)`    | 900    | Montserrat |
| Page / section heading      | `clamp(2rem, 4vw, 3rem)`      | 900    | Montserrat |
| Sub-section heading         | `clamp(1.8rem, 3.5vw, 2.6rem)`| 900    | Montserrat |
| Card title (compact UI)     | `28px`                        | 900    | Montserrat |
| Price / big number          | `26–32px`                     | 900    | Montserrat |
| Field label                 | `9px`, letter-spacing `2.5px` | 700    | Montserrat |
| Eyebrow                     | `9–12px`, letter-spacing `0.22em` | 700 | Montserrat |
| Body / description          | `15–17px`, line-height `1.6–1.8` | 400 | Lato |
| Small / caption / muted     | `11–13px`                     | 400    | Lato |

Body line-height runs generous: **1.6–1.8**. Headlines tight: **1.08–1.2**.

---

## 3. Buttons

Three button styles. All use Montserrat 800, ~13–14px, radius 10px, `transition: all 0.2s`.

### Primary (navy) — main actions
```css
.btn-primary {
  background: var(--navy);
  color: var(--white);
  padding: 13px 24px;
  border-radius: 10px;
  font: 800 13px var(--font-montserrat), sans-serif;
  letter-spacing: 0.3px;
}
.btn-primary:hover {
  background: var(--navy2);
  transform: translateY(-1px);
  box-shadow: 0 4px 12px rgba(45,66,91,0.2);
}
```

### Accent (tan) — conversion / "Next" / confirm
```css
.btn-accent {
  background: var(--tan);
  color: var(--white);   /* on dark backgrounds, use navy text */
}
.btn-accent:hover {
  background: var(--tan2);
  transform: translateY(-1px);
  box-shadow: 0 5px 18px rgba(214,171,127,0.38);
}
```

### Outline / Back — secondary, low emphasis
```css
.btn-outline {
  background: transparent;
  border: 2px solid var(--cream2);
  color: var(--muted);
}
.btn-outline:hover { border-color: var(--navy); color: var(--navy); }
```

**Loading state:** swap background to `--navy`, `cursor: not-allowed`, `opacity: 0.85`, show a 14px spinner (`border: 2px solid rgba(255,255,255,0.3)`, top white, `0.7s linear infinite`).

---

## 4. Form Controls

Inputs sit on **cream** with a **cream2 border**, and shift to white with a **tan focus ring** when active.

```css
.input {
  background: var(--cream);
  border: 2px solid var(--cream2);
  border-radius: 10px;
  padding: 13px 14px;
  font: 700 15px var(--font-lato), sans-serif;
  color: var(--navy);
  transition: all 0.2s;
}
.input::placeholder { color: rgba(45,66,91,0.22); font-weight: 400; }
.input:focus {
  border-color: var(--tan);
  background: var(--white);
  box-shadow: 0 0 0 3px rgba(214,171,127,0.15);
}
.input.error {
  border-color: var(--red);
  background: #fff5f5;
  box-shadow: 0 0 0 3px rgba(217,79,79,0.12);
}
```
- **Labels:** Montserrat 700, 9px, uppercase, `2.5px` letter-spacing, color `--muted`. Required marker `*` in `--red`.
- **Error text:** Montserrat 700, 11px, `--red`.
- **Selected / checked state** (cards, radios, checkboxes, pills): border → `--tan`, background → `#fffaf5`, ring `0 0 0 3px rgba(214,171,127,0.12–0.20)`. Checkmarks/dots fill with tan.
- Contact-form variant uses minimalist **underline inputs** (`border-bottom: 1.5px solid #c9c1b6`, focus → tan).

---

## 5. Cards & Surfaces

```css
.card {
  background: var(--white);
  border-radius: 20px;                 /* 16px for marketing cards */
  box-shadow: 0 12px 48px rgba(45,66,91,0.12), 0 2px 8px rgba(45,66,91,0.06);
  overflow: hidden;
}
```
- **Marketing cards:** lighter — `1px solid #e8e2d8` border, radius 16px, less shadow.
- **Card header** = the navy gradient block (see §1), padding ~`32px 36px`, with the eyebrow → title → subtitle stack.
- **Tan info/notice box:** `background: rgba(214,171,127,0.10)`, `border: 1px solid rgba(214,171,127,0.25)`, radius 10px.

---

## 6. Tokens — Radius, Shadow, Spacing, Motion

**Border radius**
| Token | Value | Use |
|-------|-------|-----|
| sm | `6–8px`  | checkboxes, tags, small pills |
| md | `10–12px`| inputs, buttons, info boxes |
| lg | `14–16px`| inner panels, marketing cards |
| xl | `20px`   | primary cards & modals |
| pill | `20–24px` / `50%` | badges, dots, rings |

**Shadows**
- Card: `0 12px 48px rgba(45,66,91,0.12), 0 2px 8px rgba(45,66,91,0.06)`
- Modal: `0 24px 80px rgba(20,32,48,0.3)`
- Button hover (navy): `0 4px 12px rgba(45,66,91,0.2)` · (tan): `0 5px 18px rgba(214,171,127,0.38)`

**Spacing** — card padding `28–36px`, section padding `100px 48px` (desktop), field gaps `14–16px`. Mobile padding drops to `20–24px`.

**Motion**
- Standard transition: `all 0.2s`
- Signature easing: `cubic-bezier(0.22, 1, 0.36, 1)` (soft overshoot) for entrances
- Rise-in: `from { opacity:0; transform: translateY(14px) }` over `0.4–0.5s`
- Hover lift: `transform: translateY(-1px)` (buttons), `-2px` (cards)
- Spinner: `0.7s linear infinite`

---

## 7. Iconography

- Library: **Phosphor Icons** (`@phosphor-icons/react`).
- Default tone: `--navy` at reduced opacity (`0.5–0.65`); shift to full `--tan` on select/active.
- Decorative emoji icons appear in compact product cards at `22–40px`.

---

## 8. Responsive Breakpoints

| Breakpoint | Behavior |
|------------|----------|
| `≤ 900px`  | Multi-column grids collapse to single column; sticky elements go static |
| `≤ 640px`  | Reduced section padding (`100px → 100px 20px`) |
| `≤ 480px`  | Compact card UI: titles `28px → 22px`, padding tightens, 2-col grids → 1-col, stacked totals/results |

Viewport is locked to `width=device-width, initial-scale=1`.

---

## Quick-reference cheat sheet

```
COLORS    navy #2D425B · tan #D6AB7F · cream #F7F3EE · muted #7A8FA6 · red #D94F4F
GRADIENT  linear-gradient(140deg, #2D425B, #3a5270)
HEADINGS  Montserrat 900, navy — accent word in Playfair italic, tan
EYEBROW   Montserrat 700, uppercase, 0.22em tracking, tan
BODY      Lato 400, line-height 1.6–1.8, muted/navy
BUTTONS   navy (primary) · tan (convert) · outline (back) — radius 10, lift on hover
INPUTS    cream fill, cream2 border → tan focus ring
CARDS     white, radius 20, soft navy shadow; header = navy gradient
EASING    cubic-bezier(0.22, 1, 0.36, 1)
```
