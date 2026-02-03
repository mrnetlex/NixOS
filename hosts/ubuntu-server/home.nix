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
	fresh-editor
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
  ];
  programs.nh = {
  	enable = true;
  	flake = "/home/netlex/NixOS";
  };
}
