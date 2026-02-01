{ config, pkgs, ... }:
{
  #Yazi
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      manager = {
        show_hidden = true;
        sort_by = "natural";
        sort_dir_first = true;
        sort_reverse = false;
        linemode = "size";
        show_symlink = true;
        
      };
    };
  };
  #home.file.".config/yazi/init.lua".source = ../.././dotfiles/yazi/init.lua;
}
