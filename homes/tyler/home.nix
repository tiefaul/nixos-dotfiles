{ config, pkgs, ... }: { 

    home.username = "tyler";
    home.homeDirectory = "/home/tyler";
    home.packages = with pkgs; [
      python314
    ];

    # Nvim configuration
    programs.neovim.enable = true;
    nvimConfig = builtins.path { path = ./nvim-config; }
    home.file.".config/nvim".source = ./nvim-config/.;

    programs.home-manager.enable = true;
  
    home.stateVersion = "25.05";
}

