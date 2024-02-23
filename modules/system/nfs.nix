{ config, pkgs, ... }:

{
  boot.initrd.kernelModules = [ "nfs" ];
  boot.initrd.supportedFilesystems = [ "nfs" ];


  fileSystems."/mnt/pool" = {
    device = "192.168.1.100:/mnt/tank/vault";
    fsType = "nfs";
    options = [ "ac,x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s" ];
  };

}
