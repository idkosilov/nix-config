{
  description = "Mac OS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    home-manager.url = "github:nix-community/home-manager";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, home-manager, nixpkgs }:
  let
    cfg = import ./config.nix;
    user = cfg.user;
    host = cfg.host;
    system = "aarch64-darwin";
    homeDirectory = "/Users/${user}";
    homeStateVersion = "24.11";
  in {
    darwinConfigurations.${host} = nix-darwin.lib.darwinSystem {
      modules = [
        ./darwin/default.nix
        ({ pkgs, ... }: {
          nix.settings.experimental-features = "nix-command flakes";
          nix.enable = false;
          system.configurationRevision = self.rev or self.dirtyRev or null;
          system.stateVersion = 6;
          nixpkgs.hostPlatform = system;

          users.users.${user} = {
            home = homeDirectory;
            shell = pkgs.bash;
          };
        })
      ];
    };

    homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      extraSpecialArgs = {
        inherit inputs homeStateVersion user homeDirectory host;
      };

      modules = [
        ./home-manager/home.nix
      ];
    };
  };
}