#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$root"

flutter build web --release --base-href /

git add -f build/web
if git diff --staged --quiet; then
  echo "build/web unchanged — nothing to deploy."
  exit 0
fi

git commit -m "build: web release for gh-pages"

git subtree push --prefix build/web origin gh-pages
