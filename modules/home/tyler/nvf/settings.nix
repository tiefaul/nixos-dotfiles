{ lib, ... }:
let
  inherit (lib.generators) mkLuaInline;
in
{
  vim = {
    # Single line enables
    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;
    git.enable = true;

    # Binds
    binds = {
      whichKey = {
        enable = true;
      };
    };

    # Options
    options = {
      relativenumber = false;
    };

    # Key Mappings
    keymaps = [
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
    ];

    # Autopairs
    autopairs = {
      nvim-autopairs = {
        enable = true;
      };
    };

    # Formatter
    formatter = {
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
    };

    # Diagnostics
    diagnostics = {
      enable = true;
      config = {
        virtual_text = true;
      };
    };

    # Visuals
    visuals = {
      indent-blankline = {
        enable = true;
      };
      rainbow-delimiters = {
        enable = true;
      };
    };

    # Enable LSP
    lsp = {
      enable = true;
    };

    # LSP server
    languages = {
      enableTreesitter = true;
      nix.enable = true;
      ts.enable = true;
      rust.enable = true;
      python.enable = true;
      html.enable = true;
      go.enable = true;
    };

    # Statusline settings
    statusline.lualine = {
      enable = true;
      icons = {
        enable = true;
      };
    };

    # Theme settings
    theme = {
      enable = true;
      name = "gruvbox";
      style = "dark";
    };

    # Filetree settings
    filetree = {
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
    };

    # Tabline settings
    tabline = {
      nvimBufferline = {
        enable = true;
        mappings = {
          cycleNext = "<tab>";
          closeCurrent = "<Leader>x";
        };
      };
    };

    # Terminal settings
    terminal = {
      toggleterm = {
        enable = true;
        mappings = {
          open = "<Leader>z";
        };
        setupOpts = {
          direction = "float";
          enable_winbar = true;
        };
      };
    };

  };
}
