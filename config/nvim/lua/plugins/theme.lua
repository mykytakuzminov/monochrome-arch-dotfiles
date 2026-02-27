return {
  {
    "wnkz/monoglow.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("monoglow").setup({
        on_colors = function(colors)
          colors.glow = "#fd1b7c"
        end
      })
      
      local function apply_overrides()
        vim.api.nvim_set_hl(0, "Boolean", { fg = "#fd1b7c" })
        vim.api.nvim_set_hl(0, "@boolean", { fg = "#fd1b7c" })
      end

      local function set_transparent()
        local groups = {
          "Normal", "NormalNC", "EndOfBuffer", "NormalFloat", 
          "FloatBorder", "SignColumn", "StatusLine", "StatusLineNC", 
          "TabLine", "TabLineFill", "TabLineSel", "ColorColumn",
        }
        for _, g in ipairs(groups) do
          vim.api.nvim_set_hl(0, g, { bg = "none" })
        end
        vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none", fg = "#767676" })
      end

      vim.cmd.colorscheme("monoglow")
      
      apply_overrides()
      set_transparent()

      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "monoglow",
        callback = function()
          apply_overrides()
          set_transparent()
        end,
      })
    end,
  },
}
