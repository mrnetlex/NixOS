{ config, pkgs, ... }:

{
  # Basics
  home.username = "netlex";
  home.homeDirectory = "/home/netlex";

  home.stateVersion = "23.11"; # Don't touch if not needed, read wiki.
  # Imports
  imports = [
    ./modules/home/kitty.nix
    ./modules/home/mpv.nix
    ./modules/home/bat.nix
    ./modules/home/default_mime.nix
  ];
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [

  ];
  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/netlex/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "micro";
    TERM = "kitty";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Fish - fixes compatibilty with bsdgames
  programs.fish.enable = true;

  #Starship
  home.file.".config/starship.toml".source = ./dotfiles/starship.toml;

  #Btop
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "TTY";
      theme_background = false;
      truecolor = true;
      force_tty = false;
      vim_keys = true;
      rounded_corners = true;
      graph_symbol = "braille";
      update_ms = 1000;
      proc_sorting = "cpu direct";
    };
  };
  #Yazi
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      manager = {
        show_hidden = false;
        sort_by = "natural";
        sort_dir_first = true;
        sort_reverse = false;
      };
    };
  };
  home.file.".config/yazi/init.lua".source = ./dotfiles/yazi/init.lua;
  #Micro
  programs.micro = {
    enable = true;
    settings = {
      colorscheme = "simple";
      autosu = true;
      mkparents = true;
      scrollbar = true;
      savecursor = true;
      clipboard = "terminal";
      hlsearch = true;
    };
  };
  #Git
  programs.git = {
    enable = true;
    userName = "netlex";
    userEmail = "mrnetlex@gmail.com";
  };
  #Spotify-player
  home.file.".config/spotify-player/app.toml".source = ./dotfiles/spotify-player/spotify-player.toml;
  home.file.".config/spotify-player/theme.toml".source = ./dotfiles/spotify-player/theme.toml;

}
