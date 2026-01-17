{ config, lib, pkgs, ... }:
let
  cfg = config.tyler-space.services.prowlarr;
in
  {
    options.tyler-space.services.prowlarr = {
      enable = lib.mkEnableOption "Enable prowlarr";
    };

    config = lib.mkIf cfg.enable {
      services.prowlarr = {
        enable = true;
        openFirewall = true;
      };
    };
  }
