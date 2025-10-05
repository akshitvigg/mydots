return {
  "voltycodes/areyoulockedin.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  config = function()
    require("areyoulockedin").setup({
      session_key = "4b962aca-0cb6-46ed-a640-f7533c7456d6",
    })
  end,
}
