{ config, pkgs, ... }: {

  home.username = "tyler";
  home.homeDirectory = "/home/tyler";

  home.packages = [
    pkgs.nvim
    pkgs.python314
  ];

  home.stateVersion = "25.05";
}

