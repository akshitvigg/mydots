-- lua/colorscheme.lua
return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false, -- load immediately
    priority = 1000, -- make sure it's loaded first
    config = function()
      require("gruvbox").setup({
        contrast = "soft",
        transparent_mode = true,
        overrides = {
          Normal = { bg = "none" },
          NormalNC = { bg = "none" },
          FloatBorder = { bg = "none" },
          VertSplit = { bg = "none" },
        },
      })
      -- Apply colorscheme here
      vim.cmd([[colorscheme gruvbox]])
    end,
  },
}
