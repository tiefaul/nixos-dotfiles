{ pkgs, ... }:
{
  programs.home-manager.enable = true;

  home.username = "tyler";
  home.homeDirectory = "/home/tyler";
  home.packages = with pkgs; [
    lazygit
    nixfmt
    stylua
    prettier
    bundix
    fixjson
  ];

  tyler-space.tyler = {
    zsh.enable = true;
    nvf.enable = true;
    opencode.enable = true;
  };

  home.stateVersion = "25.11";
}
