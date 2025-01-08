return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local colors = require("themes.ztnn").colors
    require("bufferline").setup({
      options = {
        mode = "tabs",
        separator_style = "slant",
        always_show_bufferline = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        color_icons = true,
        position = "top",
        indicator = {
          icon = '▎', -- this should be omitted if indicator style is not 'icon'
          style = 'icon',
        },
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true,
          }
        },
        hover = {
          enabled = true,
          delay = 50,
          reveal = {'close'}
        },
      },
      highlights = {
        fill = {
          fg = colors.fg_dark,
          bg = colors.bg_dark,
        },
        background = {
          fg = colors.fg_dark,
          bg = colors.bg_dark
        },
        tab = {
          fg = colors.fg_dark,
          bg = colors.bg_dark
        },
        tab_selected = {
          fg = colors.fg,
          bg = colors.bg
        },
        tab_close = {
          fg = colors.red,
          bg = colors.bg_dark
        },
        close_button = {
          fg = colors.fg_dark,
          bg = colors.bg_dark
        },
        close_button_visible = {
          fg = colors.fg,
          bg = colors.bg_dark
        },
        close_button_selected = {
          fg = colors.red,
          bg = colors.bg
        },
        buffer_visible = {
          fg = colors.fg,
          bg = colors.bg_dark
        },
        buffer_selected = {
          fg = colors.fg,
          bg = colors.bg,
          bold = true,
          italic = true,
        },
        separator = {
          fg = colors.bg_dark,
          bg = colors.bg_dark,
        },
        separator_selected = {
          fg = colors.bg_dark,
          bg = colors.bg
        },
        separator_visible = {
          fg = colors.bg_dark,
          bg = colors.bg_dark,
        },
        indicator_selected = {
          fg = colors.blue,
          bg = colors.bg
        },
        modified = {
          fg = colors.yellow,
          bg = colors.bg_dark
        },
        modified_selected = {
          fg = colors.yellow,
          bg = colors.bg
        },
      }
    })
    
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }
    
    map("n", "<leader>ta", ":tabnew<CR>", opts)
    map("n", "<leader>tp", ":tabprevious<CR>", opts)
    map("n", "<leader>tn", ":tabnext<CR>", opts)
  end,
} 