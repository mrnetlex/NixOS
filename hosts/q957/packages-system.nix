{ config, pkgs, ... }:

{
  #Packages
  environment.systemPackages = with pkgs; [
	git
    killall
    unzip
	micro
    neovim
    wget
    curl
    cloudflared
    rsync
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
    speedtest-rs
    cfspeedtest
    bandwhich
    tealdeer
    trash-cli
    ripgrep
    fd
    dust
    duf
    progress
    fastfetch
    #unstable packages from overlay
    unstable.fresh-editor
     ];
  # SERVICES for my  programs
  #plocate
  services.locate = {
    enable = true;
    package = pkgs.plocate;
  };
}
