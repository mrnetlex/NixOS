
# Netlex's NixOS Flake for Multiple Hosts

[![](https://img.shields.io/badge/OS-NixOS-6e9bcb?logo=NixOS)](https://nixos.org)

Welcome to my personal NixOS flake repository. This is the configuration I currently use across several hosts, including plans to transition my homelab from Ubuntu to NixOS in the near future. You'll also find some additional configuration files and wallpapers included here.

### ⚠️ Disclaimer
I'm still learning the ropes with Nix, so please consider this setup as a work in progress. It’s tailored to my personal preferences, so it may not suit everyone.

### 🚀 Tools & Technologies
Here are the key tools and technologies I’m using:

- **[flakes](https://wiki.nixos.org/wiki/Flakes):** Simplifies the use of other Nix tooling.
- **[home-manager](https://wiki.nixos.org/wiki/Home_Manager):** Manages my `.config` files.
- **[stylix](https://github.com/danth/stylix):** Handles theming.
- **[sops-nix](https://github.com/Mic92/sops-nix):** Manages encrypted secrets.
- **[nix-flatpak](https://github.com/gmodena/nix-flatpak):** Enables declarative flatpak installations.
- **[nh](https://github.com/viperML/nh):** A helper tool for working with Nix.

### 🛠️ Future Plans
Here’s what I’m planning to add next:

- Create a custom ISO image.
- Set up declarative disk partitioning with [disko](https://github.com/nix-community/disko).
- Implement GitHub Actions to automatically update `flake.lock` and perform `flake check`.

### 🎉 Acknowledgments
A huge shout-out to the Nix community and content creators who made this setup possible. Special thanks to [LibrePhoenix](https://youtube.com/@librephoenix?si=VNcCjVlFrGQxMPm4) and [EmergentMind](https://youtube.com/@emergent_mind?si=UE3dkOotAzdUwU8O) for their incredibly helpful videos. The wallpapers included here were sourced from various places.
