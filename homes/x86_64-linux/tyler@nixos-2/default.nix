{ pkgs, config, ... }: {

  home.username = "tyler";
  home.homeDirectory = "/home/tyler";
  home.packages = with pkgs; [ lazygit ];
  programs.home-manager.enable = true;

  tyler-space.tyler = {
    nvim.enable = true;
    zsh.enable = true;
  };

  home.stateVersion = "24.05";
}
