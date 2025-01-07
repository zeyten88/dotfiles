return {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup({
      manual_mode = false,
      detection_methods = { "pattern" },
      patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
      show_hidden = false,
      silent_chdir = true,
      scope_chdir = 'tab',
    })
    
    require('telescope').load_extension('projects')
    vim.keymap.set("n", "<leader>fp", ":Telescope projects<CR>", { noremap = true, silent = true })
  end,
} 