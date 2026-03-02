#!/usr/bin/env bash
# download-katex.sh — Download and install KaTeX assets for gruv-terminus
#
# Run this script from the root of the repository:
#   ./scripts/download-katex.sh
#
# Assets are placed in:
#   static/css/katex.min.css
#   static/js/katex.min.js
#   static/js/auto-render.min.js
#   static/fonts/katex/

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

# --- Resolve latest KaTeX version ---
echo "Fetching latest KaTeX release info..."
RELEASE_JSON="$(curl -sSf "https://api.github.com/repos/KaTeX/KaTeX/releases/latest")"
VERSION="$(echo "$RELEASE_JSON" | grep '"tag_name"' | head -1 | sed 's/.*"tag_name": *"\([^"]*\)".*/\1/')"

if [[ -z "$VERSION" ]]; then
    echo "Error: could not determine latest KaTeX version." >&2
    exit 1
fi

echo "Downloading KaTeX ${VERSION}..."
TARBALL_URL="https://github.com/KaTeX/KaTeX/releases/download/${VERSION}/katex.tar.gz"
curl -sSfL "$TARBALL_URL" -o "$TMP_DIR/katex.tar.gz"

echo "Extracting..."
tar -xzf "$TMP_DIR/katex.tar.gz" -C "$TMP_DIR"

KATEX_DIR="$TMP_DIR/katex"

# --- Destination directories ---
CSS_DEST="$REPO_ROOT/static/css"
JS_DEST="$REPO_ROOT/static/js"
FONTS_DEST="$REPO_ROOT/static/fonts/katex"

mkdir -p "$CSS_DEST" "$JS_DEST" "$FONTS_DEST"

# --- Copy assets ---
cp "$KATEX_DIR/katex.min.js"                 "$JS_DEST/katex.min.js"
cp "$KATEX_DIR/contrib/auto-render.min.js"   "$JS_DEST/auto-render.min.js"
cp "$KATEX_DIR"/fonts/KaTeX_*                "$FONTS_DEST/"

# --- Copy and patch CSS font paths ---
# KaTeX's CSS references fonts as `fonts/KaTeX_*` (relative to the CSS file).
# Zola serves katex.min.css from /css/ and fonts from /fonts/katex/,
# so the relative path from CSS to fonts must be ../fonts/katex/.
sed 's|fonts/KaTeX_|../fonts/katex/KaTeX_|g' \
    "$KATEX_DIR/katex.min.css" > "$CSS_DEST/katex.min.css"

echo ""
echo "KaTeX ${VERSION} installed successfully:"
echo "  ${CSS_DEST##"$REPO_ROOT/"}/katex.min.css"
echo "  ${JS_DEST##"$REPO_ROOT/"}/katex.min.js"
echo "  ${JS_DEST##"$REPO_ROOT/"}/auto-render.min.js"
echo "  static/fonts/katex/ ($(ls "$FONTS_DEST" | wc -l | tr -d ' ') font files)"
echo ""
echo "Enable KaTeX in config.toml:"
echo "  [extra]"
echo "  katex = true          # enable globally"
echo ""
echo "Or per-page in front matter:"
echo "  [extra]"
echo "  katex = true"
