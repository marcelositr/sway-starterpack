# Sway Modular Dotfiles

## Overview

This repository contains a **fully modular, minimal, and deterministic Sway configuration**, designed with a strict *"Sway‑pure"* philosophy.

The goal of this project is **clarity, predictability, and long‑term maintainability**. No external desktop frameworks, no heavy abstractions, and no opaque dependencies are used. Every component is explicit, inspectable, and replaceable.

This configuration is suitable both for **daily use** and as a **reference implementation** for users who want to understand Sway internals without unnecessary complexity.

![preview 1](https://raw.githubusercontent.com/marcelositr/sway-starterpack/blob/main/img/001.png) <br />

![preview 2](https://raw.githubusercontent.com/marcelositr/sway-starterpack/blob/main/img/002.png) <br />

![preview 3](https://raw.githubusercontent.com/marcelositr/sway-starterpack/blob/main/img/003.png) <br />

![preview 4](https://raw.githubusercontent.com/marcelositr/sway-starterpack/blob/main/img/004.png) <br />

---

## Design Principles

- Native Sway / Wayland tooling only
- Modular configuration layout
- Single‑responsibility scripts
- Deterministic behavior across reloads
- No hidden IPC storms or background daemons
- Minimal runtime dependencies

This is **not** a ricing showcase. It is a clean, technical baseline.

---

## Directory Structure

```
~/.config/sway/
├── config                # Main entry point (includes only)
├── variables.conf        # Global variables
├── input.conf            # Keyboard and pointer configuration
├── output.conf           # Display configuration
├── keybindings.conf      # Keybindings only
├── modes.conf            # Custom modes (resize, etc)
├── utilities.conf        # Media, brightness, screenshot bindings
├── autostart.conf        # Session bootstrap
├── bar.conf              # Swaybar configuration
│
├── modules/              # Runtime modules
│   ├── swaybg.sh         # Wallpaper handling
│   ├── swayidle.sh       # Idle / DPMS handling
│   ├── swaylock.sh       # Lock screen
│   └── master.sh         # Debug / inspection helper
│
└── bar/
    ├── status.sh         # Central status loop (single IPC point)
    └── modules/          # Stateless bar modules (JSON output)
```

---

## Bar Architecture

The status bar follows the **i3bar JSON protocol** and is fully compatible with `swaybar`.

### Key Characteristics

- A **single, centralized status loop** (`status.sh`)
- Optional IPC access to Sway (debug mode only)
- Bar modules are **stateless and side‑effect free**
- Each module reads directly from `/proc`, `/sys`, or simple user tools
- Icons and data are separated for theming flexibility

This avoids common issues such as excessive IPC calls, race conditions, or hidden background loops.

---

## Wallpaper, Idle, and Locking

- **Wallpaper:** handled by `swaybg`, reload‑safe
- **Idle / DPMS:** handled by `swayidle`
- **Lock screen:** handled by `swaylock`

Each component is isolated in its own script with explicit responsibilities.

---

## Launcher

Sway does not provide a native application launcher.

This configuration uses:

- `dmenu` (Wayland‑compatible build)

This choice is intentional to keep the environment minimal and transparent.

---

## Dependencies (Arch Linux)

### Core

- `sway`
- `wayland`
- `xorg-xwayland`
- `wlroots` (dependency of Sway)
- `dbus`
- `seatd` **or** `elogind`

### Terminal and Launcher

- `foot`
- `dmenu`

### Bar and Utilities

- `bash`
- `jq`
- `iproute2`
- `util-linux`

### Audio

- `pipewire`
- `pipewire-pulse`
- `wireplumber`
- `libpulse`

### Graphics and Media

- `grim`
- `swaybg`

### Power and Brightness

- `swayidle`
- `swaylock`
- `brightnessctl`

### Bluetooth (optional)

- `bluez`
- `bluez-utils`

### Fonts (Required)

- `inter-font`
- `ttf-ionicons` (include dot files)

```bash
sudo pacman -Syu
sudo pacman -S sway wayland wlroots xorg-xwayland dbus seatd foot dmenu bash jq iproute2 util-linux pipewire pipewire-pulse wireplumber libpulse grim swaybg swayidle swaylock brightnessctl bluez bluez-utils inter-font firefox thunar
```

---

## Systemd User Session

This configuration assumes a **systemd user session**.

PipeWire services are started explicitly via:

- `systemctl --user start pipewire.service`
- `systemctl --user start pipewire-pulse.service`
- `systemctl --user start wireplumber.service`

On systems with socket activation enabled, this is redundant but harmless.

If systemd user services are unavailable, these commands must be adapted or removed.

---

## Fonts and Visual Consistency

This configuration explicitly references external fonts.

If the required fonts are not installed, text rendering and icons will degrade.

Installing the listed font packages is mandatory for visual parity.

---

## Determinism Note

For full determinism, **no system‑wide Sway configuration is relied upon**.

If `/etc/sway/config.d/*` exists on your system, it should be reviewed carefully or excluded to avoid unexpected behavior.

---

## Debugging

A helper script is included:

- `modules/master.sh`

This script performs a read‑only inspection of the Sway runtime state and is safe to execute at any time.

---

## Target Audience

This configuration is intended for:

- Users who want to understand Sway internals
- Minimalist Wayland setups
- Long‑term, version‑controlled dotfiles
- Technical users who value explicit behavior

---

## License

Public domain / MIT‑style usage. Use, modify, and redistribute freely.

---

## Final Notes

This project intentionally avoids:

- Waybar
- Rofi
- External panel frameworks
- Complex autostart logic
- Hidden background services

If you are looking for a feature‑rich desktop environment, this is not it.

If you want a **clean, honest Sway setup**, this repository provides a solid foundation.

