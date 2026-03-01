-- ==================================================
-- Clang LSP Configuration
-- File: clangd.lua
-- Purpose: Setup clangd for C/C++ with Neovim LSP
-- ==================================================

return function(capabilities)
	vim.lsp.config('clangd',{
		capabilities = capabilities,
		cmd = {
			"clangd",
			"--offset-encoding=utf-16",
		},
		filetypes = { "c", "cpp" },
	})
end
