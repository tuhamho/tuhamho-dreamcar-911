# TUHAMHO — 911 Black

A cinematic Porsche 911 concept website with scroll-controlled video, chapter sections, and a selectable music playlist.

## Run locally

Run `bash scripts/build.sh`, then serve the generated `dist/` folder with any static web server. The build script reconstructs the video and music files from ordered binary chunks before copying the site into `dist/`.

## Deploy to Vercel

Import this repository into Vercel. The included `vercel.json` runs the build script and publishes `dist/` automatically.

Browsers may require one user interaction before playing audible music.

Independent concept project; not affiliated with Porsche AG.
