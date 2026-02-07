{ config, pkgs, ... }:

{
  programs.television = {
  	enable = true;
  	enableFishIntegration = true;
  	settings = {
  		keybindings = {
  		  ctrl-q = "quit";
  		  ctrl-c = "quit";
  		  esc = "quit";
  		};
  		shell_integration.keybindings = {
  			smart_autocomplete = "ctrl-t";
  		};
  	};
  };
}
