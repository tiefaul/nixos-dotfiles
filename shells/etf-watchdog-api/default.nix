{
  lib,
  pkgs,
  inputs,
  ...
}:
let
  workspace = inputs.uv2nix.lib.workspace.loadWorkspace { workspaceRoot = ./.; };

  overlay = workspace.mkPyprojectOverlay {
    sourcePreference = "wheel";
  };

  python = pkgs.python314;
  pythonSet =
    (pkgs.callPackage inputs.pyproject-nix.build.packages {
      inherit python;
    }).overrideScope
      (
        lib.composeManyExtensions [
          inputs.pyproject-build-systems.overlays.wheel
          overlay
        ]
      );

  virtualenv = pythonSet.mkVirtualEnv "etf-watchdog-api" workspace.deps.default;

in
pkgs.mkShell {
  packages = [
    virtualenv
    pkgs.uv
    pkgs.docker
  ];

  env = {
    UV_NO_SYNC = "1";
    UV_PYTHON = pythonSet.python.interpreter;
    UV_PYTHON_DOWNLOADS = "never";
  };

  shellHook = ''
    unset PYTHONPATH
  '';
}
