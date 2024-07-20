{ config, pkgs, systemSettings, ...}:

{
  environment.systemPackages = with pkgs; [
  	sops
  	age
  ];
  # users.users.${systemSettings.username}.extraGroups = [ "docker" ];
}
