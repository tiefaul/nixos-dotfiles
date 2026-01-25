{ pkgs, config, ... }:
{
  home.username = "tyler";
  home.homeDirectory = "/home/tyler";
  home.packages = with pkgs; [
    lazygit
    nixfmt
    stylua
    prettier
  ];

  programs.home-manager.enable = true;

  tyler-space.tyler = {
    zsh.enable = true;
    nvf.enable = true;
  };

  home.stateVersion = "25.11";
}
