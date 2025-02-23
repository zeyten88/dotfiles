-- Basic vim options
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- Performance improvements
vim.opt.hidden = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.lazyredraw = true           -- Don't redraw while executing macros
vim.opt.updatetime = 100            -- Faster completion
vim.opt.timeoutlen = 500            -- Faster timeout for mapped sequences
vim.opt.synmaxcol = 240            -- Only highlight first 240 columns
vim.opt.scrolloff = 8              -- Keep 8 lines above/below cursor
vim.opt.sidescrolloff = 8          -- Keep 8 columns left/right of cursor
vim.opt.number = true              -- Show line numbers
vim.opt.relativenumber = true      -- Show relative line numbers
vim.opt.cursorline = true         -- Highlight current line
vim.opt.termguicolors = true      -- Enable 24-bit RGB colors

-- Better UI
vim.opt.showmode = false          -- Don't show mode (lualine handles this)
vim.opt.signcolumn = "yes"        -- Always show signcolumn
vim.opt.fillchars = {
    vert = "│",
    fold = "⠀",
    eob = " ", -- suppress ~ at EndOfBuffer
    diff = "⣿", -- alternatives = ⣿ ░ ─ ╱
    msgsep = "‾",
    foldopen = "▾",
    foldsep = "│",
    foldclose = "▸",
}
