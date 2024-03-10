{config, pkgs, ...}:
{
  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma6.enable = true;
  services.xserver.displayManager.defaultSession = "plasma";

  #needed for many shit
  programs.dconf.enable = true;

  # XDG
  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-kde
        xdg-desktop-portal-gtk
      ];
    };
  };
  # Packages
  environment.systemPackages = with pkgs; [
    plasma-browser-integration
    papirus-icon-theme
    qogir-icon-theme
    kcalc
    kalendar
    kfind
    kate
    krita
    filelight
    kdiskmark
    haruna
    xwaylandvideobridge
    (callPackage ./VK_hdr_layer.nix {})
  ];

  #kde partition manager
  programs.partition-manager.enable = true;
  #kde connect
  programs.kdeconnect.enable = true;
  
}
