{ config, pkgs, systemSettings, ... }:
{
  #Git
  programs.git = {
    enable = true;
    userName = "${systemSettings.username}";
    userEmail = "${systemSettings.mail}";
    lfs.enable = true;
    delta.enable = true;
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
