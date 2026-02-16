{
  config,
  lib,
  ...
}:
let
  cfg = config.tyler-space.tyler.opencode;
in
{
  options.tyler-space.tyler.opencode = {
    enable = lib.mkEnableOption "Enable opencode";
  };

  config = lib.mkIf cfg.enable {
    programs.opencode = {
      enable = true;
    };
  };
}
