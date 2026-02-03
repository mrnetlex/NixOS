{ config, pkgs, ... }:

{
  imports = [
	./../../modules/system/fish.nix
	./../../modules/system/packages_WSL.nix
	./../../modules/system/security.nix
	./../../modules/system/sops.nix
	./../../modules/system/ssh.nix
	./../../modules/system/nixos.nix
	./../../modules/system/variables.nix
	./../../modules/system/storage/samba.nix
	./../../modules/system/dns.nix
  ];
}
