{ pkgs, ... }:
{
  programs.home-manager.enable = true;
  programs.claude-code.enable = false;

  home.username = "tyler";
  home.homeDirectory = "/home/tyler";
  home.packages = with pkgs; [
    lazygit
    nixfmt
    stylua
    prettier
  ];

  tyler-space.tyler = {
    zsh.enable = true;
    nvf.enable = true;
  };

  home.stateVersion = "25.11";
}
