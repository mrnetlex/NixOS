{ config, pkgs, ... }:

{
  imports = [
  	./../../modules/home/sops.nix
    ./../../modules/home/kitty.nix
    ./../../modules/home/mpv.nix
    ./../../modules/home/firefox.nix
    ./../../modules/home/bat.nix
    ./../../modules/home/micro.nix
    ./../../modules/home/btop.nix
    ./../../modules/home/yazi.nix
    ./../../modules/home/git.nix
    ./../../modules/home/nvim.nix
    ./../../modules/home/ssh.nix
    ./../../modules/home/television.nix
    ./../../modules/home/fastfetch.nix
    ./../../modules/home/cava.nix
    ./../../modules/home/guitarix.nix
  ];
}
