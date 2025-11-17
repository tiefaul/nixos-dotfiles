{ config, pkgs, ... }: 

  let
    nvim-config = builtins.path {
      path = ./nvim-config;
      name = "nvim-config";
    };
  in {
    home.username = "tyler";
    home.homeDirectory = "/home/tyler";
    home.packages = with pkgs; [
      python314
    ];

    # Nvim configuration
    programs.neovim.enable = true;
    home.file.".config/nvim".source = inherit nvim-config;

    programs.home-manager.enable = true;
  
    home.stateVersion = "25.05";
}

