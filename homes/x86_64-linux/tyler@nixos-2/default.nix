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
<<<<<<< HEAD
    bundix
=======
    fixjson
>>>>>>> f941cdd1a13033bec9edf6c1d35ddf27544d060d
  ];

  tyler-space.tyler = {
    zsh.enable = true;
    nvf.enable = true;
    opencode.enable = true;
  };

  home.stateVersion = "25.11";
}
