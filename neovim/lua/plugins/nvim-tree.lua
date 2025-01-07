return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require("nvim-tree").setup({
      view = { 
        width = 30, 
        side = "left",
        preserve_window_proportions = true,
      },
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      filters = { dotfiles = false },
      actions = { 
        open_file = { 
          quit_on_open = false,
          window_picker = { enable = false },
        },
      },
    })

    vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
    vim.api.nvim_create_user_command('Tree', ':NvimTreeToggle<CR>', {})

    if vim.fn.argc() > 0 then
      require("nvim-tree.api").tree.open()
    end
  end,
} 