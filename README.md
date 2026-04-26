# Zed One Dark — qBittorrent Theme

A faithful port of [Zed editor](https://zed.dev)'s One Dark theme for qBittorrent v5.x.

## Preview

> Dark blue-grey surfaces · Zed-style SVG icons · Semantic transfer state colors

## Installation

1. Download `zed-one-dark.qbtheme` from the [latest release](https://github.com/dreygur/qbit-theme/releases/latest)
2. Open qBittorrent → **Tools → Options → Behavior → Interface**
3. Check **Use custom UI Theme**
4. Browse to the downloaded `.qbtheme` file
5. Click OK and restart qBittorrent

## Requirements

- qBittorrent **v5.0+** (uses Qt6 binary resource format)

## Color Palette

| Role | Color |
|------|-------|
| Window | `#3b414d` |
| Surface | `#2f343e` |
| Base (inputs/lists) | `#282c33` |
| Text | `#dce0e5` |
| Text muted | `#a9afbc` |
| Accent | `#74ade8` |
| Border | `#464b57` |
| Downloading | `#a1c181` |
| Uploading | `#74ade8` |
| Stopped | `#878a98` |
| Error | `#d07277` |
| Warning | `#dec184` |

## Building from Source

Requires Qt6 `rcc`:

```bash
# Fedora
sudo dnf install qt6-qtbase-devel

# Debian/Ubuntu
sudo apt install qt6-base-dev

# Build
./build.sh
```

## License

MIT
