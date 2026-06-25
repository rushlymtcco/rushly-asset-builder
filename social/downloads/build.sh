#!/usr/bin/env bash
# Rebuild the downloadable asset bundles linked from STYLE_GUIDE.html.
# Run from the `social/` directory:  bash downloads/build.sh
set -euo pipefail
cd "$(dirname "$0")/.."

echo "Building download bundles…"

# 1) Highlight icons — the 6 IG covers
rm -f downloads/rushly-highlight-icons.zip
( cd exports/highlights && zip -q -j -X "../../downloads/rushly-highlight-icons.zip" highlight-*.png )

# 2) Brand logos + app icon (transparent PNGs)
rm -f downloads/rushly-logos.zip
zip -q -j -X downloads/rushly-logos.zip \
  assets/rushly-logo.png assets/rushly-logo_alt2.png assets/rushly-logo_alt3.png \
  assets/rushly-logo_alt4.png assets/rushly-logo_grey.png assets/rushly-logo_motto.png \
  assets/rushly-icon.png

# 3) Post templates — every rendered post PNG
rm -f downloads/rushly-post-templates.zip
zip -q -j -X downloads/rushly-post-templates.zip exports/post-*.png

# 4) Business card — editable HTML + both rendered sides (QR area left blank)
rm -f downloads/rushly-business-card.zip
zip -q -j -X downloads/rushly-business-card.zip card.html exports/card-front.png exports/card-back.png

echo "Done:"
ls -lh downloads/*.zip
