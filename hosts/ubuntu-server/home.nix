{ pkgs, systemSettings, ... }:
{
  # Basics
  home.username = "${systemSettings.username}";
  home.homeDirectory = "/home/${systemSettings.username}";
  home.stateVersion = "25.11"; # Match your current install
  
  programs.home-manager.enable = true;

  sops = {

    defaultSopsFile = ./../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    validateSopsFiles = false;

    age = {
      # this will use an age key that is expected to already be in filesystem
      keyFile = "/home/netlex/.config/sops/age/keys.txt";
      # generate a new key if the key specified above does not exist
      generateKey = true;
    };

    # secrets will be output to /run/secrets
    # e.g. /run/secrets/smb-creds
    secrets = {
      atuin-session = { 
		mode = "0600";
      };
      atuin-key = { 
      	mode = "0600";
      };
    };
  };

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
	sops
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
