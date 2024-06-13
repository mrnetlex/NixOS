{ config, pkgs, ... }:

{
  #Stylix
  stylix.enable = true;
  stylix.image = ../.././wallpapers/Unthemed/Scenery/reversed.jpg; #sets wallpapaer
  stylix.polarity = "dark"; #if option below isn't specified it will generate colorscheme based on wallpaper
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-soft.yaml"; #colorscheme taken from https://github.com/tinted-theming/base16-schemes (repo is now archived so might change)
  stylix.cursor = {
    package = pkgs.qogir-icon-theme;
    name = "Qogir";
  };
  stylix.fonts = {
    serif = {
      package = pkgs.nerdfonts;
      name = "Ubuntu Nerd Font";
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

  stylix.opacity = {
    applications = 0.8;
    desktop = 0.8;
    popups = 0.8;
    terminal = 0.8;
  };
  # Stylix generate .gtkrc-2.0, but so do KDE at every startup, so to avoid doing it manually
  # I use this option to run specified command at every nixos-rebuild automatically
  system.activationScripts = {
    text =
      ''
        		rm /home/netlex/.gtkrc-2.0
          		'';
  };
}
# fucker doesn't want to work in home manager so it will live here, because I'm too lazy to deal with it
