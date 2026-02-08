{
  description = "Netlex's flake";

  outputs = inputs @ { self, nixpkgs-unstable, nixpkgs-stable, home-manager, home-manager-stable, stylix, ...}: 
    {
      nixosConfigurations = {
        workstation = nixpkgs-unstable.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/workstation/configuration.nix
            inputs.nix-flatpak.nixosModules.nix-flatpak
            inputs.nix-index-database.nixosModules.default
            inputs.stylix.nixosModules.stylix
            inputs.sops-nix.nixosModules.sops
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.netlex = {
              	imports = [
              		./hosts/workstation/home.nix
              		inputs.sops-nix.homeManagerModules.sops
              	];
              };
              home-manager.extraSpecialArgs = { inherit (import ./hosts/workstation/settings.nix) systemSettings; };
            }
          ];
          specialArgs = { 
            inherit inputs;
            inherit (import ./hosts/workstation/settings.nix) systemSettings; 
          };
        };

        q957 = nixpkgs-stable.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/q957/configuration.nix
            inputs.nix-index-database.nixosModules.default
            inputs.stylix.nixosModules.stylix
            inputs.sops-nix.nixosModules.sops
            inputs.home-manager-stable.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.netlex = {
              	imports = [
              		./hosts/q957/home.nix
              		inputs.sops-nix.homeManagerModules.sops
              	];
              };
              home-manager.extraSpecialArgs = { inherit (import ./hosts/q957/settings.nix) systemSettings; };
            }
          ];
          specialArgs = { 
            inherit inputs;
            inherit (import ./hosts/q957/settings.nix) systemSettings; 
          };
        };

        WSL-nix = nixpkgs-unstable.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            { nix.registry.nixpkgs.flake = nixpkgs-unstable; }
            ./hosts/WSL/configuration.nix
            inputs.NixOS-WSL.nixosModules.wsl
            inputs.nix-index-database.nixosModules.default
            { programs.nix-index-database.comma.enable = true; }
            inputs.stylix.nixosModules.stylix
            inputs.sops-nix.nixosModules.sops	
            home-manager.nixosModules.home-manager
            {
        	  home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.netlex = {
              	imports = [
              		./hosts/WSL/home.nix
              		inputs.sops-nix.homeManagerModules.sops
              	];
              };
              home-manager.extraSpecialArgs = { inherit (import ./hosts/WSL/settings.nix) systemSettings; };
            }
          ];
          specialArgs = { 
            inherit inputs;
            inherit (import ./hosts/WSL/settings.nix) systemSettings;
          };
        };
      };
		homeConfigurations = {
		  "netlex@q957" = home-manager.lib.homeManagerConfiguration {
		    pkgs = nixpkgs-unstable.legacyPackages."x86_64-linux";
		    extraSpecialArgs = { 
		      inherit inputs; 
		      inherit (import ./hosts/ubuntu-server/settings-x86.nix) systemSettings; 
		    };
		    modules = [ 
		    inputs.sops-nix.homeManagerModule
		    ./hosts/ubuntu-server/home.nix 
		    ];
		  };
		
		  "netlex@oracle-flex" = home-manager.lib.homeManagerConfiguration {
		    pkgs = nixpkgs-unstable.legacyPackages."aarch64-linux";
		    extraSpecialArgs = { 
		      inherit inputs; 
		      inherit (import ./hosts/ubuntu-server/settings-arm.nix) systemSettings; 
		    };
		    modules = [ 
		    inputs.sops-nix.homeManagerModule
		    ./hosts/ubuntu-server/home.nix 
		    ];
		  };
		};
    };

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";

    NixOS-WSL.url = "github:nix-community/NixOS-WSL";
    NixOS-WSL.inputs.nixpkgs.follows = "nixpkgs-unstable";
    
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";

    home-manager-stable.url = "github:nix-community/home-manager/release-25.11";
    home-manager-stable.inputs.nixpkgs.follows = "nixpkgs-stable";

    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs-unstable";

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs-unstable";

    stylix.url = "github:nix-community/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs-unstable";

    spicetify-nix.url = "github:the-argus/spicetify-nix";
  };
}
