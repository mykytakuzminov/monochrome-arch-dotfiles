-- ==================================================
-- LSP Servers Initialization
-- File: servers/init.lua
-- Purpose: Setup and enable LSP servers with capabilities
-- ==================================================

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Load individual LSP server configs
require("servers.lua_ls")(capabilities)
require("servers.pyright")(capabilities)
require("servers.bashls")(capabilities)
require("servers.clangd")(capabilities)

require("servers.efm")(capabilities)

-- Enable all servers globally (if needed for autostart)
vim.lsp.enable({
  'lua_ls',
  'pyright',
  'bashls',
  'clangd',
})
