{ config, pkgs, ... }:

{
  imports = [
    ./kitty.nix
    ./mpv.nix
    ./firefox.nix
    ./bat.nix
    ./micro.nix
    ./btop.nix
    ./yazi.nix
    ./git.nix
    ./nvim.nix
  ];
}
