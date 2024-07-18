{ config, pkgs, ... }:

{
  imports = [
	./fish.nix
	./packages_WSL.nix
	./docker.nix
	./security.nix
	./nixos.nix
	./variables.nix
  ];
}
