# Key Mappings
[
  {
    key = "<C-x>";
    mode = "t";
    silent = true;
    action = "<C-\\><C-n>"; # use escape character `\` to exit the \
    desc = "Exit terminal into normal mode.";
  }
  {
    key = "<leader>ll";
    mode = "n";
    action = "<cmd>:set relativenumber!<CR>";
    desc = "Toggle line number modes";
  }
]
