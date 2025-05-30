local settings = {
  header = {
    type = "text",
    oldfiles_directory = false,
    align = "center",
    fold_section = false,
    title = "Header",
    margin = 5,
    content = {
      "                                          ▄▄                     ",
      " ███▀▀▀███                  ▀████▀   ▀███▀ ██                    ",
      " █▀   ███                     ▀██     ▄█                         ",
      " ▀   ███   ▄▄█▀██▀████████▄    ██▄   ▄█  ▀███ ▀████████▄█████▄   ",
      "    ███   ▄█▀   ██ ██    ██     ██▄  █▀    ██   ██    ██    ██   ",
      "   ███   ▄██▀▀▀▀▀▀ ██    ██     ▀██ █▀     ██   ██    ██    ██   ",
      "  ███   ▄███▄    ▄ ██    ██      ▄██▄      ██   ██    ██    ██   ",
      " █████████ ▀█████▀████  ████▄     ██     ▄████▄████  ████  ████▄ ",
      "",
    },
    highlight = "String",
    oldfiles_amount = 0,
  },
  body = {
    type = "mapping",
    oldfiles_directory = false,
    align = "center",
    fold_section = false,
    title = "Quick Actions",
    margin = 5,
    content = {
      { "󰱽 Find File", "Telescope find_files", "<leader>ff" },
      { "󰍉 Find Word", "Telescope live_grep", "<leader>fg" },
      { "󰋚 Recent", "Telescope oldfiles", "<leader>fr" },
      { "󰒓 Config", "Telescope find_files cwd=" .. vim.fn.stdpath("config"), "<leader>fc" },
      { "󰙅 File Tree", "lua require('mini.files').open()", "<leader>e" },
    },
    highlight = "String",
    default_color = "",
    oldfiles_amount = 0,
  },

  footer = {
    type = "text",
    oldfiles_directory = false,
    align = "center",
    fold_section = false,
    title = "Commands Reference",
    margin = 5,
    content = {
      "╭──────────────────────────╮ ╭──────────────────────────╮ ╭──────────────────────────╮",
      "│        Navigation        │ │         Editing          │ │      File Actions        │",
      "├──────────────────────────┤ ├──────────────────────────┤ ├──────────────────────────┤",
      "│  h/j/k/l   Movement      │ │  i/a     Insert mode     │ │  <leader>ff  Find File   │",
      "│  w/b       Word jump     │ │  o/O     New line        │ │  <leader>fg  Find Text   │",
      "│  gg/G      Start/End     │ │  dd/yy   Delete/Yank     │ │  <leader>fr  Recent      │",
      "│  0/$       Line ends     │ │  p/P     Paste aft/bef   │ │  <leader>fp  Projects    │",
      "│  CTRL-o/i  Jump back/fw  │ │  u/CTRL-r Undo/Redo      │ │  <leader>e   Files       │",
      "╰──────────────────────────╯ ╰──────────────────────────╯ ╰──────────────────────────╯",
      "",
      "╭──────────────────────────╮ ╭──────────────────────────╮ ╭──────────────────────────╮",
      "│         Windows          │ │           LSP            │ │         Other            │",
      "├──────────────────────────┤ ├──────────────────────────┤ ├──────────────────────────┤",
      "│  <leader>ta  New tab     │ │  gd         Go to def    │ │  :w/:q    Save/Quit      │",
      "│  <leader>tp  Prev tab    │ │  K          Show info    │ │  :wq/:q!   Save&Quit/F   │",
      "│  <leader>tn  Next tab    │ │  <leader>rn  Rename      │ │  :e        Edit file     │",
      "│  CTRL-w v/s  Split v/h   │ │  <leader>ca  Actions     │ │  :cd       Change dir    │",
      "│  CTRL-w hjkl Navigate    │ │  [d/]d      Diag n/p     │ │  :Tree     Toggle tree   │",
      "│  <leader>tt  Terminal    │ │                          │ │                          │",
      "╰──────────────────────────╯ ╰──────────────────────────╯ ╰──────────────────────────╯",
    },
    highlight = "Number",
    default_color = "",
    oldfiles_amount = 0,
  },

  options = {
    mapping_keys = true,
    cursor_column = 0.5,
    empty_lines_between_mappings = true,
    disable_statuslines = true,
    paddings = { 1, 3, 3, 0 },
  },

  mappings = {
    execute_command = "<CR>",
    open_file = "o",
    open_file_split = "<c-o>",
    open_section = "<TAB>",
    open_help = "?",
  },

  colors = {
    background = "#1f2227",
    folded_section = "#56b6c2",
  },

  parts = { "header", "body", "footer" },
}

return settings
