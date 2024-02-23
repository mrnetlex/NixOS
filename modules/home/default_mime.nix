{ config, pkgs, ... }:

{
  xdg.mimeApps.defaultApplications = {
    "video/*" = [ "mpv.desktop" ];
    "text/plain" = [ "micro.desktop" ];
  };
}
