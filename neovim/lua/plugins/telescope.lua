return {
  "nvim-telescope/telescope.nvim",
  dependencies = { 
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "truncate" },
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
        },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<ESC>"] = actions.close,
          },
        },
      },
      pickers = {
        find_files = {
          theme = "dropdown",
        },
      },
    })
    
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }
    
    -- Basic file operations
    map("n", "<leader>ff", builtin.find_files, opts)
    map("n", "<leader>fg", builtin.live_grep, opts)
    map("n", "<leader>fr", builtin.oldfiles, opts)
  end,
} 