{
  description = "Netlex's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    NixOS-WSL.url = "github:nix-community/NixOS-WSL";
    NixOS-WSL.inputs.nixpkgs.follows = "nixpkgs";
    
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    nix-index-database.url = "github:Mic92/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";

    spicetify-nix.url = "github:the-argus/spicetify-nix";
  };

  outputs = inputs @ { self, nixpkgs, NixOS-WSL, home-manager, ...}: 
    let
      systemSettings = {
        username = "netlex";
      };
    in {
      nixosConfigurations = {
        workstation = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/workstation/configuration.nix
            inputs.nix-flatpak.nixosModules.nix-flatpak
            inputs.nix-index-database.nixosModules.nix-index
            inputs.stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.netlex = import ./hosts/workstation/home.nix;
            }
          ];
          specialArgs = { 
            inherit inputs; 
          };
        };

        WSL-nix = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            { nix.registry.nixpkgs.flake = nixpkgs; }
            ./hosts/WSL/configuration.nix
            NixOS-WSL.nixosModules.wsl
            inputs.stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            {
        	  home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.netlex = import ./hosts/WSL/home.nix;
            }
          ];
          specialArgs = { 
            inherit inputs;
            inherit systemSettings; 
          };
        };
      };
    };
}
