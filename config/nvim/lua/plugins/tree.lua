-- ==================================================
-- Neovim Nvim-Tree Plugin Configuration
-- File: nvim-tree.lua
-- Purpose: Configure nvim-tree.nvim, keybindings, view options,
--          and apply monochrome colors to icons and folders
-- ==================================================

return {
  "nvim-tree/nvim-tree.lua",

  -- ------------------ Keybindings ----------------
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
  },

  -- ------------------ Plugin Configuration ----------------
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 35,
      },
      git = {
        enable = false,
      },
      renderer = {
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = false,
          },
        },
      },
      on_attach = function(bufnr)
        local api = require('nvim-tree.api')
        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set('n', 'h', '', opts('Disabled'))
        vim.keymap.set('n', 'l', '', opts('Disabled'))
        vim.keymap.set('n', '<Left>', '', opts('Disabled'))
        vim.keymap.set('n', '<Right>', '', opts('Disabled'))
      end,
    })
    
    -- ------------------ Monochrome Theme ----------------
    local function set_monochrome()
      local folder_color = "#D0D0D0"
      local file_color   = "#808080"
      local icon_color   = "#505050"

      vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = icon_color })
      vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = folder_color })
      vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = folder_color })
      vim.api.nvim_set_hl(0, "NvimTreeFileIcon", { fg = icon_color })
      vim.api.nvim_set_hl(0, "NvimTreeFileName", { fg = file_color })

      local icons = require("nvim-web-devicons").get_icons()
      for _, icon in pairs(icons) do
        vim.api.nvim_set_hl(0, "DevIcon" .. icon.name, { fg = icon_color })
      end
    end
    
    -- Apply monochrome theme on colorscheme change
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = set_monochrome,
    })
    
    -- Initial monochrome setup
    set_monochrome()
  end,
}
