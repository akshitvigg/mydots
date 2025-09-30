-- lua/colorscheme.lua
return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false, -- load immediately
    priority = 1000, -- make sure it's loaded first
    config = function()
      require("gruvbox").setup({
        contrast = "hard",
        overrides = {
          Normal = { bg = "#000000" },
          NormalNC = { bg = "#000000" },
          FloatBorder = { bg = "#000000" },
          VertSplit = { bg = "#000000" },
        },
      })
      -- Apply colorscheme here
      vim.cmd([[colorscheme gruvbox]])
    end,
  },
}
