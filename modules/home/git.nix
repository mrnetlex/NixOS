{ config, pkgs, systemSettings, ... }:
{
  #Git
  programs.git = {
    enable = true;
    lfs.enable = true;
  };
  programs.git.settings = {
        init.defaultBranch = "main";
        user.email = "${systemSettings.mail}";
        user.name = "${systemSettings.username}";
      };
  programs.delta.enable = true;
  programs.delta.enableGitIntegration = true;
}
