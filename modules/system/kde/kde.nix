{config, pkgs, ...}:
{
  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma6.enable = true;
  services.xserver.displayManager.defaultSession = "plasma";

  #needed for many shit
  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    plasma-browser-integration
    xdg-desktop-portal-kde
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
}
