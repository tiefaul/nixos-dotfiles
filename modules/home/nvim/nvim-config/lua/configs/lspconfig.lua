require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "basedpyright",
  "ccls",
  "ruff",
  "marksman",
  "yamlls",
  "docker_language_server",
  "jsonls",
  "gopls",
  "vtsls",
  "tailwindcss",
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
