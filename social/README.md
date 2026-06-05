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

**Two styles:** *Editorial* (`square.html` etc.) leads with the message — tag,
headline, subcopy, chips, CTA. *Minimal* (`*-minimal.html`) leads with a large
photo and just a lockup + one short headline + URL.
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
