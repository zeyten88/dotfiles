-- Zeyten's Neovim Config.

-- Added Cd: to switch directories.
-- Implemented nvim-tree

if not pcall(require, "lazy") then
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)
end

require("lazy").setup({
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      require("nvim-tree").setup({
        view = { width = 30, side = "left" },
        sync_root_with_cwd = true,
        filters = { dotfiles = false },
      })

      vim.api.nvim_create_user_command('Tree', 'NvimTreeToggle', { nargs = 0 })

      vim.api.nvim_create_user_command('CdTree', function(opts)
        local path = opts.args
        path = vim.fn.expand(path)

        if vim.fn.isdirectory(path) == 1 then
          vim.cmd("cd " .. path)
          require("nvim-tree.api").tree.change_root(path)
          print("Changed directory to " .. path)
        else
          print("Invalid directory: " .. path)
        end
      end, { nargs = 1 })

      local function open_nvim_tree()
        if vim.api.nvim_buf_get_name(0) == "" and vim.fn.isdirectory(vim.fn.getcwd()) == 1 then
          require("nvim-tree.api").tree.open()
        end
      end
      vim.api.nvim_create_autocmd("VimEnter", { callback = open_nvim_tree })
    end,
  },
})

vim.cmd([[
  set wildmenu
  set wildmode=longest:full,full
  command! -nargs=1 -complete=dir Cd call ChangeDirWithCompletion(<q-args>)

  function! ChangeDirWithCompletion(path)
    let path = expand(a:path)

    if isdirectory(path)
      execute 'cd ' . path
      echo 'Changed directory to ' . path
    else
      echo 'Invalid directory: ' . path
    endif
  endfunction
]])
