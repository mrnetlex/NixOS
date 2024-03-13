{config, pkgs, ...}:

{
  xdg.mime = let
    associations = {
      "inode/directory" = [ "org.kde.dolphin.desktop" ];
      "image/png" = [ "org.kde.gwenview.desktop" ];
      "image/jpeg" = [ "org.kde.gwenview.desktop" ];
      "image/webp" = [ "org.kde.gwenview.desktop" ];
      "image/gif" = [ "org.kde.gwenview.desktop" ];
      "image/bmp" = [ "org.kde.gwenview.desktop" ];
      "image/svg+xml" = [ "org.kde.gwenview.desktop" ];
      "image/tiff" = [ "org.kde.gwenview.desktop" ];
      "image/apng" = [ "org.kde.gwenview.desktop" ];
      "application/pdf" = [ "org.kde.okular.desktop" ];
      "video/*" = [ "mpv.desktop" ];
      "audio/*" = [ "org.kde.elisa.desktop" ];
      "text/plain" = [ "org.kde.kate.desktop" ];
      "text/html" = [ "firefox.desktop" ];
      "x-scheme-handler/tg" = [ "org.telegram.desktop.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
    };
  in {
    enable = true;
    addedAssociations = associations;
    defaultApplications = associations;
  };
}
