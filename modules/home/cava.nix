{config, pkgs, ...}:
{
  programs.cava = {
  	enable = true;	
  	};
  home.file.".config/cava/themes/tokyonight".source = ./../../dotfiles/cava/tokyonight;
}
