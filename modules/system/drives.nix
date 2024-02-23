{ config, pkgs, ... }:

{
  # fstrim
  services.fstrim.enable = true;
  services.fstrim.interval = "weekly";

  # BTRFS
  services.btrfs.autoScrub = {
    enable = true;
    interval = "weekly";
    fileSystems = [ "/" ];
  };
}
