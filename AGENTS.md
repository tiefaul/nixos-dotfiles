# AGENTS.md - Development Guide for AI Agents

This repository contains a Nix Flake configuration for managing NixOS systems and Home Manager user environments. It utilizes the `snowfall-lib` library to structure the configuration.

## 1. Build, Test, and Lint Commands

These commands are essential for verifying changes and applying configurations.

### System Configuration (NixOS)
To apply changes to the system configuration (e.g., modifying `systems/x86_64-linux/nixos-2/default.nix` or system-level modules):

```bash
# Apply system configuration
sudo nixos-rebuild switch --flake .#<hostname>
# Example:
sudo nixos-rebuild switch --flake .#nixos-2
```

### User Configuration (Home Manager)
To apply changes to the user configuration (e.g., modifying `homes/x86_64-linux/tyler@nixos-2/default.nix` or user-level modules):

```bash
# Apply home-manager configuration
home-manager switch --flake .#<user>@<hostname>
# Example:
home-manager switch --flake .#tyler@nixos-2
```

### Formatting
Code consistency is enforced using `nixfmt`. Always format files before committing.

```bash
# Format all files in the current directory and subdirectories
nixfmt .
# Format a specific file
nixfmt path/to/file.nix
```

### Validation
Check the validity of the flake and its outputs.

```bash
# Check the flake for errors
nix flake check
```

## 2. Project Structure

The project follows the `snowfall-lib` directory structure:

*   `flake.nix`: The entry point defining inputs and outputs.
*   `homes/`: User configurations (Home Manager).
    *   Structure: `homes/<system>/<user>@<hostname>/default.nix`
*   `systems/`: System configurations (NixOS).
    *   Structure: `systems/<system>/<hostname>/default.nix`
*   `modules/`: Reusable Nix modules.
    *   `modules/home/`: Modules for Home Manager (user-level).
    *   `modules/nixos/`: Modules for NixOS (system-level).
*   `simple-website/`: A static website project served by Nginx.

## 3. Code Style and Conventions

Adhere strictly to these guidelines to maintain consistency with the existing codebase.

### General Formatting
*   **Indentation:** Use 2 spaces for indentation.
*   **Lines:** Keep lines reasonable (soft limit ~80-100 chars), but do not break long URLs or paths if it hurts readability.
*   **Comments:**
    *   Use `#` for comments.
    *   Use header comments to separate sections in large files (e.g., `#-------------------------System settings-------------------------------------#`).
    *   Add comments to explain *why* a complex configuration exists, not just *what* it does.

### Nix Module Pattern
When creating or modifying modules in `modules/`, follow the standard NixOS module pattern.

**Template:**
```nix
{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.tyler-space.<namespace>.<module-name>;
in
{
  options.tyler-space.<namespace>.<module-name> = {
    enable = lib.mkEnableOption "Enable <module-name>";
    
    # Define other options here using lib.mkOption
    someOption = lib.mkOption {
      type = lib.types.str;
      default = "default-value";
      description = "Description of the option.";
    };
  };

  config = lib.mkIf cfg.enable {
    # Configuration to apply when the module is enabled
    programs.some-program = {
      enable = true;
      settings = cfg.someOption;
    };

    home.packages = with pkgs; [
      some-package
    ];
  };
}
```

### Naming Conventions
*   **Namespace:** All custom options must reside under the `tyler-space` namespace.
    *   User modules: `tyler-space.tyler.<module-name>`
    *   System modules: `tyler-space.services.<module-name>` or similar.
*   **Files:**
    *   Module definitions: `default.nix` inside a directory named after the module (e.g., `modules/home/tyler/zsh/default.nix`).
    *   Support files: Helper files should have descriptive names (e.g., `settings/lsp.nix`) and be imported by `default.nix`.

### Imports
*   Use `imports = [ ./path/to/file.nix ];` to split large configurations.
*   Relative paths should be used for internal imports.

### Package Management
*   Use `pkgs` passed as an argument.
*   Use `with pkgs; [ ... ]` for lists of packages when brevity is preferred and no conflicts exist.
*   For specific versions or unfree packages, ensure `nixpkgs.config.allowUnfree = true` is set in the system config.

### Error Handling
*   Nix is a functional language; errors are usually build-time.
*   Use `assertions` in modules to enforce invalid configurations.

```nix
config = lib.mkIf cfg.enable {
  assertions = [
    {
      assertion = cfg.someOption != "";
      message = "someOption must be set when the module is enabled.";
    }
  ];
};
```

## 4. Specific Workflows

### Adding a New Package
1.  Identify if it's a system-wide or user-specific package.
2.  Add it to `environment.systemPackages` (system) or `home.packages` (user).
3.  Run `nix search <package>` to find the correct attribute name.

### Creating a New Module
1.  Create the directory structure: `modules/<home|nixos>/<namespace>/<module-name>/`.
2.  Create `default.nix` with the module template.
3.  Snowfall Lib will automatically detect and import the module.
4.  Enable the module in the relevant `homes/` or `systems/` configuration:
    ```nix
    tyler-space.<namespace>.<module-name>.enable = true;
    ```

### Managing the Website
The `simple-website` directory contains a static site.
*   Changes to `simple-website/` are deployed via the Nginx configuration in `systems/x86_64-linux/nixos-2/default.nix`.
*   After editing HTML/CSS, rebuild the system (`sudo nixos-rebuild switch ...`) to apply changes if the files are copied to the store, or just reload nginx if mapped directly (check config implementation).

## 5. Safety and Security
*   **Secrets:** Do not commit secrets (API keys, passwords) directly to the repo. Use `sops-nix` or `git-crypt` if secret management is needed (currently not observed, but good practice).
*   **Review:** Always review the diff before running `switch` commands.
*   **Root Access:** `nixos-rebuild` requires `sudo`. Be careful with commands running as root.

## 6. AI Agent Guidelines
*   **Context:** You are working in a NixOS environment. Assume typical Linux tools are available but managed via Nix.
*   **Modifications:** Prefer creating new modules over hardcoding settings in `default.nix` for reusability.
*   **Verification:** If asked to verify changes, suggest running `nix flake check` or the relevant build command.
