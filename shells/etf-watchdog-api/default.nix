{ inputs, ... }:
let
  pkgs = inputs.nixpkgs.legacyPackages."x86_64-linux";
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    python314
    uv
  ];
  shellHook = ''
    echo "###########################"                    
    echo "Etf-Watchdog shell launched"
    echo "###########################"
    cd ~/projects/etf-watchdog-api/
    uv sync
  '';
}
