{ inputs, ... }:
let
  pkgs = inputs.nixpkgs.legacyPackages."x86_64-linux";
  env = pkgs.bundlerEnv {
    name = "levitatecold";
    ruby = pkgs.ruby;
    gemfile = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset = ./gemset.nix;
  };
in
pkgs.mkShell {
  buildInputs = [
    env
    pkgs.ruby
    pkgs.imagemagick
    pkgs.jupyter
  ];
}
