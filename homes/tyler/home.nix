{ config, pkgs, ... }: {

  home.username = "tyler";
  home.homeDirectory = "/home/tyler";

  home.packages = [
    pkgs.neovim
    pkgs.python314
  ];

  home.stateVersion = "25.05";
}

