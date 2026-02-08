# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, inputs, systemSettings, ... }:

{
  imports = [
    ./imports-system.nix
    ./hardware-configuration.nix
  ];

  nixpkgs.overlays = [
    (import ../../overlays/unstable-packages.nix { inherit inputs; })
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Firmware update (you still need to run them manually)
  services.fwupd.enable = true;

  # ZRAM
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 100;
  };

  # Networking
  networking.hostName = "${systemSettings.hostname}"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.networkmanager.dns = "none";
  custom.dns.enable = true;

  
  # Timezone
  time.timeZone = "${systemSettings.timezone}";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  sops.secrets.netlex-password.neededForUsers = true;
  users.mutableUsers = false;
  users.users.${systemSettings.username} = {
    isNormalUser = true;
    description = "${systemSettings.username}";
    extraGroups = [ "wheel" ];
    hashedPasswordFile = config.sops.secrets.netlex-password.path;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  # Services for programs
  services.tailscale.enable = true;

  # Fish as a default shell
  programs.bash = {
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };

}
