-- ==================================================
-- Lua LSP Server Configuration
-- File: servers/lua_ls.lua
-- Purpose: Configure lua_ls with capabilities and workspace settings
-- ==================================================

return function(capabilities)
	vim.lsp.config('lua_ls', {
		capabilities = capabilities,
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						vim.fn.expand("$VIMRUNTIME/lua"),
						vim.fn.expand("$XDG_CONFIG_HOME") .. "/nvim/lua",
					},
				},
			},
		},
	})
end
