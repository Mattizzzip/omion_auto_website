#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$root"

flutter build web --release --base-href / --no-web-resources-cdn --no-wasm-dry-run
python3 scripts/patch_web_bootstrap.py build/web/flutter_bootstrap.js

git add -f build/web
if git diff --staged --quiet; then
  echo "build/web unchanged — nothing to deploy."
  exit 0
fi

git commit -m "build: web release for gh-pages"

if ! git subtree push --prefix build/web origin gh-pages; then
  echo "subtree push failed; retrying with split + force push to gh-pages..."
  git subtree split --prefix build/web -b deploy-gh-pages
  git push origin deploy-gh-pages:gh-pages --force
  git branch -D deploy-gh-pages
fi
