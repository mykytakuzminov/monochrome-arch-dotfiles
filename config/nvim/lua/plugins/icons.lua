-- ==================================================
-- Neovim Icons Configuration
-- File: icons.lua
-- Purpose: Setup nvim-web-devicons with monochrome style
-- ==================================================

return {
  "nvim-tree/nvim-web-devicons",

  -- ------------------ Configuration ----------------
  config = function()
    require("nvim-web-devicons").setup({
      color_icons = true,
      default = true,
    })

    vim.defer_fn(function()
      local my_color = "#505050"
      local icons = require("nvim-web-devicons").get_icons()

      for _, icon in pairs(icons) do
        local hl_group = "DevIcon" .. icon.name

        if vim.fn.hlexists(hl_group) > 0 then
          vim.api.nvim_set_hl(0, hl_group, { fg = my_color })
        end
      end

      vim.api.nvim_set_hl(0, "NvimTreeExecFile", { fg = "#FFFFFF" })
      vim.api.nvim_set_hl(0, "NvimTreeSpecialFile", { fg = "#FFFFFF" })
      vim.api.nvim_set_hl(0, "NvimTreeImageFile", { fg = "#FFFFFF" })
    end, 100)
  end,
}
