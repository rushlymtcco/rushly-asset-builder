# Making the Rushly business cards yourself

The card is a single HTML file — [`card.html`](card.html). You edit the text/styles,
then "screenshot" it at high resolution to get a print-ready PNG. There are two
paths depending on how hands-on you want to be.

---

## The pieces

| File | What it is |
|------|------------|
| `card.html` | The card design (both fronts + the back). Edit this. |
| `assets/` | Logos used by the card (`rushly-logo.png`, etc.). |
| `exports/card-*.png` | The rendered cards (what you download/print). |
| `downloads/rushly-business-card.zip` | The kit: HTML + all rendered sides. |

The card has **three faces**, each with its own preview in `card.html`:

| Face | Export name |
|------|-------------|
| Navy front (with plaque) | `front` |
| Cream front (no plaque) | `front-cream` |
| Back (locations + blank QR) | `back` |

---

## Path A — no code (Canva / any image editor)

Best if you just want to tweak wording or drop in your QR.

1. Open the rendered PNG you want from `exports/` (e.g. `card-back.png`).
2. Bring it into Canva / Photoshop / Figma as a background.
3. **Add your QR:** generate one (see below) and place it in the blank QR area
   on the left of the back.
4. Edit any text by laying new text on top, or just use it as-is.
5. Export as PNG/PDF.

> The QR area is the open space on the left of the back (no box). On screen
> it's marked with a dashed guide; that guide does **not** appear in the
> exported PNG, so just drop your QR there and center it (~290 px square).

---

## Path B — edit the source (full control, stays crisp)

### 1. Open it
Double-click `card.html` to open it in **Google Chrome**. You'll see all three
faces previewed at half size.

### 2. Edit the content
Open `card.html` in any text editor (even TextEdit). The parts you'll change
are plain text — look for these:

- **Tagline** (front): `Same-day delivery<br>to the <em>Provo&nbsp;MTC</em>`
  — the word in `<em>…</em>` is the italic gold accent.
- **Headline** (back): `Four seriously <em>sweet</em> drop-off locations…`
- **Locations** (back): each line is
  `<span class="loc__name">Cutler Cookie Co.</span><span class="loc__city">Bountiful</span>`
  — change the name and city.
- **CTA** (back): `Scan the code or visit us at <b>www.RushlyMTC.com</b>`

Colors live at the top in `:root` (`--navy`, `--tan`, `--cream`). Change a hex
there and it updates everywhere.

### 3. Add your QR (in code)
1. Save your QR image into `assets/` (e.g. `assets/qr.png`).
2. In `card.html`, find the back's QR panel:
   ```html
   <div class="qr">
     <span class="qr__hint">Add your<br>QR code</span>
   </div>
   ```
   Replace the inner `<span>` with your image:
   ```html
   <div class="qr">
     <img src="assets/qr.png" alt="QR code" style="width:236px;height:236px">
   </div>
   ```

### 4. Export at print quality

**Easiest (no terminal):**
1. In Chrome, open the face you want with its export name in the address bar:
   `file:///…/card.html?export=front`  (or `front-cream`, or `back`)
   — this shows that one card alone at full size (1050×600).
2. Right-click the card → **Inspect**.
3. In the panel, hover until the `<div class="card …">` element is highlighted,
   right-click it → **Capture node screenshot**. The PNG downloads.

**Crisp 2× (terminal, Mac):** from inside the `social/` folder:
```bash
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
"$CHROME" --headless=new --force-device-scale-factor=2 \
  --window-size=1050,600 --default-background-color=00000000 \
  --screenshot=card-front.png \
  "file://$PWD/card.html?export=front"
```
Swap `front` → `front-cream` or `back` and the output name to render the others.

---

## Generating a QR code

Use any free generator (e.g. qr-code-generator.com) pointing to
`https://www.RushlyMTC.com`. To match the brand:

- **Color:** navy `#2D425B`
- **Style:** rounded dots + rounded corner "eyes" (most generators have this)
- **Background:** transparent or white
- Download as **PNG**, then place it per Path A or B above.

---

## Printing

The cards are **3.5 × 2 in** (1050 × 600 px at 300 dpi) — the standard US
business-card size, no bleed.

Most printers want **0.125 in of bleed** (a little extra image past the trim
edge). To add it, export at **1125 × 675** and keep important text ~0.15 in away
from the edges, or just hand the printer the 1050×600 file and ask them to add
bleed. Send as **PDF** or **300 dpi PNG**.

---

## Re-zipping the kit

After changing the cards, rebuild the download bundle:
```bash
bash downloads/build.sh
```
This refreshes every ZIP in `downloads/` (icons, logos, posts, business card).
