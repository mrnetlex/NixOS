{ config, pkgs, systemSettings, ...}: 

{
  # For mount.cifs, required unless domain name resolution is not needed.
  environment.systemPackages = [ pkgs.cifs-utils ];

  #mnt
  fileSystems."/mnt/mnts" = {
    device = "//192.168.1.148/mnt";
    fsType = "cifs";
    options =
      let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
      in
      [ "${automount_opts},credentials=${config.sops.secrets.smb-creds.path},uid=1000,gid=100" ];
  };
  #docker
  fileSystems."/mnt/docker" = {
    device = "//192.168.1.148/docker";
    fsType = "cifs";
    options =
      let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
      in
      [ "${automount_opts},credentials=${config.sops.secrets.smb-creds.path},uid=1000,gid=100" ];
  };
  #pool
  fileSystems."/mnt/pool" = {
    device = "//192.168.1.148/pool";
    fsType = "cifs";
    options =
      let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
      in
      [ "${automount_opts},credentials=${config.sops.secrets.smb-creds.path},uid=1000,gid=100" ];
  };
}
