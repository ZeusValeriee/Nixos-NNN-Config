# Nixos-NNN-Config

A modular, declarative NixOS configuration for a personal laptop. This setup uses Nix Flakes, Flake Parts, and Import-Tree to maintain a clean and scalable system configuration.

## Important Note on Personal Information

This repository is public and is intended for educational and reference purposes. All personal identifying information (full name, personal email address, etc.) has been removed or replaced with placeholders. 

**What to change if you fork this:**
- `modules/meta.nix`: Update `hostName`, `owner.username`, `owner.name`, `owner.email`, and `timeZone` to match your own setup.
- `modules/system/users.nix`: Update the `username` and ensure any SSH keys are your own.
- `assets/niri.kdl`: The `spawn-at-startup "swaybg"` command contains a hardcoded path to a wallpaper. Change this to your own path.
- `flake.nix`: Update the `host` name if you rename the `nixosConfigurations.laptop` entry.

## 📁 Repository Structure

```text
.
├── assets
│   ├── niri.kdl
│   └── noctalia.toml
├── flake.lock
├── flake.nix
└── modules
    ├── desktop
    │   ├── fonts.nix
    │   ├── niri.nix
    │   ├── noctalia.nix
    │   └── stylix.nix
    ├── editors
    │   ├── doom.d
    │   │   ├── config.el
    │   │   ├── init.el
    │   │   └── packages.el
    │   ├── doom-emacs.nix
    │   └── lazyvim.nix
    ├── flake-parts.nix
    ├── hardware
    │   ├── audio.nix
    │   ├── intel.nix
    │   ├── nbfc.nix
    │   ├── nvidia.nix
    │   └── printing.nix
    ├── hosts
    │   └── laptop
    │       ├── default.nix
    │       ├── filesystems.nix
    │       └── _hardware-configuration.nix
    ├── meta.nix
    ├── overlays.nix
    ├── packages
    │   ├── cli.nix
    │   ├── desktop.nix
    │   └── system.nix
    ├── services
    │   └── ollama.nix
    ├── shell
    │   ├── git.nix
    │   └── zsh.nix
    └── system
        ├── bluetooth.nix
        ├── boot.nix
        ├── kernel.nix
        ├── locale.nix
        ├── networking.nix
        ├── nix.nix
        ├── power.nix
        ├── storage.nix
        ├── users.nix
        └── zram.nix
