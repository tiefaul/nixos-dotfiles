{
  # Filetree
  nvimTree = {
    enable = true;
    setupOpts = {
      filters = {
        git_ignored = true;
      };
      git = {
        enable = true;
      };
      actions = {
        open_file = {
          resize_window = true;
        };
      };
    };
    mappings = {
      toggle = "<C-n>";
    };
  };
}
