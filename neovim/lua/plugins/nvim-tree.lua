return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- Set icons for git status
    local git_icons = {
      unstaged = "✗",
      staged = "✓",
      unmerged = "",
      renamed = "➜",
      untracked = "★",
      deleted = "",
      ignored = "◌",
    }

    -- Custom folder icons
    local folder_icons = {
      default = "󰉋",
      open = "󰝰",
      empty = "󰉖",
      empty_open = "󰷏",
      symlink = "󰉒",
      symlink_open = "󰉒",
    }

    require("nvim-tree").setup({
      -- Better UI
      view = {
        width = 35,
        side = "left",
        preserve_window_proportions = true,
        signcolumn = "yes",
      },
      renderer = {
        add_trailing = true,
        group_empty = true,
        highlight_git = true,
        full_name = false,
        highlight_opened_files = "all",
        root_folder_label = ":~:s?$?/..?",
        indent_width = 2,
        indent_markers = {
          enable = true,
          inline_arrows = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          },
        },
        icons = {
          webdev_colors = true,
          git_placement = "before",
          modified_placement = "after",
          padding = " ",
          symlink_arrow = " ➛ ",
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
          glyphs = {
            default = "",
            symlink = "",
            bookmark = "󰆤",
            modified = "●",
            folder = folder_icons,
            git = git_icons,
          },
        },
        special_files = { 
          "Cargo.toml", 
          "Makefile", 
          "README.md", 
          "readme.md",
          "CMakeLists.txt",
          "package.json",
          "init.lua",
        },
        symlink_destination = true,
      },
      -- Controlled directory behavior
      actions = {
        use_system_clipboard = true,
        change_dir = {
          enable = true,
          global = false,           -- Only change window directory
          restrict_above_cwd = true, -- Restrict to current working directory
        },
        open_file = {
          quit_on_open = false,
          resize_window = true,
          window_picker = {
            enable = true,
            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
            exclude = {
              filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
              buftype = { "nofile", "terminal", "help" },
            },
          },
        },
        -- Add custom mappings for directory navigation
        expand_all = {
          max_folder_discovery = 300,
          exclude = {},
        },
      },
      -- Better filtering
      filters = {
        dotfiles = false,
        git_clean = false,
        no_buffer = false,
        custom = { "node_modules", "\\.cache", "\\.git" },
        exclude = {},
      },
      -- Synchronize with current directory
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = false,  -- Don't automatically change root
        ignore_list = {},
      },
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        
        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- Default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- Custom mapping to change directory when pressing 'o' on a folder
        vim.keymap.set('n', 'o', function()
          local node = api.tree.get_node_under_cursor()
          if node.type == 'directory' then
            -- Change directory and refresh tree
            vim.cmd('cd ' .. node.absolute_path)
            api.tree.change_root(node.absolute_path)
            api.tree.expand_all()
          else
            -- Normal open behavior for files
            api.node.open.edit()
          end
        end, opts('CD or Open'))
      end,
    })

    -- Auto close
    vim.api.nvim_create_autocmd("BufEnter", {
      nested = true,
      callback = function()
        if #vim.api.nvim_list_wins() == 1 and
           vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
          vim.cmd "quit"
        end
      end
    })

    -- Keymaps
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }
    
    map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
    map('n', '<leader>E', ':NvimTreeFindFile<CR>', opts)  -- Show current file in tree
    
    vim.api.nvim_create_user_command('Tree', ':NvimTreeToggle<CR>', {})
  end,
} 