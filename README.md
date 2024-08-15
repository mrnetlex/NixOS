## Netlex's flake for various hosts
[![](https://img.shields.io/badge/OS-NixOS-6e9bcb?logo=NixOS)](https://nixos.org)
  It's my personal NixOS flake that I use on few hosts (in future I will replace Ubuntu with NixOS in my little homelab) and also few other config files / wallpapers.
### Warning 
 I'm not too good with Nix so take everything written here with grain of salt. And also setup is rather opinionated for my own taste.

### What do I use?
- [flakes](https://wiki.nixos.org/wiki/Flakes) - it's just easier to use other nix tooling
- [home-manager](https://wiki.nixos.org/wiki/Home_Manager) - managing `.config`
- [stylix](https://github.com/danth/**stylix**) - theming
- [sops-nix](https://github.com/Mic92/sops-nix) - secret's encryption
- [nix-flatpak](https://github.com/gmodena/nix-flatpak) - declarative flatpaks
- [nh](https://github.com/viperML/nh) - nix helper

### What I planning to setup
- custom ISO image
- declarative disk partitioning with [disko](https://github.com/nix-community/disko)
- GitHub actions to automatically bump flake.lock and do flake check

### Shout-out
This setup wouldn't be possible without videos from [LibrePhoenix](https://youtube.com/@librephoenix?si=VNcCjVlFrGQxMPm4), [EmergentMind](https://youtube.com/@emergent_mind?si=UE3dkOotAzdUwU8O) and whole nix community from where I stolen bits and pieces of code. Wallpapers are collected from so many places
