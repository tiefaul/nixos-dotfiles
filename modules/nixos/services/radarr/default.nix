{ config, lib, pkgs, ... }:
let
  cfg = config.tyler-space.services.radarr;
in 
  {
    options.tyler-space.services.radarr = {
      enable = lib.mkEnableOption "Enable Radarr";
    };

    config = lib.mkIf cfg.enable {
      services.radarr = {
        enable = true;
        openFirewall = true;
        group = "media";
      };
    };
  }
