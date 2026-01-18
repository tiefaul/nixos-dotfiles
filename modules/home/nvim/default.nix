# nvim configuration

{ pkgs, config, lib, ... }:
let
  cfg = config.tyler-space.nvim;
in {
  options.tyler-space.nvim = {
     enable = lib.mkEnableOption "Enable nvim";
  };

  config = lib.mkIf cfg.enable {
     programs.neovim.enable = true;
     home.file.".config/nvim".source = ./nvim/.;
  };
}

