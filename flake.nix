{
  description = "home-manager and nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hardware.url = "github:nixos/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwinpkgs = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nurpkgs.url = "github:nix-community/NUR";
    rust.url = "github:oxalica/rust-overlay";
  };

  outputs = { self, nixpkgs, home-manager, darwinpkgs, nurpkgs, rust, ... }@inputs:
    let
      inherit (self) outputs;
      forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];

      common = { ... }: {
        imports = [
          ./modules/editor
          ./modules/shell/ssh
        ];
      };

      user-common = { ... }: {
        _module.args = { colorscheme = import ./colorschemes/dusky.nix; };
        programs.home-manager.enable = true;
        home.stateVersion = "22.05";
        imports = [ 
	        ./modules/browser
          ./modules/editor
          ./modules/chat
          ./modules/shell
          ./modules/misc.nix
	      ];

        nixpkgs = {
          overlays = [
            nurpkgs.overlay
            rust.overlays.default
          ];
          config.allowUnfree = true;
          config.allowUnfreePredicate = _: true;
        };
        systemd.user.startServices = "sd-switch";
      };
      
      system-common = { ... }: {
        imports = [ ./nixos/common/configuration.nix ];
      };

      darwin = {
        home.homeDirectory = "/Users/tony.do";
        home.username = "tony.do";
        imports = [
          ./modules/shell
          ./modules/editor
          ./modules/misc.nix
          ./modules/chat/slack
        ];
      };
       
      linux = {
        home.homeDirectory = "/home/tony";
        home.username = "tony";
	      imports = [ ./modules/de ];
      };

      server = {
        home.homeDirectory = "/home/build";
        home.username = "build";
      };

    in {
      # custom packages go here accessible through 'nix build'
      packages = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
      	in import ./shell.nix { inherit pkgs; }
      );

      # devshell for bootstrapping, accessible through 'nix develop'
      devShells = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
	      in import ./shell.nix { inherit pkgs; }
      );

      overlays = import ./overlays;

      nixosConfigurations = {
        cyclops = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs outputs; };
          modules = [
            system-common
            ./nixos/cyclops/configuration.nix
          ];
        };
        magneto = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs outputs; };
          modules = [
            system-common
            ./nixos/magneto/configuration.nix
          ];
        };
      };

      darwinConfigurations = {
        "m1" = darwinpkgs.lib.darwinSystem {
            system = "aarch64-darwin";
            modules = [
              home-manager.darwinModules.home-manager {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
              }
              ./darwin/configuration.nix
            ];
        };
      };

      homeConfigurations = {
        "tony@cyclops" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            common
	          user-common
	          linux
	        ];
        };
        "build@magneto" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            common
            server
          ];
        };
        "tony.do@m1" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."aarch64-darwin";
          modules = [
            darwin
          ];
        };
      };
    };
}
