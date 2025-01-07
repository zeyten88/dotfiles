-- ZTNN Custom Theme with improved readability
local colors = {
  bg = "#1E2127",         -- Darker background
  bg_dark = "#16181D",    -- Even darker for contrast
  bg_light = "#2C3038",   -- Lighter background for highlights
  fg = "#E8F1F2",         -- Bright foreground
  fg_dark = "#A7B0B9",    -- Dimmed foreground
  yellow = "#E2C08D",     -- Softer yellow
  dark_yellow = "#B58900", -- Warning yellow
  dark_gray = "#5C6370",  -- Muted text
  light_yellow = "#F0C674", -- Brighter yellow for highlights
  red = "#E06C75",        -- Soft red
  green = "#98C379",      -- Soft green
  blue = "#61AFEF",       -- Bright blue
  purple = "#C678DD",     -- Soft purple
  cyan = "#56B6C2",       -- Bright cyan
  orange = "#D19A66",     -- Soft orange
}

-- Create a separate lualine theme
local lualine_theme = {
  normal = {
    a = { fg = "#FFFFFF", bg = "#4A9EFF", gui = "bold" },
    b = { fg = "#FFFFFF", bg = "#364A82" },
    c = { fg = colors.fg, bg = "#1F2335" }
  },
  insert = {
    a = { fg = "#000000", bg = "#98C379", gui = "bold" },
    b = { fg = "#FFFFFF", bg = "#364A82" },
    c = { fg = colors.fg, bg = "#1F2335" }
  },
  visual = {
    a = { fg = "#FFFFFF", bg = "#C678DD", gui = "bold" },
    b = { fg = "#FFFFFF", bg = "#364A82" },
    c = { fg = colors.fg, bg = "#1F2335" }
  },
  replace = {
    a = { fg = "#FFFFFF", bg = "#E06C75", gui = "bold" },
    b = { fg = "#FFFFFF", bg = "#364A82" },
    c = { fg = colors.fg, bg = "#1F2335" }
  },
  command = {
    a = { fg = "#000000", bg = "#E2C08D", gui = "bold" },
    b = { fg = "#FFFFFF", bg = "#364A82" },
    c = { fg = colors.fg, bg = "#1F2335" }
  },
  inactive = {
    a = { fg = "#FFFFFF", bg = "#282C34", gui = "bold" },
    b = { fg = "#FFFFFF", bg = "#282C34" },
    c = { fg = "#666666", bg = "#1F2335" }
  }
}

-- Editor highlights
local highlights = {
  -- UI elements
  Normal = { fg = colors.fg, bg = colors.bg },
  NormalFloat = { fg = colors.fg, bg = colors.bg_dark },
  StatusLine = { fg = colors.fg, bg = colors.bg_dark },
  StatusLineNC = { fg = colors.fg_dark, bg = colors.bg_dark },
  SignColumn = { fg = colors.fg, bg = colors.bg },
  MsgArea = { fg = colors.fg, bg = colors.bg },
  ModeMsg = { fg = colors.fg, bold = true },
  MsgSeparator = { fg = colors.fg, bg = colors.bg_dark },
  SpellBad = { fg = colors.red, undercurl = true },
  SpellCap = { fg = colors.yellow, undercurl = true },
  
  -- Line numbers and cursor
  LineNr = { fg = colors.dark_gray },
  CursorLineNr = { fg = colors.yellow, bold = true },
  CursorLine = { bg = colors.bg_light },
  
  -- Popup menus
  Pmenu = { fg = colors.fg, bg = colors.bg_dark },
  PmenuSel = { fg = colors.bg_dark, bg = colors.blue },
  PmenuSbar = { bg = colors.bg_light },
  PmenuThumb = { bg = colors.fg_dark },
  
  -- Search and selection
  Search = { fg = colors.bg_dark, bg = colors.yellow },
  IncSearch = { fg = colors.bg_dark, bg = colors.orange },
  Visual = { bg = colors.bg_light },
  
  -- Diagnostics
  DiagnosticError = { fg = colors.red },
  DiagnosticWarn = { fg = colors.yellow },
  DiagnosticInfo = { fg = colors.blue },
  DiagnosticHint = { fg = colors.cyan },
  
  -- Git signs
  GitSignsAdd = { fg = colors.green },
  GitSignsChange = { fg = colors.blue },
  GitSignsDelete = { fg = colors.red },
  
  -- Syntax highlighting
  Comment = { fg = colors.dark_gray, italic = true },
  Constant = { fg = colors.orange },
  String = { fg = colors.green },
  Identifier = { fg = colors.blue },
  Function = { fg = colors.blue, bold = true },
  Statement = { fg = colors.purple },
  Keyword = { fg = colors.purple },
  Type = { fg = colors.yellow },
  Special = { fg = colors.orange },
}

-- Apply highlights
for group, opts in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, opts)
end

-- Return both the theme and lualine theme
return {
  colors = colors,
  highlights = highlights,
  lualine = lualine_theme
}

