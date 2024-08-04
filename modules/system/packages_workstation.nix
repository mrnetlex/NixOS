{ config, pkgs, ... }:

{
  #Packages
  environment.systemPackages = with pkgs; [
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
    rsync
    gimp
    firefox
    brave
    google-chrome
    spotify
    obsidian
    vscodium
    discord
    discord-canary
    telegram-desktop
    caprine-bin
    teams-for-linux
    nextcloud-client
    easyeffects
    partition-manager
    nextcloud-client
    onedrivegui
    libreoffice-fresh
    upscayl
    jellyfin-media-player
    thunderbird
    filezilla
    handbrake
    xsane
    ocrmypdf
    # Terminal
    kitty
    wezterm
    nerdfonts
    micro
    neovim
    helix
    btop
    yazi
    lazygit
    systemctl-tui
    ffmpegthumbnailer
    unar
    file
    jq
    poppler
    wl-clipboard
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
    gping
    doggo
    speedtest-rs
    cfspeedtest
    bandwhich
    tealdeer
    erdtree
    cava
    unimatrix
    cowsay
    lolcat
    peaclock
    browsh
    tomato-c
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
  ];
  # Obsidian electron ovveride
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];
}