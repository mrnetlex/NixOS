{ config, pkgs, ... }:

{
  #Packages
  environment.systemPackages = with pkgs; [
    firefox
	git
    killall
    unzip
	micro
    neovim
    wget
    curl
    rsync
    helix
    btop
	yazi
    lazygit
    systemctl-tui
    ffmpegthumbnailer
    glow
    unar
    file
    jq
    poppler
    wl-clipboard
	zoxide
    starship
    navi
    fzf
    bat
    bat-extras.batman
    bat-extras.batgrep
    #bat-extras.batdiff
    eza
    grc
    gdu
    delta
	gping
    doggo
    speedtest-rs
    cfspeedtest
    bandwhich
    tealdeer
    erdtree
	unimatrix
    cowsay
    lolcat
    peaclock
    browsh
    wego
    tomato-c
    sl
    trash-cli
    ripgrep
    fd
    du-dust
    duf
    progress
    spotify-player
    termusic
    ani-cli
    nitch
    fastfetch
    ramfetch
    pipes-rs
    pokemon-colorscripts-mac
    cbonsai
    ocrmypdf
  ];
  # SERVICES for my  programs
  #plocate
  services.locate = {
    enable = true;
    package = pkgs.plocate;
    localuser = null;
  };
}
