{ config, pkgs, systemSettings, ...
}: {
  imports = [
    # Import nix modules.
    ./hardware-configuration.nix
    ./../../modules/system/workstation.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Firmware update (you still need to run them manually)
  services.fwupd.enable = true;
  
  # Kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # Governor
  powerManagement.cpuFreqGovernor = "performance";

  # ZRAM
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 100;
  };

  # Bluetooth
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  # Networking
  networking.hostName = "${systemSettings.hostname}"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.networkmanager.dns = "none";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  custom.dns.enable = true;

  # Set your time zone.
  time.timeZone = "${systemSettings.timezone}";

  # Select internationalisation properties.
  i18n.defaultLocale = "${systemSettings.locale}";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "pl";
    xkb.variant = "";
  };

  # Configure console keymap
  console.keyMap = "pl2";

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  sops.secrets.netlex-password.neededForUsers = true;
  users.mutableUsers = false;
  users.users.${systemSettings.username} = {
    isNormalUser = true;
    description = "${systemSettings.username}";
    extraGroups = [ "networkmanager" "wheel" "realtime" "audio" ];
    hashedPasswordFile = config.sops.secrets.netlex-password.path;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Fonts
  fonts.packages = with pkgs; [
    nerdfonts
    corefonts
    vistafonts
    noto-fonts
    noto-fonts-emoji
  ];

  # Open ports in the firewall.
  networking.firewall.enable = true;
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];

  # SERVICES for my  programs
  #plocate
  services.locate = {
    enable = true;
    package = pkgs.plocate;
  };
  #preload
  services.preload.enable = true;
  #ananicy
  services.ananicy.enable = true;
  #libratbag
  services.ratbagd.enable = true;
  #onedrive
  services.onedrive.enable = true;
  #openrgb
  services.hardware.openrgb.enable = true;
  services.hardware.openrgb.motherboard = "intel";
  #gamescope
  programs.gamescope.enable = true;
  #corectrl
  programs.corectrl.enable = true;


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
