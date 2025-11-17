{
  description = "Tyler's Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, nixpkgs-stable,... }@inputs:
  let
    system = "x86_64-linux";
  in  {
    nixosConfigurations = {
      nixos-2 = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./systems/nixos-2/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.tyler = ./homes/tyler/home.nix; 
          }
        ];
      };
   #  another-host = nixpkgs.lib.nixosSystem {...}
    };
  };
}
