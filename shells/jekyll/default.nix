{ pkgs, ... }:
let
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
