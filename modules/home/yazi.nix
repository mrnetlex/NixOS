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
    plugins = {
      "full-border" = pkgs.yaziPlugins.full-border;
      "lazygit" = pkgs.yaziPlugins.lazygit;
      "smart-enter" = pkgs.yaziPlugins.smart-enter;
    };
    keymap = {
    	mgr.prepend_keymap = [
    	  { run = "plugin smart-enter"; on = [ "<l>" ]; }
    	];
    };
  };
  home.file.".config/yazi/init.lua".source = ./../../dotfiles/yazi/init.lua;
}
