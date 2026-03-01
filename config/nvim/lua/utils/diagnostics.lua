-- ==================================================
-- Neovim Diagnostics Configuration
-- File: diagnostics.lua
-- Purpose: Setup diagnostic signs and display options
-- ==================================================

local M = {}

-- ------------------ Define Diagnostic Signs ----------------
local diagnostic_signs = {
	Error = "󰅚 ",
	Warn = "󰀪 ",
	Info = "󰋽 ",
	Hint = "󰌵 ",
}

-- ------------------ Setup Diagnostics ----------------
M.setup = function()
	vim.diagnostic.config({
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = diagnostic_signs.Error,
				[vim.diagnostic.severity.WARN] = diagnostic_signs.Warn,
				[vim.diagnostic.severity.INFO] = diagnostic_signs.Info,
				[vim.diagnostic.severity.HINT] = diagnostic_signs.Hint,
			},
		},
	})
end

return M
