{
  description = "Flake of Netlex";

  outputs = inputs @ { self, nixpkgs, NixOS-WSL, home-manager, ...}: 
    {
      nixosConfigurations = {
        workstation = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/workstation/configuration.nix
            inputs.nix-flatpak.nixosModules.nix-flatpak
            inputs.nix-index-database.nixosModules.nix-index
            inputs.stylix.nixosModules.stylix
            inputs.sops-nix.nixosModules.sops
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.netlex = import ./hosts/workstation/home.nix;
              home-manager.extraSpecialArgs = { inherit (import ./hosts/workstation/settings.nix) systemSettings; };
            }
          ];
          specialArgs = { 
            inherit inputs;
            inherit (import ./hosts/workstation/settings.nix) systemSettings; 
          };
        };

        WSL-nix = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            { nix.registry.nixpkgs.flake = nixpkgs; }
            ./hosts/WSL/configuration.nix
            NixOS-WSL.nixosModules.wsl
            inputs.stylix.nixosModules.stylix
            inputs.sops-nix.nixosModules.sops
            home-manager.nixosModules.home-manager
            {
        	    home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.netlex = import ./hosts/WSL/home.nix;
              home-manager.extraSpecialArgs = { inherit (import ./hosts/WSL/settings.nix) systemSettings; };
            }
          ];
          specialArgs = { 
            inherit inputs;
            inherit (import ./hosts/WSL/settings.nix) systemSettings;
          };
        };
      };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    NixOS-WSL.url = "github:nix-community/NixOS-WSL";
    NixOS-WSL.inputs.nixpkgs.follows = "nixpkgs";
    
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    nix-index-database.url = "github:Mic92/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";

    spicetify-nix.url = "github:the-argus/spicetify-nix";
  };
}
