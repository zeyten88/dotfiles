return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local ztnn = require('themes.ztnn')
    require("lualine").setup({
      options = {
        theme = ztnn.lualine,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
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
} 