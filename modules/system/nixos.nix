{config, pkgs, systemSettings, ...}:

{
  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Disable "warning: Git tree '/home/netlex/nixos' is dirty"
  nix.extraOptions = "warn-dirty = false";
  
  # Automatic nix optimise and garbage collection
  nix.optimise.automatic = true;
  nix.optimise.dates = [ "17:30" ];
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  # For nvd to display nice diff when switching configurations, kinda unnecessery with NH
  system.activationScripts.diff = {
    supportsDryActivation = true;
    text = ''
      ${pkgs.nvd}/bin/nvd --nix-bin-dir=${pkgs.nix}/bin diff /run/current-system "$systemConfig"
    '';
  };

  # Run normal binaries in nix
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged 
    # programs here, NOT in environment.systemPackages
  ];
  # Packages
  environment.systemPackages = with pkgs; [
    nvd
    nixpkgs-fmt #nix formater
    deadnix #remove dead nix code
    nix-tree
    nix-du
    graphviz #needed for nix-du nice graphs
    nh
  ];

  # NH - nix helper
  programs.nh = {
    enable = true;
    flake = "/home/${systemSettings.username}/NixOS";
  };

}
