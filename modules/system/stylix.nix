{config, pkgs, ...}:

{
  #Stylix
  stylix.image = /home/netlex/NixOS/wallpapers/Tokyonight/cafe-at-night_00_3840x2160.png; #sets wallpapaer
  stylix.polarity = "dark"; #if option below isn't specified it will generate colorscheme based on wallpaper
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyodark-terminal.yaml"; #colorscheme taken from https://github.com/tinted-theming/base16-schemes (repo is now archived so might change)
  stylix.cursor = {
  	package = pkgs.breeze-icons;
  	name = "Breeze Light";
  };
  stylix.fonts = {
    serif = {
      package = pkgs.nerdfonts;
      name = "FireCode Nerd Font";
    };

    sansSerif = {
      package = pkgs.nerdfonts;
      name = "Ubuntu Nerd Font";
    };

    monospace = {
      package = pkgs.nerdfonts;
      name = "JetBrainsMono Nerd Font";
    };

    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };

  stylix = {
      opacity = let
        opacity_value = 0.8;
      in
        {
          applications = opacity_value;
          desktop = opacity_value;
          popups = opacity_value;
          terminal = opacity_value;
        };
    };

}
# fucker doesn't want to work in home manager so it will live here, because I'm too lazy to deal with it
