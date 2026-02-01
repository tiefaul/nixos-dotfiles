{
  inputs,
  bundlerEnv,
  mkShell,
  ...
}:
let
  pkgs = inputs.nixpkgs.legacyPackages."x86_64-linux";
  env = bundlerEnv {
    name = "levitatecold";
    inherit (pkgs) ruby;
    gemfile = ./myblog/Gemfile;
    lockfile = ./myblog/Gemfile.lock;
    gemset = ./myblog/gemset.nix;
  };
in
mkShell {
  buildInputs = [
    env
    pkgs.bundler
    pkgs.ruby
  ];
}
