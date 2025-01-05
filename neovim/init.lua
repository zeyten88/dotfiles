-- Zeyten's Neovim Config -- ZenVim

-- Added cd: to switch directories. Included with directory autocompletion.
-- Implemented nvim-tree, made to work with previously mentioned cd:
-- Implemented nvim-cmp as an autocompletion server, along with snippet servers for JavaScript, TypeScript, PHP, HTML, CSS, C, C++, Python, Rust, GO
-- Implemented nvim-autopairs for autobrackets, integrated with nvim-cmp.
-- Added custom ZTNN Color Theme.
-- Implemented lualine, configured with ZTNN color theme.
-- Added Telescope for file searching and navigation.
-- Implementd a customized Startup menu with startup.nvim


-- Ensure lazy.nvim is installed
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

-- Set the colorscheme globally for Neovim
vim.cmd('colorscheme ztnn')

require("lazy").setup({
  -- startup.nvim setup
  {
    "max397574/startup.nvim",
    config = function()
      require("startup").setup({
        theme = ("ztnnstartup"),
        default_mappings = false,
      })
    end,
  },

  -- nvim-tree setup
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("nvim-tree").setup({
        view = { width = 30, side = "left" },
        sync_root_with_cwd = true,
        filters = { dotfiles = false },
        actions = { open_file = { quit_on_open = false } },
      })
      vim.api.nvim_set_keymap('n', '<C-p>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
      vim.api.nvim_create_user_command('Tree', ':NvimTreeToggle<CR>', {})

      if vim.fn.argc() > 0 then
        require("nvim-tree.api").tree.open()
      end
    end,
  },

  -- Telescope setup
  {
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
      
      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }
      map("n", "<C-f>", ":Telescope find_files<CR>", opts)  -- CTRL+F to find files
      map("n", "<C-b>", ":Telescope live_grep<CR>", opts)   -- CTRL+B to live grep
      map("n", "<C-r>", ":Telescope oldfiles<CR>", opts)    -- CTRL+R to old files
    end,
  },

  -- LSP setup
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local servers = { "ts_ls", "html", "cssls", "phpactor", "pyright", "gopls", "rust_analyzer", "clangd" }
      for _, server in ipairs(servers) do
        lspconfig[server].setup({})
      end
    end,
  },

  -- nvim-cmp for autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = { { name = "nvim_lsp" }, { name = "luasnip" }, { name = "buffer" }, { name = "path" } },
      })
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  -- nvim-autopairs for autobrackets
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({ check_ts = true })
    end,
  },

  -- lualine configuration
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff" },
          lualine_c = { "filename" },
          lualine_x = { "diagnostics", "filetype" },
          lualine_y = { "location" },
          lualine_z = { "progress" },
        },
      })
    end,
  },
})

