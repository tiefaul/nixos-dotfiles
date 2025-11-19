{ pkgs, config, ... }: { 

  home.username = "tyler";
  home.homeDirectory = "/home/tyler";
  home.packages = with pkgs; [
    python314
  ];

  # Nvim configuration
  programs.neovim.enable = true;
  home.file.".config/nvim" = { 
    source = ./nvim-config/.;
    recursive = true;
    };

  programs.home-manager.enable = true;
  
  home.stateVersion = "25.05";
}

