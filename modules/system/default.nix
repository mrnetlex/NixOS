{ config, pkgs, ... }:

{
  imports = [
	./storage/default.nix
	./kde/default.nix
	./gaming/default.nix
    ./fish.nix
    ./security.nix
    ./docker.nix
    ./vm.nix
    ./flatpak.nix
    ./stylix.nix
    #./openrgb_service.nix
    ./variables.nix
    ./packages.nix
    ./mime.nix
    ./nixos.nix
    ./audio.nix
  ];
}
