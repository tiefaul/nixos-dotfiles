{
  # Formatter
  conform-nvim = {
    enable = true;
    setupOpts = {
      format_on_save = { };
      formatters_by_ft = {
        nix = [
          "nixfmt"
        ];
        lua = [
          "stylua"
        ];
        css = [
          "stylua"
        ];
        html = [
          "stylua"
        ];
        yaml = [
          "stylua"
        ];
      };
    };
  };
}
