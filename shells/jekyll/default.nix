{
  inputs,
  bundlerEnv,
  stdenv,
  ...
}:
let
  pkgs = inputs.nixpkgs.legacyPackages."x86_64-linux";
  env = bundlerEnv {
    name = "levitatecold";
    ruby = pkgs.ruby;
    gemfile = ./myblog/Gemfile;
    lockfile = ./myblog/Gemfile.lock;
    gemset = ./myblog/gemset.nix;
  };
in
stdenv.mkDerivation {
  name = "levitatecold";
  buildInputs = [
    env
    pkgs.nodejs
  ];
}
