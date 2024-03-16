{ config
, pkgs
, ...
}: {
  virtualisation.docker.enable = true;
  virtualisation.docker.storageDriver = "btrfs";
  environment.systemPackages = with pkgs; [
  	docker-compose
  	lazydocker
  ];
  # users.users.netlex.extraGroups = [ "docker" ];
}
