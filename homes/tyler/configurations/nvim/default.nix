# Nvim configuration

{ pkgs, config, ... }: {

  programs.neovim.enable = true;
  home.file.".config/nvim".source = ./nvim-config/.;

  }

