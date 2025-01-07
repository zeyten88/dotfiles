return {
  "max397574/startup.nvim",
  config = function()
    local our_theme = require("themes.ztnnstartup")
    local startup_themes_path = vim.fn.stdpath("data") .. "/lazy/startup.nvim/lua/startup/themes"
    
    vim.fn.mkdir(startup_themes_path, "p")
    
    local theme_path = startup_themes_path .. "/ztnnstartup.lua"
    local theme_file = io.open(theme_path, "w")
    if theme_file then
      theme_file:write("return " .. vim.inspect(our_theme))
      theme_file:close()
    end

    require("startup").setup({
      theme = "ztnnstartup",
      default_mappings = false,
    })
  end,
} 