-- ZTNN Custom Theme
local colors = {
  bg = "#2B2D31",        -- Darker gray background
  fg = "#E8F1F2",        -- Alice Blue foreground
  yellow = "#E6C200",    -- Main yellow
  dark_yellow = "#8B8000", -- Warning yellow
  dark_gray = "#495159", -- Comments and muted text
  light_yellow = "#D4A200", -- Subtle highlights
  red = "#FF5555",       -- Adjusted red for errors
  green = "#A6E22E",     -- Subtle green for success
  blue = "#61AFEF",      -- Blue for function names
  magenta = "#C678DD",   -- Magenta for constants
  cyan = "#56B6C2",      -- Cyan for hints/info
}

local highlights = {
  -- Editor UI
  Normal = { fg = colors.fg, bg = colors.bg },
  CursorLine = { bg = "#31343B" },
  LineNr = { fg = colors.dark_gray },
  CursorLineNr = { fg = colors.yellow, bold = true },
  StatusLine = { fg = colors.fg, bg = "#1F2125" },
  VertSplit = { fg = colors.dark_gray },
  Pmenu = { fg = colors.fg, bg = "#3A3F4B" },
  PmenuSel = { fg = colors.bg, bg = colors.yellow, bold = true },
  Visual = { bg = "#44475A" },

  -- Code
  Comment = { fg = colors.dark_gray, italic = true },
  Keyword = { fg = colors.yellow, bold = true },
  Function = { fg = colors.blue },
  String = { fg = colors.green },
  Constant = { fg = colors.magenta },
  Variable = { fg = colors.fg },
  Type = { fg = colors.light_yellow },
  Error = { fg = colors.red, bold = true },
  WarningMsg = { fg = colors.dark_yellow },
  Hint = { fg = colors.cyan },
  Info = { fg = colors.blue },

  -- Diagnostics
  DiagnosticError = { fg = colors.red },
  DiagnosticWarn = { fg = colors.dark_yellow },
  DiagnosticInfo = { fg = colors.blue },
  DiagnosticHint = { fg = colors.cyan },

  -- Treesitter
  TSKeyword = { fg = colors.yellow, bold = true },
  TSFunction = { fg = colors.blue },
  TSString = { fg = colors.green },
  TSVariable = { fg = colors.fg },
  TSConstant = { fg = colors.magenta },
}

-- Apply the highlights
for group, opts in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, opts)
end

-- Return the theme so it can be used in lualine
return {
  normal = {
    a = { fg = colors.bg, bg = colors.yellow, gui = "bold" },
    b = { fg = colors.fg, bg = colors.dark_gray },
    c = { fg = colors.fg, bg = colors.bg },
  },
  insert = {
    a = { fg = colors.bg, bg = colors.green, gui = "bold" },
  },
  visual = {
    a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
  },
  replace = {
    a = { fg = colors.bg, bg = colors.red, gui = "bold" },
  },
  command = {
    a = { fg = colors.bg, bg = colors.yellow, gui = "bold" },
  },
  inactive = {
    a = { fg = colors.dark_gray, bg = colors.bg, gui = "bold" },
    b = { fg = colors.dark_gray, bg = colors.bg },
    c = { fg = colors.dark_gray, bg = colors.bg },
  },
}

