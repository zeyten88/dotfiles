return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })

    -- Custom terminal functions
    local Terminal = require('toggleterm.terminal').Terminal

    -- Lazygit terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      dir = "git_dir",
      direction = "float",
      float_opts = {
        border = "double",
      },
      on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
      end,
    })

    -- Function to toggle lazygit
    function _lazygit_toggle()
      lazygit:toggle()
    end

    -- Keymaps
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }
    
    map('n', '<leader>tt', ':ToggleTerm<CR>', opts)          -- Toggle terminal
    map('n', '<leader>tg', '<cmd>lua _lazygit_toggle()<CR>', opts)  -- Toggle lazygit
    
    -- Terminal navigation
    function _G.set_terminal_keymaps()
      local topts = {buffer = 0}
      map('t', '<esc>', [[<C-\><C-n>]], topts)
      map('t', 'jk', [[<C-\><C-n>]], topts)
      map('t', '<C-h>', [[<Cmd>wincmd h<CR>]], topts)
      map('t', '<C-j>', [[<Cmd>wincmd j<CR>]], topts)
      map('t', '<C-k>', [[<Cmd>wincmd k<CR>]], topts)
      map('t', '<C-l>', [[<Cmd>wincmd l<CR>]], topts)
    end

    -- Auto-set terminal keymaps
    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
  end,
} 