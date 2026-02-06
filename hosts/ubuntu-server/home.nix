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
  home.file.".config/fastfetch/config.jsonc".source = ./../../dotfiles/fastfetch/config.jsonc;
  home.file.".config/fastfetch/full.jsonc".source = ./../../dotfiles/fastfetch/full.jsonc;
  home.file.".config/fastfetch/simple.jsonc".source = ./../../dotfiles/fastfetch/simple.jsonc;
  
  programs.nh = {
  	enable = true;
  	flake = "/home/netlex/NixOS";
  };
}
