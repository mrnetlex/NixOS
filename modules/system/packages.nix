{config, pkgs, ...}:

{
#Packages
  environment.systemPackages = with pkgs; [
    # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #Plasma KDE
    plasma-browser-integration
    xdg-desktop-portal-kde
    tokyo-night-gtk
    papirus-icon-theme
    qogir-icon-theme
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
    telegram-desktop
    caprine-bin
    teams-for-linux
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
    gnome.gnome-boxes
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
    delta
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
    cbonsai
    # Nix
    nvd
    nixpkgs-fmt #nix formater
    deadnix #remove dead nix code
    nix-tree
    nix-du
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
}
