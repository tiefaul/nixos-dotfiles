return {
  -- Conform
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },
  -- Lspconfig
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  -- Copilot
  {
    "github/copilot.vim",
    cmd = "Copilot",
    keys = {
      { "<leader>ca", "<cmd>Copilot<cr>", desc = "Toggle Copilot Autocomplete" },
    },
  },
  -- CopilotChat
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    cmd = "CopilotChat",
    keys = {
      { "<leader>cc", "<cmd>CopilotChat<cr>", desc = "Toggle Copilot Chat" },
    },
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = require "configs.copilotchat",
  },
  -- Autosave
  {
    "Pocco81/auto-save.nvim",
    lazy = false,
    opts = require "configs.autosave",
    keys = {
      { "<leader>zv", "<cmd>ASToggle<cr>", desc = "Toggle autosave" },
    },
  },
  -- Live-Preview
  {
    "brianhuster/live-preview.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      { "<leader>lp", "<cmd>LivePreview start<cr>", desc = "Start LivePreview" },
      { "<leader>lc", "<cmd>LivePreview close<cr>", desc = "Close LivePreview" },
    },
  },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },
}
