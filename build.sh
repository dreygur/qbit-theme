#!/usr/bin/env bash
# Compile resources.qrc -> zed-one-dark.qbtheme
# Requires: rcc (Qt6 preferred, Qt5 fallback)
set -e

OUTPUT="zed-one-dark.qbtheme"

RCC=""
for candidate in \
    rcc6 rcc-qt6 rcc \
    /usr/lib64/qt6/libexec/rcc \
    /usr/lib/qt6/libexec/rcc \
    /usr/lib/x86_64-linux-gnu/qt6/libexec/rcc
do
    if command -v "$candidate" &>/dev/null 2>&1; then
        RCC="$candidate"
        break
    fi
done

if [[ -z "$RCC" ]]; then
    echo "Error: rcc not found. Install qt6-base-dev (Debian/Ubuntu) or qt6-qtbase-devel (Fedora)." >&2
    exit 1
fi

"$RCC" resources.qrc -o "$OUTPUT"

echo "Built: $OUTPUT"
