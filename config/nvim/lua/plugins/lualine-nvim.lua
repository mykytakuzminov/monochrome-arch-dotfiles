return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local accent = "#fd1b7c"
    local white = "#ffffff"
    local gray = "#444444"
    local black = "#000000"

    local my_theme = {
      normal = {
        a = { bg = accent, fg = black, gui = 'bold' },
        b = { bg = gray, fg = white },
        c = { bg = black, fg = white },
      },
      insert = { a = { bg = white, fg = black, gui = 'bold' } },
      visual = { a = { bg = gray, fg = white, gui = 'bold' } },
      replace = { a = { bg = accent, fg = black, gui = 'bold' } },
      inactive = {
        a = { bg = black, fg = gray },
        b = { bg = black, fg = gray },
        c = { bg = black, fg = gray },
      },
    }

    require('lualine').setup({
      options = {
        theme = my_theme,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        globalstatus = true,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { 'filename' },
        lualine_x = { 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    })
  end,
}
