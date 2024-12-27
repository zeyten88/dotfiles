-- lazy.nvim, Zeyten.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    config = function()
      -- Disable netrw as recommended by Nvim-Tree
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- Setup Nvim-Tree
      require("nvim-tree").setup({
        view = { width = 30, side = "left" },
        renderer = {
          highlight_git = true,
          icons = {
            show = {
              git = true,
              folder = true,
              file = true,
            },
          },
        },
        filters = { dotfiles = false },
      })

      -- Open Nvim-Tree on startup
      local function open_nvim_tree()
        -- Prevent opening Nvim-Tree if editing a file or a directory is already open
        local bufname = vim.api.nvim_buf_get_name(0)
        if bufname == "" and vim.fn.isdirectory(vim.fn.getcwd()) == 1 then
          require("nvim-tree.api").tree.open()
        end
      end

      vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

      -- Create a custom :Tree command
      vim.api.nvim_create_user_command(
        'Tree',                            -- Command name
        'NvimTreeToggle',                  -- The action (toggle Nvim-Tree)
        { nargs = 0 }                      -- No arguments needed
      )
    end,
  },
})
-- lazy.nvim setup (if not already done)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    config = function()
      -- Disable netrw as recommended by Nvim-Tree
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- Setup Nvim-Tree
      require("nvim-tree").setup({
        view = { width = 30, side = "left" },
        renderer = {
          highlight_git = true,
          icons = {
            show = {
              git = true,
              folder = true,
              file = true,
            },
          },
        },
        filters = { dotfiles = false },
      })

      -- Open Nvim-Tree on startup
      local function open_nvim_tree()
        -- Prevent opening Nvim-Tree if editing a file or a directory is already open
        local bufname = vim.api.nvim_buf_get_name(0)
        if bufname == "" and vim.fn.isdirectory(vim.fn.getcwd()) == 1 then
          require("nvim-tree.api").tree.open()
        end
      end

      vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

      -- Create a custom :Tree command
      vim.api.nvim_create_user_command(
        'Tree',                            -- Command name
        'NvimTreeToggle',                  -- The action (toggle Nvim-Tree)
        { nargs = 0 }                      -- No arguments needed
      )
    end,
  },
})

