#!/usr/bin/env python3
"""Post-process Flutter web bootstrap for GitHub Pages."""

from __future__ import annotations

import re
import sys
from pathlib import Path


def patch_bootstrap(path: Path) -> None:
    text = path.read_text(encoding="utf-8")

    if ",{}]" in text:
        text = text.replace(",{}]", "]")

    text = re.sub(
        r"_flutter\.loader\.load\(\{\s*serviceWorkerSettings:\s*\{[^}]+\}\s*\}\);",
        "_flutter.loader.load();",
        text,
        flags=re.S,
    )

    path.write_text(text, encoding="utf-8")


def main() -> int:
    bootstrap = Path(sys.argv[1] if len(sys.argv) > 1 else "build/web/flutter_bootstrap.js")
    if not bootstrap.is_file():
        print(f"Missing {bootstrap}", file=sys.stderr)
        return 1
    patch_bootstrap(bootstrap)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
