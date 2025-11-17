{ config, pkgs, ... }: {

  home.username = "tyler";
  home.homeDirectory = "/home/tyler";
  home.packages = with pkgs; [
    python314
  ];

  # Nvim configuration
  home.file.".config/nvim".source = ./nvim-config/.;
  home.file.".config/nvim".recursive = true;
  programs.neovim.enable = true;

  programs.home-manager.enable = true;
  
  home.stateVersion = "25.05";
}

