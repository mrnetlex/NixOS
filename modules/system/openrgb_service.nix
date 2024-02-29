{ config, pkgs, ... }:

let
  # Define the script content
  myScript = ''
    	#!/bin/sh
    	# PLACE IN /usr/lib/systemd/system-sleep
    	
    	case $1/$2 in
    		pre/*)
    			;;
    		post/*)
    			pkill --signal term -f OpenRGB
    			openrgb --startminimized --profile /home/netlex/NixOS/dotfiles/gradient #replace with location of color profile#
    		;;
    	esac
    	
  '';

in
{
  # Other configuration options...

  systemd.services.mySleepScript = {
    description = "Execute script before and after system sleep";
    script = "$myScript";
    wantedBy = [ "suspend.target" "hibernate.target" ];
    serviceConfig.Type = "oneshot";
  };
}
