-- ==================================================
-- Neovim Telescope Plugin Configuration
-- File: telescope.lua
-- Purpose: Configure telescope.nvim with FZF native
--          extension, keymaps, and dependencies
-- ==================================================

return {
  'nvim-telescope/telescope.nvim',

  -- ------------------ Version ----------------
  version = '*',

  -- ------------------ Dependencies ----------------
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },

  -- ------------------ Keybindings ----------------
  keys = {
    { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Telescope Find Files' },
  },
}
