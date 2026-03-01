-- ==================================================
-- Bash LSP Configuration
-- File: bashls.lua
-- Purpose: Setup bash-language-server with Neovim LSP
-- ==================================================

return function(capabilities)
	vim.lsp.config('bashls',{
		capabilities = capabilities,
		filetypes = { "sh", "bash", "zsh" },
	})
end
