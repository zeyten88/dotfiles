return {
  "ahmedkhalf/project.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("project_nvim").setup({
      manual_mode = false,
      detection_methods = { "pattern" },
      patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
      show_hidden = false,
      silent_chdir = true,
      scope_chdir = 'tab',
    })
    
    -- Load projects extension after a small delay to ensure telescope is ready
    vim.defer_fn(function()
      require('telescope').load_extension('projects')
      -- Set up the keymap after extension is loaded
      vim.keymap.set("n", "<leader>fp", "<cmd>Telescope projects<cr>", { noremap = true, silent = true })
    end, 100)
  end,
} 