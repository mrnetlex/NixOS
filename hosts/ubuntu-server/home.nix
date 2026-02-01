{ pkgs, ... }: {
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
	bat
	btop 
	chezmoi 
	delta 
	dust 
	duf
	eza
	fastfetch
	fd
	fzf
	gdu
	grc
	lazydocker
	lazygit
	navi
	ripgrep
	starship
	systemctl-tui
	tealdeer
	television
	traceroute
	trash-cli
	progress
	yazi
	zellij
	zoxide
    # Add other ubuntu-specific tools here
  ];

  programs.starship.enable = true; # Optionally manage config here too
}
