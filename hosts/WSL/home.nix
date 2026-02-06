{ config, pkgs, systemSettings, ...}: 

{
  # Basics
  home.username = "${systemSettings.username}";
  home.homeDirectory = "/home/${systemSettings.username}";

  home.stateVersion = "23.11"; # Don't touch if not needed, read wiki.
  # Imports
  imports = [
    ./imports-home.nix
  ];


  home.sessionVariables = {
    EDITOR = "micro";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  #Starship
  home.file.".config/starship.toml".source = ./../../dotfiles/starship.toml;

  #Spotify-player
  home.file.".config/spotify-player/app.toml".source = ./../../dotfiles/spotify-player/spotify-player.toml;
  home.file.".config/spotify-player/theme.toml".source = ./../../dotfiles/spotify-player/theme.toml;
}
