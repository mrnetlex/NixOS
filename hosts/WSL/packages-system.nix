{ config, pkgs, ... }:

{
  #Packages
  environment.systemPackages = with pkgs; [
	git
    killall
    unzip
	micro
	fresh-editor
    neovim
    wget
    curl
    cloudflared
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
    dust
    duf
    progress
    spotify-player
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
  };
}
