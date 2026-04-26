#!/usr/bin/env bash
# Download Zed icons, recolor, and save as qBittorrent icon names
set -e

ZED_BASE="https://raw.githubusercontent.com/zed-industries/zed/main/assets/icons"
OUTDIR="icons/dark"
mkdir -p "$OUTDIR"

# Colors from Zed One Dark palette
TEXT="#dce0e5"
MUTED="#a9afbc"
DIM="#878a98"
ACCENT="#74ade8"
GREEN="#a1c181"
YELLOW="#dec184"
RED="#d07277"
CYAN="#6eb4bf"

fetch() {
    local src="$1" dst="$2" color="$3"
    local url="$ZED_BASE/$src"
    local out="$OUTDIR/$dst.svg"
    local tmp
    tmp=$(curl -sf "$url") || { echo "SKIP: $src not found"; return; }
    # Replace stroke and fill black with target color
    tmp="${tmp//stroke=\"#000\"/stroke=\"$color\"}"
    tmp="${tmp//stroke=\"black\"/stroke=\"$color\"}"
    tmp="${tmp//stroke=\"#000000\"/stroke=\"$color\"}"
    # Replace fill black (but keep fill="none")
    tmp="${tmp//fill=\"#000\"/fill=\"$color\"}"
    tmp="${tmp//fill=\"black\"/fill=\"$color\"}"
    tmp="${tmp//fill=\"#000000\"/fill=\"$color\"}"
    echo "$tmp" > "$out"
    echo "OK: $dst.svg ($color)"
}

# Navigation / ordering
fetch "arrow_up.svg"        "go-up"          "$TEXT"
fetch "arrow_down.svg"      "go-down"        "$TEXT"
fetch "page_up.svg"         "go-top"         "$TEXT"
fetch "page_down.svg"       "go-bottom"      "$TEXT"

# Torrent actions
fetch "play_filled.svg"     "torrent-start"          "$TEXT"
fetch "play_filled.svg"     "torrent-start-forced"   "$ACCENT"
fetch "stop.svg"            "torrent-stop"           "$TEXT"
fetch "plus.svg"            "torrent-creator"        "$TEXT"
fetch "link.svg"            "torrent-magnet"         "$ACCENT"

# Transfer states
fetch "cloud_download.svg"  "downloading"     "$GREEN"
fetch "arrow_down.svg"      "stalledDL"       "$MUTED"
fetch "arrow_up.svg"        "stalledUP"       "$MUTED"
fetch "arrow_up.svg"        "upload"          "$ACCENT"
fetch "stop.svg"            "stopped"         "$DIM"
fetch "stop.svg"            "paused"          "$MUTED"
fetch "clock.svg"           "queued"          "$MUTED"
fetch "rotate_cw.svg"       "force-recheck"   "$YELLOW"

# Status / connection
fetch "signal_high.svg"     "connected"       "$GREEN"
fetch "disconnected.svg"    "disconnected"    "$RED"
fetch "signal_high.svg"     "network-connect" "$TEXT"
fetch "server.svg"          "network-server"  "$TEXT"
fetch "server.svg"          "trackers"        "$TEXT"
fetch "lock_outlined.svg"   "firewalled"      "$YELLOW"
fetch "lock_outlined.svg"   "ip-blocked"      "$RED"
fetch "lock_outlined.svg"   "object-locked"   "$TEXT"
fetch "lock_outlined.svg"   "security-high"   "$GREEN"
fetch "lock_outlined.svg"   "security-low"    "$RED"
fetch "signal_low.svg"      "slow"            "$YELLOW"
fetch "signal_medium.svg"   "slow_off"        "$TEXT"
fetch "sliders.svg"         "speedometer"     "$TEXT"

# Filters
fetch "filter.svg"          "filter-all"       "$TEXT"
fetch "filter.svg"          "filter-active"    "$ACCENT"
fetch "filter.svg"          "filter-inactive"  "$MUTED"
fetch "filter.svg"          "filter-stalled"   "$YELLOW"

# Trackers / peers
fetch "x_circle.svg"        "tracker-error"    "$RED"
fetch "warning.svg"         "tracker-warning"  "$YELLOW"
fetch "warning.svg"         "trackerless"      "$MUTED"
fetch "user_group.svg"      "peers"            "$TEXT"
fetch "user_check.svg"      "peers-add"        "$TEXT"
fetch "user_group.svg"      "peers-remove"     "$TEXT"

# RSS
fetch "bell.svg"            "application-rss"  "$TEXT"
fetch "check.svg"           "rss_read_article"    "$MUTED"
fetch "bell_dot.svg"        "rss_unread_article"  "$ACCENT"

# Edit actions
fetch "eraser.svg"          "edit-clear"   "$TEXT"
fetch "copy.svg"            "edit-copy"    "$TEXT"
fetch "magnifying_glass.svg" "edit-find"  "$TEXT"
fetch "pencil.svg"          "edit-rename"  "$TEXT"
fetch "pencil.svg"          "name"         "$TEXT"

# Files / folders
fetch "file.svg"            "fileicon"           "$TEXT"
fetch "folder.svg"          "directory"          "$TEXT"
fetch "folder.svg"          "folder-documents"   "$TEXT"
fetch "folder_open_add.svg" "folder-new"         "$TEXT"
fetch "folder.svg"          "folder-remote"      "$TEXT"
fetch "folder_open.svg"     "set-location"       "$TEXT"

# App / preferences
fetch "settings.svg"        "configure"              "$TEXT"
fetch "settings.svg"        "preferences-advanced"   "$TEXT"
fetch "bolt_outlined.svg"   "preferences-bittorrent" "$TEXT"
fetch "screen.svg"          "preferences-desktop"    "$TEXT"
fetch "public.svg"          "preferences-webui"      "$TEXT"
fetch "blocks.svg"          "plugins"                "$TEXT"
fetch "exit.svg"            "application-exit"       "$TEXT"
fetch "power.svg"           "system-log-out"         "$TEXT"

# Info / help
fetch "info.svg"            "help-about"      "$ACCENT"
fetch "book.svg"            "help-contents"   "$TEXT"
fetch "warning.svg"         "dialog-warning"  "$YELLOW"
fetch "x_circle.svg"        "error"           "$RED"

# Lists / view
fetch "list_tree.svg"       "view-categories"   "$TEXT"
fetch "eye.svg"             "view-preview"      "$TEXT"
fetch "rotate_cw.svg"       "view-refresh"      "$TEXT"
fetch "sliders.svg"         "view-statistics"   "$TEXT"
fetch "plus.svg"            "list-add"          "$TEXT"
fetch "trash.svg"           "list-remove"       "$TEXT"
fetch "hash.svg"            "hash"              "$TEXT"
fetch "hash.svg"            "tags"              "$TEXT"
fetch "arrow_right_left.svg" "ratio"            "$TEXT"

# Tasks / misc
fetch "check_circle.svg"    "checked-completed"  "$GREEN"
fetch "check_circle.svg"    "task-complete"      "$GREEN"
fetch "x_circle.svg"        "task-reject"        "$RED"
fetch "load_circle.svg"     "loading"            "$ACCENT"
fetch "link.svg"            "application-url"    "$TEXT"
fetch "link.svg"            "insert-link"        "$TEXT"
fetch "envelope.svg"        "mail-inbox"         "$TEXT"
fetch "debug_pause.svg"     "pause-session"      "$TEXT"
fetch "rotate_cw.svg"       "reannounce"         "$TEXT"
fetch "book_copy.svg"       "wallet-open"        "$TEXT"
fetch "download.svg"        "download"           "$TEXT"

# Tray icons (colored accent)
fetch "download.svg"        "qbittorrent-tray"       "$ACCENT"
fetch "download.svg"        "qbittorrent-tray-mono"  "$TEXT"

echo ""
echo "Done. Icons in $OUTDIR/"
