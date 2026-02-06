{ pkgs, systemSettings, ... }:
{
  # Basics
  home.username = "${systemSettings.username}";
  home.homeDirectory = "/home/${systemSettings.username}";
  home.stateVersion = "25.11"; # Match your current install
  
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
	bat
	btop 
	chezmoi 
	delta 
	dust 
	duf
	eza
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


  home.sessionVariables = {
    EDITOR = "micro";
  };
  
  #Starship
  home.file.".config/starship.toml".source = ./../../dotfiles/starship.toml;

  imports = [
  	./../../modules/home/fastfetch.nix
  	./../../modules/home/television.nix
  	./../../modules/home/fish.nix
  	./../../modules/home/bat.nix
  	./../../modules/home/btop.nix
  	./../../modules/home/git.nix
  	./../../modules/home/micro.nix
  	./../../modules/home/yazi.nix
  	./../../modules/home/atuin.nix
  ];
}
