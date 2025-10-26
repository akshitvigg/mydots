-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local tokyotheme = require("tokyonight")
      tokyotheme.setup({
        style = "storm",
        transparent = true,
        on_colors = function(colors)
          colors.fg_gutter = "#656875"
          colors.comment = "#6893ac"
        end,
        on_highlights = function(highlights, colors)
          highlights["@comment"] = { fg = "#6893ac", italic = true }
          highlights.CursorLineNr = { fg = "#86bddd" }
        end,
      })
      vim.cmd("colorscheme tokyonight")
    end,
  },
}
