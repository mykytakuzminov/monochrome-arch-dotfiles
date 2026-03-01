-- ==================================================
-- Neovim LSP Plugin Configuration
-- File: lsp.lua
-- Purpose: Setup nvim-lspconfig with mason and diagnostic utilities
-- ==================================================

return {
	"neovim/nvim-lspconfig",

  -- ------------------ Dependencies ----------------
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"creativenull/efmls-configs-nvim",
		"hrsh7th/cmp-nvim-lsp",
	},

  -- ------------------ Configuration ----------------
	config = function()
    -- Setup diagnostic signs and configuration
		require("utils.diagnostics").setup()

    -- Load and configure LSP servers
		require("servers")
	end,
}
