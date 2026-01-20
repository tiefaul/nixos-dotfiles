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

    # Key Mappings
    keymaps = [
      {
        key = "<C-x>";
        mode = "t";
        silent = true;
        action = "<C-\\><C-n>"; # use escape character `\` to exit the \
        desc = "Exit terminal into normal mode.";
      }
    ];

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
      go.enbale = true;
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
