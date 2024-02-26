{ config
, pkgs
, ...
}: {
  #Kitty config
  stylix.targets.kitty.enable = true;
  programs.kitty = {
    enable = true;
    #theme = "Tokyo Night";
    font.name = "JetBrainsMono Nerd Font";
    settings = {
      update_check_interval = 0;
      confirm_os_window_close = -0;
      copy_on_select = true;
      clipboard_control = "write-clipboard read-clipboard write-primary read-primary";
      strip_trailing_spaces = "smart";
      shell = "fish";
      # Blur
      linux_display_server = "x11";
      #background_opacity = "0.8";
      background_blur = "64";
      # Tab bar
      tab_bar_style = "fade";
      tab_powerline_style = "round";
    };
    shellIntegration.enableFishIntegration = true;
  };
}
