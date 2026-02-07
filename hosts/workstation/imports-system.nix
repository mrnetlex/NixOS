{ config, pkgs, ... }:

{
  imports = [
  	./packages-system.nix
	./../../modules/system/storage/default.nix
	./../../modules/system/kde/default.nix
	./../../modules/system/gaming/default.nix
    ./../../modules/system/fish.nix
    ./../../modules/system/nvidia.nix
    ./../../modules/system/security.nix
    ./../../modules/system/sops.nix
    ./../../modules/system/dns.nix
    ./../../modules/system/docker.nix
    ./../../modules/system/ssh.nix
    ./../../modules/system/vm.nix
    ./../../modules/system/flatpak.nix
#    ./../../modules/system/stylix.nix STYLIX NEED FIXING - maybe full config rebuild
    ./../../modules/system/variables.nix
    #./../../modules/system/mime.nix
    ./../../modules/system/nixos.nix
    ./../../modules/system/audio.nix
  ];
}
