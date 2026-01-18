# nvim configuration

{ pkgs, config, lib, ... }:
let
  cfg = config.tyler-space.tyler.nvim;
in {
  options.tyler-space.tyler.nvim = {
     enable = lib.mkEnableOption "Enable nvim";
  };

  config = lib.mkIf cfg.enable {
     programs.neovim.enable = true;
     home.file.".config/nvim".source = ./nvim-config/.;
  };
}

