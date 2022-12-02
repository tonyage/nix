{
  description = "home-manager and nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hardware.url = "github:nixos/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nurpkgs.url = "github:nix-community/NUR";
    vim-plugins.url = "path:./modules/editor/nvim/plugins";
    rust.url = "github:oxalica/rust-overlay";
  };

  outputs = { self, nixpkgs, home-manager, nurpkgs, vim-plugins, rust, ... }@inputs:
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
        _module.args = { colorscheme = import ./colorschemes/dusky.nix; };
        programs.home-manager.enable = true;
        home.stateVersion = "22.05";
        imports = [ 
	        ./modules/browser
          ./modules/editor
          ./modules/chat
          ./modules/tui
          ./modules/misc.nix
	      ];

        nixpkgs = {
          overlays = [
            nurpkgs.overlay
            vim-plugins.overlay
            rust.overlays.default
          ];
          config.allowUnfree = true;
          config.allowUnfreePredicate = (_: true);
        };
        systemd.user.startServices = "sd-switch";
      };

      linux = {
        home.homeDirectory = "/home/tony";
        home.username = "tony";
	      imports = [ ./modules/de ];
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
        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs outputs; };
          modules = [ ./nixos/configuration.nix ];
        };
      };

      homeConfigurations = {
        "tony@nixos" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
	          common
	          linux
	        ];
        };
      };
    };
}
