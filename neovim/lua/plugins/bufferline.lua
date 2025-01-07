return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
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
          style = 'underline'          
        },
        hover = {
          enabled = true,
          delay = 50,
          reveal = {'close'}
        },
      },
      highlights = {
        separator = {
          fg = '#073642',
          bg = '#002b36',
        },
        separator_selected = {
          fg = '#073642',
        },
        background = {
          fg = '#657b83',
          bg = '#002b36'
        },
        buffer_selected = {
          fg = '#fdf6e3',
          bold = true,
        },
        fill = {
          bg = '#073642'
        }
      },
    })
    
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }
    
    map("n", "<leader>ta", ":tabnew<CR>", opts)      -- Add tab
    map("n", "<leader>tp", ":tabprevious<CR>", opts) -- Previous tab
    map("n", "<leader>tn", ":tabnext<CR>", opts)     -- Next tab
  end,
} 