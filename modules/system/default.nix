{config, pkgs, ...}:

{
  imports = [
    ./drives.nix
    ./fish.nix
    ./nfs.nix
    ./samba.nix
    ./security.nix
    ./docker.nix
    ./flatpak.nix
    ./stylix.nix
    ./variables.nix
    ./packages.nix
  ];
}
