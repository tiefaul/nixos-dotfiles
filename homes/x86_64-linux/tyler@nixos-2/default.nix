{ pkgs, config, ... }: {

  home.username = "tyler";
  home.homeDirectory = "/home/tyler";
  home.packages = with pkgs; [
    python314
  ];

  programs.home-manager.enable = true;
  tyler-space.nvim.enable = true;
  tyler-space.zsh.enable = true;

  home.stateVersion = "24.05";
}
