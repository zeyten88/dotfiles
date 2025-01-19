-- Zeyten's Neovim Config -- ZenVim

-- Added cd: to switch directories. Included with directory autocompletion.
-- Implemented mini.files for minimal file explorer
-- Implemented mason and LSP for better language support
-- Implemented nvim-cmp as an autocompletion server, along with snippet servers for JavaScript, TypeScript, PHP, HTML, CSS, C, C++, Python, Rust, GO
-- Implemented nvim-autopairs for autobrackets, integrated with nvim-cmp.
-- Added custom ZTNN Color Theme.
-- Implemented lualine, configured with ZTNN color theme.
-- Added Telescope for file searching and navigation.
-- Implemented a customized Startup menu with startup.nvim
-- Implemented whick-key for easily telling apart keybinds.
-- Implemented bufferline for easy tab managment.
-- Implemented nvim-treesitter for syntax highlighting.
-- Implemented gitsigns for git integration.

-- Load core options
require("core.options")

-- Setup lazy.nvim plugin manager
require("lazy").setup({
  -- Load all plugin configurations
  require("plugins.startup"),
  require("plugins.mini-files"),
  require("plugins.telescope"),
  require("plugins.lsp"),
  require("plugins.cmp"),
  require("plugins.autopairs"),
  require("plugins.lualine"),
  require("plugins.treesitter"),
  require("plugins.gitsigns"),
  require("plugins.which-key"),
  require("plugins.bufferline"),
  require("plugins.terminal"),
})

