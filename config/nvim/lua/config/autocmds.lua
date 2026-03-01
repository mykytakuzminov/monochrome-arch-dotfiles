-- ==================================================
-- Neovim AutoCommands
-- File: autocmds.lua
-- Purpose: Define autocommands
-- ==================================================

-- Trigger when entering a window or buffer
vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
  callback = function(data)
    local tree_api = require("nvim-tree.api")  -- Access nvim-tree API
    local hl = vim.api.nvim_get_hl(0, { name = "Cursor", link = false })

    if tree_api.tree.is_tree_buf(data.buf) then
      -- Hide cursor in nvim-tree buffer
      vim.api.nvim_set_hl(0, "Cursor", { blend = 100, fg = hl.fg, bg = hl.bg })
      vim.opt_local.guicursor:append("a:Cursor/lCursor")
    else
      -- Restore cursor in normal buffers
      vim.api.nvim_set_hl(0, "Cursor", { blend = 0, fg = hl.fg, bg = hl.bg })
      vim.opt_local.guicursor:remove("a:Cursor/lCursor")
    end
  end,
})
