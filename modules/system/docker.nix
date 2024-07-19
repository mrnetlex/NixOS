{ config, pkgs, systemSettings, ...
}: {
  virtualisation.docker.enable = true;
  virtualisation.docker.storageDriver = "btrfs";
  environment.systemPackages = with pkgs; [
  	docker-compose
  	lazydocker
  ];
  # users.users.${systemSettings.username}.extraGroups = [ "docker" ];
}
