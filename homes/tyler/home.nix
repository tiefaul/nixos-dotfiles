{ config, pkgs, ... }: 
 
  let
    nvimConfig = builtins.path { path = ./nvim-config; };
  in  {
    home.username = "tyler";
    home.homeDirectory = "/home/tyler";
    home.packages = with pkgs; [
      python314
    ];

    # Nvim configuration
    programs.neovim.enable = true;
    home.file.".config/nvim".source = "${nvimConfig}";

    programs.home-manager.enable = true;
  
    home.stateVersion = "25.05";
}

