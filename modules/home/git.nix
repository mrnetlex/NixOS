{ config, pkgs, systemSettings, ... }:
{
  #Git
  programs.git = {
    enable = true;
    userName = "${systemSettings.username}";
    userEmail = "${systemSettings.mail}";
    delta.enable = true;
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
