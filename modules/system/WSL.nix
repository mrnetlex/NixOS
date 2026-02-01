{ config, pkgs, ... }:

{
  imports = [
	./fish.nix
	./packages_WSL.nix
	./security.nix
	./sops.nix
	./ssh.nix
	./nixos.nix
	./variables.nix
	./storage/samba.nix
	./dns.nix
  ];
}
