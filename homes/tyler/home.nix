{ pkgs, config, ... }: { 

  home.username = "tyler";
  home.homeDirectory = "/home/tyler";
  home.packages = with pkgs; [
    python314
  ];

  # Nvim configuration
  programs.neovim.enable = true;
  home.file.".config/nvim".source = ./nvim-config/.;

  # Zsh configuration
  programs.zsh = {
    enable = true;
    autosuggestion = {
      enable = true;
    };
    syntaxHighlighting = {
      enable = true;
    };
  };

  programs.zsh.oh-my-zsh = {
    enable = true;
    theme = "agnoster";
    plugins = [ "git" ];

  };

  # Home-Manager
  programs.home-manager.enable = true;
  
  home.stateVersion = "25.05";
}

