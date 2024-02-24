{ config
, pkgs
, ...
}: {
  virtualisation.docker.enable = true;
  virtualisation.docker.storageDriver = "btrfs";
  # users.users.netlex.extraGroups = [ "docker" ];
}
