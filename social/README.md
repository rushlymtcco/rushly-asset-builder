# Rushly — Social Media Assets

On-brand, editable social post templates for **Rushly × Partner** campaigns
(default partner: Avenue Bakery). Built from the tokens in
[`../STYLE_GUIDE.md`](../STYLE_GUIDE.md).

## What's here

| File | Purpose |
|------|---------|
| **`STYLE_GUIDE.html`** | ⭐ The visual social-media style guide. Open in a browser. |
| `index.html` | Preview gallery of all four post templates. |
| `square.html` | Instagram square — 1080×1080 |
| `portrait.html` | Portrait feed — 1080×1350 |
| `story.html` | Story / Reel — 1080×1920 |
| `landscape.html` | Facebook / link — 1200×630 |
| `*-minimal.html` | **Style B** — image-forward variants (big photo, short copy) in all four formats |
| `collab-*.html` | **Style C** — tonal/embossed collab (square/portrait/story/landscape) + `collab-light-square.html` |

**Three styles:**
- *Editorial* (`square.html` …) leads with the message — tag, headline, subcopy, chips, CTA.
- *Minimal* (`*-minimal.html`) leads with a large photo + lockup + one short headline + URL.
- *Collab* — premium, minimal co-brand drop. Two looks:
  - **Over photo** (`collab-photo-*.html`) — *recommended*. A dimmed partner
    photo backdrop, the detailed Rushly mark (tan, outlines kept), the real
    partner logo in a white badge, and the **partner's own accent color** on
    the `×` and tracked small text. Set `--accent` inline per partner.
    Per-partner examples: `-cutler` (golden), `-donut` (pink), `-avenue-af` (coral).
  - **Solid** — `collab-*.html` (tonal navy) and `collab-light-square.html` (cream).

**Partner assets:** transparent logos in `assets/logo-*.png`; storefront photos
in `assets/<partner>.png|jpeg`. Accent colors: Avenue `#E2876F`, Cutler
`#ECD877`, Donut Star `#F2A6B5`.

**Rushly mark on dark/photo/gel:** the **standard** `rushly-logo.png` (navy
wordmark + tan box) seated in a cream chip (`.cp__rushly`), matching the partner
cream badge — full brand color, high contrast on any backdrop.

Asset images in the collab-photo templates carry a `?v=N` cache-buster — bump
N when you replace a logo or photo so browsers re-fetch it.
| `social.css` | Shared brand styles for the post templates. |
| `COPY.md` | Captions + the three message angles (swap-in copy). |
| `assets/` | Logos and partner storefront photos. |
| `exports/` | Pre-rendered PNGs of each post. |

## Editing a post
1. Open the format's `.html` file. Edit the partner name, headline (`<em>` = tan
   italic accent word), subcopy, chips, and footer.
2. To change the message angle, paste a block from `COPY.md`.
3. To re-skin for another partner, swap the name everywhere and change the photo
   in `assets/` (other partners' photos are already included).

## Exporting to PNG
**Easiest:** open the file in Chrome, DevTools → ⋯ → *Capture node screenshot* on the `.post` element.

**Scripted (Chrome/Chromium headless):**
```bash
CHROME="/path/to/Google Chrome"   # or chromium
"$CHROME" --headless=new --force-device-scale-factor=2 \
  --window-size=1080,1080 --screenshot=square.png \
  "file://$PWD/square.html"
```
Use `--force-device-scale-factor=2` for crisp 2× output. Match `--window-size`
to each format's dimensions. (The `exports/` PNGs were produced this way at 1×.)

## Fonts
Montserrat, Lato, and Playfair Display load from Google Fonts via `social.css`
(internet required for an exact render).
