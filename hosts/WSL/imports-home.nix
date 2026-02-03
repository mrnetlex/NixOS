{ config, pkgs, ... }:

{
  imports = [
    ./../../modules/home/bat.nix
    ./../../modules/home/micro.nix
    ./../../modules/home/btop.nix
    ./../../modules/home/yazi.nix
    ./../../modules/home/git.nix
    ./../../modules/home/nvim.nix
    ./../../modules/home/atuin.nix
    ./../../modules/home/ssh.nix
  ];
}
