-- ==================================================
-- Neovim Mini Plugins Configuration
-- File: mini.lua
-- Purpose: Load and setup mini.nvim modules
-- ==================================================

return {
  {
    "echasnovski/mini.nvim",

    -- ------------------ Version ----------------
    version = false,

    -- ------------------ Configuration ----------------
    config = function()
      require("mini.ai").setup()
      require("mini.pairs").setup()
      require("mini.comment").setup()
      require("mini.statusline").setup()
    end,
  },
}

