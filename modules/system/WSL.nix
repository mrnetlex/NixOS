{ config, pkgs, ... }:

{
  imports = [
	./fish.nix
	./packages_WSL.nix
#	./docker.nix
	./security.nix
	./sops.nix
	./nixos.nix
	./variables.nix
	./storage/samba.nix
  ];
}
