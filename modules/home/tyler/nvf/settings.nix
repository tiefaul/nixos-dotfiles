{ pkgs, ... }:
{
  vim = {
    autopairs = import ./settings/autopairs.nix;
    binds = import ./settings/binds.nix;
    diagnostics = import ./settings/diagnostics.nix;
    filetree = import ./settings/filetree.nix;
    formatter = import ./settings/formatter.nix;
    keymaps = import ./settings/keymaps.nix;
    lsp = import ./settings/lsp.nix;
    options = import ./settings/options.nix;
    statusline = import ./settings/statusline.nix;
    tabline = import ./settings/tabline.nix;
    terminal = import ./settings/terminal.nix;
    theme = import ./settings/theme.nix;
    visuals = import ./settings/visuals.nix;
    languages = import ./settings/languages.nix;
    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;
    git.enable = false;
  };
}
