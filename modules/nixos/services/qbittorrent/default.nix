{ config, lib, pkgs, ... }:
let
  cfg = config.tyler-space.services.qbittorrent;
in 
  {
    options.tyler-space.services.qbittorrent = {
      enable = lib.mkEnableOption "Enable qbittorrent";
    };

    config = lib.mkIf cfg.enable {
      services.qbittorrent = {
        enable = true;
        openFirewall = true;
        webuiPort = 8090;
        group = "media";
      };
    };
  }
