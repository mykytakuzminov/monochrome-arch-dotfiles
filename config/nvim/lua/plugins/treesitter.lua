-- ==================================================
-- Neovim Treesitter Plugin Configuration
-- File: nvim-treesitter.lua
-- Purpose: Configure nvim-treesitter plugin, ensure parsers
--          are installed, and set up auto-start for supported filetypes
-- ==================================================

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	lazy = false,

  -- ------------------ Plugin Configuration ----------------
	config = function()
		local treesitter = require("nvim-treesitter")

    -- Basic setup
		treesitter.setup({})

    -- ------------------ Ensure Installed Parsers ----------------
		local ensure_installed = {
			"bash",
			"c",
			"cpp",
			"python",
      "css",
      "html",
      "javascript",
      "json",
      "yaml",
      "lua",
      "markdown",
      "markdown_inline"
		}

		local config = require("nvim-treesitter.config")
		local already_installed = config.get_installed()
		local parsers_to_install = {}

		for _, parser in ipairs(ensure_installed) do
			if not vim.tbl_contains(already_installed, parser) then
				table.insert(parsers_to_install, parser)
			end
		end

		if #parsers_to_install > 0 then
			treesitter.install(parsers_to_install)
		end

    -- ------------------ Auto-start Treesitter on FileType ----------------
		local group = vim.api.nvim_create_augroup("TreeSitterConfig", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			group = group,
			callback = function(args)
				if vim.list_contains(treesitter.get_installed(), vim.treesitter.language.get_lang(args.match)) then
					vim.treesitter.start(args.buf)
				end
			end,
		})
	end,
}
