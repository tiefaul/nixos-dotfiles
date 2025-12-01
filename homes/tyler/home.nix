{ pkgs, config, ... }: {

  home.username = "tyler";
  home.homeDirectory = "/home/tyler";
  home.packages = with pkgs; [
    python314
  ];
  
  imports = [
    ./configurations/nvim/default.nix
    ./configurations/zsh/default.nix
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "25.05";
}
