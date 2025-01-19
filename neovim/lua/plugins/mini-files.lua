return {
  'echasnovski/mini.files',
  version = '*',
  config = function()
    local minifiles = require('mini.files')
    minifiles.setup({
      windows = {
        preview = true,
        width_focus = 30,
        width_preview = 30,
      },
      options = {
        use_as_default_explorer = true,
      },
      mappings = {
        go_in = '<CR>',
        go_in_plus = '<Right>',
        go_out = '<Left>',
        go_out_plus = '',
        reset = '<BS>',
        show_help = 'g?',
        synchronize = '',
        trim_left = '',
        trim_right = '',
      },
    })

    -- Add custom mappings for up/down navigation
    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesWindowOpen',
      callback = function(args)
        local win_id = args.data.win_id
        -- Map up/down arrows in the mini.files window
        vim.keymap.set('n', '<Up>', 'k', { buffer = true })
        vim.keymap.set('n', '<Down>', 'j', { buffer = true })
      end,
    })

    -- Key mappings
    vim.keymap.set("n", "<leader>e", function()
      if not minifiles.close() then -- If there was no opened window, open files at current working directory
        minifiles.open(vim.loop.cwd())
      end
    end, { desc = "Toggle mini.files explorer" })

    vim.keymap.set("n", "<leader>E", function()
      minifiles.open(vim.fn.expand('%:p:h'))
    end, { desc = "Open mini.files at current file" })
  end,
} 