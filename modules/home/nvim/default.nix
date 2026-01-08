# nvim configuration

{ pkgs, config, options, lib, ... }:
let
  nvim_config = pkgs.fetchFromGitHub {
    owner = "tiefaul";
    repo  = "nvim";
    rev   = "main";          # tag, branch, or commit SHA
    hash  = "sha256-xyCZcFYdTLbqpiomirATMsksygwNOgIZs07Y3qtAmWQ=";
  };
  cfg = config.tyler-space.nvim;
in {
  options.tyler-space.nvim = {
     enable = lib.mkEnableOption "Enable nvim";
  };

  config = lib.mkIf cfg.enable {
     programs.neovim.enable = true;
     home.file.".config/nvim".source = nvim_config;
  };
}

