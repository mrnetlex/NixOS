{ config
, pkgs
, ...
}: {
  imports = [
    # Import nix modules.
    ./hardware-configuration.nix
    ./modules/system/default.nix
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
  zramSwap.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  networking.hostName = "workstation"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Secure DNS
  services.dnscrypt-proxy2 = {
    enable = true;
    settings = {
      ipv6_servers = true;
      require_dnssec = true;

      sources.public-resolvers = {
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
          "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
        ];
        cache_file = "/var/lib/dnscrypt-proxy2/public-resolvers.md";
        minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
      };

      # You can choose a specific set of servers from https://github.com/DNSCrypt/dnscrypt-resolvers/blob/master/v3/public-resolvers.md
      server_names = [ "cloudflare" ];
    };
  };

  systemd.services.dnscrypt-proxy2.serviceConfig = {
    StateDirectory = "dnscrypt-proxy";
  };

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

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

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  hardware.opengl.extraPackages = [ pkgs.amdvlk ];

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.defaultSession = "plasmawayland";

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

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
    wireplumber.enable = true;

    # Change limits for audio programs
  };
  security.pam.loginLimits = [
    {
      domain = "@audio";
      item = "memlock";
      type = "-";
      value = "unlimited";
    }
    {
      domain = "@audio";
      item = "rtprio";
      type = "-";
      value = "99";
    }
    {
      domain = "@audio";
      item = "nofile";
      type = "soft";
      value = "99999";
    }
    {
      domain = "@audio";
      item = "nofile";
      type = "hard";
      value = "524288";
    }
  ];
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.netlex = {
    isNormalUser = true;
    description = "netlex";
    extraGroups = [ "networkmanager" "wheel" "realtime" "audio" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Packages
  environment.systemPackages = with pkgs; [
    # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #Plasma KDE
    plasma-browser-integration
    xdg-desktop-portal-kde
    tokyo-night-gtk
    papirus-icon-theme
    kcalc
    kalendar
    kfind
    kate
    krita
    filelight
    kdiskmark
    xwaylandvideobridge
    # System
    snapper
    btrfs-assistant
    preload
    nfs-utils
    corefonts
    vistafonts
    #Basic
    git
    killall
    unzip
    mpv
    wget
    curl
    gimp
    firefox
    brave
    google-chrome
    spotify
    obsidian
    vscodium
    discord-canary
    caprine-bin
    nextcloud-client
    easyeffects
    partition-manager
    onlyoffice-bin
    nextcloud-client
    onedrivegui
    upscayl
    jellyfin-media-player
    thunderbird
    filezilla
    xsane
    ocrmypdf
    # Terminal
    kitty
    wezterm
    nerdfonts
    micro
    btop
    radeontop
    nvtop-amd
    yazi
    lazygit
    ffmpegthumbnailer
    unar
    file
    jq
    poppler
    glow
    zoxide
    starship
    navi
    fzf
    bat
    bat-extras.batman
    bat-extras.batgrep
    bat-extras.batdiff
    eza
    grc
    gdu
    trash-cli
    pingu
    speedtest-rs
    cfspeedtest
    bandwhich
    tealdeer
    erdtree
    cava
    unimatrix
    cowsay
    lolcat
    sl
    ripgrep
    fd
    du-dust
    duf
    progress
    testdisk
    pciutils
    usbutils
    smartmontools
    hwinfo
    zathura
    spotify-player
    termusic
    ani-cli
    nitch
    neofetch
    ramfetch
    pipes-rs
    pokemon-colorscripts-mac
    #bsdgames
    cbonsai
    # Nix
    nvd
    nixpkgs-fmt #nix formater
    deadnix #remove dead nix code
    # Wine and games
    (pkgs.wrapOBS {
      # dont add obs-studio alone, it takes care of that
      plugins = with pkgs.obs-studio-plugins; [
        obs-gstreamer
        obs-vaapi
        obs-vkcapture
      ];
    })
    prismlauncher
    graalvm-ce #better java
    glfw-wayland-minecraft
    lunar-client
    lutris
    heroic
    protonup-qt
    wine
    winetricks
    steam-run
    mangohud
    goverlay
    gamemode
    gamescope
    piper
    libratbag
    openrgb-with-all-plugins
    corectrl
    # Audio
    qpwgraph
    ardour
    guitarix
    yabridge
    yabridgectl
  ];
  # Flatpaks
  services.flatpak.enable = true;
  services.flatpak.remotes = [
    {
      name = "flathub";
      location = "https://flathub.org/repo/flathub.flatpakrepo";
    }
  ];
  services.flatpak.packages = [
    "com.boxy_svg.BoxySVG"
    "app.moosync.moosync"
  ];
  # Fix database for command-not-found. I use external module in flake.nix so this option has to be disabled.
  programs.command-not-found.enable = false;
  # Fonts
  fonts.packages = with pkgs; [
    nerdfonts
    corefonts
    vistafonts
    noto-fonts
    noto-fonts-emoji
  ];
  # List services that you want to enable:

  # Open ports in the firewall.
  networking.firewall.enable = true;
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];

  # SERVICES for my  programs
  #plocate
  services.locate = {
    enable = true;
    package = pkgs.plocate;
    localuser = null;
  };
  #preload
  services.preload.enable = true;
  #ananicy
  services.ananicy.enable = true;
  #libratbag
  services.ratbagd.enable = true;
  #onedrive
  services.onedrive.enable = true;
  #kde connect
  programs.kdeconnect.enable = true;
  #openrgb
  services.hardware.openrgb.enable = true;
  services.hardware.openrgb.motherboard = "intel";
  #kde partition manager
  programs.partition-manager.enable = true;
  #corectrl
  programs.corectrl.enable = true;
  # Musnix module
  musnix.enable = true;

  # XDG
  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-kde
        xdg-desktop-portal-gtk
      ];
    };
  };
  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
  # Obsidian electron ovveride
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

  # NixOS settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.optimise.automatic = true;
  nix.optimise.dates = [ "17:30" ];
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
  system.activationScripts.diff = {
    supportsDryActivation = true;
    text = ''
      ${pkgs.nvd}/bin/nvd --nix-bin-dir=${pkgs.nix}/bin diff /run/current-system "$systemConfig"
    '';
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  # Environmnet variables
  environment.variables = {
    EDITOR = "micro";
    TERM = "kitty";
    HSA_OVERRIDE_GFX_VERSION = "10.3.0";
    AMD_VULKAN_ICD = "RADV";
  };
}
