{ config, pkgs, ... }:

{
  imports = [
    ./drives.nix
    ./fish.nix
    ./nfs.nix
    ./samba.nix
    ./security.nix
    ./docker.nix
    ./vm.nix
    ./flatpak.nix
    ./stylix.nix
    #./openrgb_service.nix
    ./variables.nix
    ./packages.nix
  ];
}
