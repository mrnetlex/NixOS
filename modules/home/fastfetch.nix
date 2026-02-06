{ pkgs, ... }:
{
  home.packages = with pkgs; [
	fastfetch
  ];
  home.file.".config/fastfetch/config.jsonc".source = ./../../dotfiles/fastfetch/config.jsonc;
  home.file.".config/fastfetch/full.jsonc".source = ./../../dotfiles/fastfetch/full.jsonc;
  home.file.".config/fastfetch/simple.jsonc".source = ./../../dotfiles/fastfetch/simple.jsonc;
  
}
