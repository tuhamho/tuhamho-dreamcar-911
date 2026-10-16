#!/bin/sh
set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT="$ROOT/dist"

mkdir -p "$OUT/assets"
cp "$ROOT/index.html" "$OUT/index.html"

# Copy the small, directly stored visual assets.
for file in "$ROOT"/assets/*.jpg "$ROOT"/assets/*.webp; do
  [ -f "$file" ] && cp "$file" "$OUT/assets/"
done

# Reassemble media that is stored in ordered GitHub-safe binary chunks.
for asset in \
  porsche-scroll-film.mp4 \
  porsche-black-hero.png \
  kaash-paige-love-songs.m4a \
  my-eyes-travis-scott.mp3 \
  rihanna-stay.m4a \
  son-tung-inspiration.mp3
do
  parts="$ROOT/assets/media-parts/$asset"
  [ -d "$parts" ] || { echo "Missing media parts: $asset" >&2; exit 1; }
  cat "$parts"/*.bin > "$OUT/assets/$asset"
done

echo "Built static site at $OUT"
