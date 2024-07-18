{ config, pkgs, ... }:

{
  imports = [
	./storage/default.nix
	./kde/default.nix
	./gaming/default.nix
    ./fish.nix
    ./security.nix
    ./dns.nix
    ./docker.nix
    ./vm.nix
    ./flatpak.nix
    ./stylix.nix
    ./variables.nix
    ./packages.nix
    #./mime.nix
    ./nixos.nix
    ./audio.nix
  ];
}
