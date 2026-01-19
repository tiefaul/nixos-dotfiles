{ inputs, config, lib, ... }:
let
  nvfsettings = import ./settings.nix;
  cfg = config.tyler-space.tyler.nvf;
in {
  options.tyler-space.tyler.nvf = {
    enable = lib.mkEnableOption "Enable nvf";
  };

  imports = [ inputs.nvf.homeManagerModules.default ];
  
  config = lib.mkIf cfg.enable {
     programs.nvf = {
       enable = true;
       settings = nvfsettings;
     };
  };
}


