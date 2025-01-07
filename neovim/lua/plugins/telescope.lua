return {
  "nvim-telescope/telescope.nvim",
  requires = { "nvim-lua/plenary.nvim" },
  config = function()
    local actions = require("telescope.actions")
    require("telescope").setup({
      defaults = {
        mappings = {
          i = { ["<C-q>"] = actions.send_to_qflist + actions.open_qflist },
        },
      },
    })
    
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }
    map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
    map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
    map("n", "<leader>fr", ":Telescope oldfiles<CR>", opts)
    map("n", "<leader>fp", ":Telescope projects<CR>", opts)
  end,
} 