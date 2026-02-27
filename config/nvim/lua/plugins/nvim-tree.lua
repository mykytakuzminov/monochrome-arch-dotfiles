return {
  "nvim-tree/nvim-tree.lua",
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
  },
  config = function()
    vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = "#fd1b7c" })
    vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#ffffff" })

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
            folder_arrow = true,
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
  end,
}
