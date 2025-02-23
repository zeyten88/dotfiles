return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local colors = require("themes.ztnn").colors
    require("bufferline").setup({
      options = {
        mode = "tabs",
        separator_style = "thin",
        always_show_bufferline = true,
        show_buffer_close_icons = true,
        show_close_icon = false,
        color_icons = true,
        position = "top",
        indicator = {
          style = 'none',
        },
        buffer_close_icon = '󰅙',
        modified_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 18,
        max_prefix_length = 15,
        truncate_names = true,
        tab_size = 18,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        offsets = {
          {
            filetype = "minifiles",
            text = "File Explorer",
            highlight = "Directory",
            separator = true,
          },
        },
        hover = {
          enabled = true,
          delay = 0,
          reveal = {'close'}
        },
        style_preset = {
          require("bufferline").style_preset.minimal,
        },
        themable = true,
        numbers = "none",
      },
      highlights = {
        fill = {
          fg = colors.fg_dark,
          bg = colors.bg,
        },
        background = {
          fg = colors.dark_gray,
          bg = colors.bg,
        },
        tab = {
          fg = colors.dark_gray,
          bg = colors.bg,
        },
        tab_selected = {
          fg = colors.blue,
          bg = colors.bg_dark,
          bold = true,
        },
        tab_close = {
          fg = colors.dark_gray,
          bg = colors.bg,
        },
        close_button = {
          fg = colors.dark_gray,
          bg = colors.bg,
        },
        close_button_visible = {
          fg = colors.fg_dark,
          bg = colors.bg,
        },
        close_button_selected = {
          fg = colors.red,
          bg = colors.bg_dark,
        },
        buffer_visible = {
          fg = colors.fg_dark,
          bg = colors.bg,
        },
        buffer_selected = {
          fg = colors.blue,
          bg = colors.bg_dark,
          bold = true,
          italic = false,
        },
        numbers = {
          fg = colors.dark_gray,
          bg = colors.bg,
        },
        numbers_selected = {
          fg = colors.blue,
          bg = colors.bg_dark,
          bold = true,
        },
        diagnostic = {
          fg = colors.dark_gray,
          bg = colors.bg,
        },
        diagnostic_selected = {
          fg = colors.blue,
          bg = colors.bg_dark,
          bold = true,
        },
        hint = {
          fg = colors.cyan,
          bg = colors.bg,
        },
        hint_selected = {
          fg = colors.cyan,
          bg = colors.bg_dark,
          bold = true,
        },
        warning = {
          fg = colors.yellow,
          bg = colors.bg,
        },
        warning_selected = {
          fg = colors.yellow,
          bg = colors.bg_dark,
          bold = true,
        },
        error = {
          fg = colors.red,
          bg = colors.bg,
        },
        error_selected = {
          fg = colors.red,
          bg = colors.bg_dark,
          bold = true,
        },
        modified = {
          fg = colors.yellow,
          bg = colors.bg,
        },
        modified_selected = {
          fg = colors.yellow,
          bg = colors.bg_dark,
        },
        duplicate = {
          fg = colors.dark_gray,
          bg = colors.bg,
          italic = true,
        },
        duplicate_selected = {
          fg = colors.fg,
          bg = colors.bg_dark,
          italic = true,
        },
        separator = {
          fg = colors.bg,
          bg = colors.bg,
        },
        separator_selected = {
          fg = colors.bg,
          bg = colors.bg_dark,
        },
        indicator_selected = {
          fg = colors.blue,
          bg = colors.bg_dark,
        },
      }
    })
    
    local map = vim.keymap.set
    
    map("n", "<leader>ta", ":tabnew<CR>", { noremap = true, silent = true, desc = "New tab" })
    map("n", "<leader>tp", ":tabprevious<CR>", { noremap = true, silent = true, desc = "Previous tab" })
    map("n", "<leader>tn", ":tabnext<CR>", { noremap = true, silent = true, desc = "Next tab" })
  end,
} 