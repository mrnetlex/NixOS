{ config, pkgs, ... }:

{
  imports = [
	./storage/default.nix
	./kde/default.nix
    ./fish.nix
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
