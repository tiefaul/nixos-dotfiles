{ config, lib, pkgs, ... }:
let
  cfg = config.tyler-space.services.jellyfin;
in
  {
    options.tyler-space.services.jellyfin = {
      enable = lib.mkEnableOption "Enable jellyfin";
    };

    config = lib.mkIf cfg.enable {
      services.jellyfin = {
        enable = true;
        openFirewall = true;
        group = "media";
      };
  };
}
