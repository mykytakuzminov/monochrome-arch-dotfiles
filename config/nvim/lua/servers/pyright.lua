-- ==================================================
-- Pyright LSP Server Configuration
-- File: servers/pyright.lua
-- Purpose: Configure Pyright with capabilities and workspace settings
-- ==================================================

return function(capabilities)
	vim.lsp.config('pyright', {
		capabilities = capabilities,
		settings = {
			pyright = {
				disableOrganizeImports = false,
				analysis = {
					useLibraryCodeForTypes = true,
					autoSearchPaths = true,
					diagnosticMode = "workspace",
					autoImportCompletions = true,
				},
			},
		},
	})
end
