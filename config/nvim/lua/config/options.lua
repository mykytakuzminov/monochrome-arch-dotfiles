-- ==================================================
-- Neovim Options
-- File: options.lua
-- Purpose: Configure core Neovim options including
--          editor behavior, UI, indentation, search,
--          undo, clipboard, folds, splits, and performance
-- ==================================================

-- ------------------ Line Numbers & Cursor ----------------
vim.opt.number = true                   -- Show absolute line numbers
vim.opt.relativenumber = true           -- Show relative line numbers
vim.opt.cursorline = false              -- Do not highlight the current line
vim.opt.wrap = false                    -- Disable line wrapping
vim.opt.scrolloff = 10                  -- Minimum lines above/below cursor
vim.opt.sidescrolloff = 10              -- Minimum columns left/right of cursor
vim.opt.termguicolors = true            -- Enable true color support

-- ------------------ Tabs & Indentation ----------------
vim.opt.tabstop = 2                     -- Number of spaces per tab
vim.opt.shiftwidth = 2                  -- Indent width for << and >>
vim.opt.softtabstop = 2                 -- Spaces per Tab key
vim.opt.expandtab = true                -- Convert tabs to spaces
vim.opt.smartindent = true              -- Enable smart indent
vim.opt.autoindent = true               -- Copy indent from previous line

-- ------------------ Search ----------------
vim.opt.ignorecase = true               -- Case-insensitive search
vim.opt.smartcase = true                -- Override ignorecase if uppercase letters used
vim.opt.hlsearch = true                 -- Highlight search matches
vim.opt.incsearch = true                -- Show search as you type

-- ------------------ UI & Completion ----------------
vim.opt.signcolumn = "yes"              -- Always show sign column
vim.opt.cmdheight = 1                   -- Command line height
vim.opt.completeopt = "menuone,noinsert,noselect"  -- Completion behavior
vim.opt.showmode = false                -- Do not show mode (handled by statusline)
vim.opt.pumheight = 10                  -- Popup menu height
vim.opt.pumblend = 10                   -- Popup transparency
vim.opt.winblend = 0                    -- Floating windows transparency
vim.opt.conceallevel = 0                -- No conceal
vim.opt.concealcursor = ""              -- Do not conceal cursor
vim.opt.lazyredraw = true               -- Improve performance during macros
vim.opt.synmaxcol = 300                 -- Max columns for syntax highlighting
vim.opt.fillchars = { eob = " " }       -- Hide ~ on empty lines

-- ------------------ Undo & Backup ----------------
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p")
end

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = undodir
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 0
vim.opt.autoread = true
vim.opt.autowrite = false

-- ------------------ General ----------------
vim.opt.hidden = true                     -- Allow switching buffers without saving
vim.opt.errorbells = false                -- Disable bell sound
vim.opt.backspace = "indent,eol,start"
vim.opt.autochdir = false                 -- Do not change dir automatically
vim.opt.iskeyword:append("-")             -- Treat dash as part of a word
vim.opt.path:append("**")                 -- Recursive file search
vim.opt.selection = "inclusive"
vim.opt.mouse = "a"                       -- Enable mouse support
vim.opt.clipboard:append("unnamedplus")   -- Use system clipboard
vim.opt.modifiable = true
vim.opt.encoding = "utf-8"

-- ------------------ Folding ----------------
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99

-- ------------------ Splits ----------------
vim.opt.splitbelow = true                 -- Horizontal splits below
vim.opt.splitright = true                 -- Vertical splits to the right

-- ------------------ Wildmenu & Diff ----------------
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.diffopt:append("linematch:60")
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000
