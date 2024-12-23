return {
  "folke/zen-mode.nvim",
  keys = {
    {
      "<leader>uz",
      function()
        require("zen-mode").toggle()
      end,
      desc = "Toggle zen-mode",
    },
  },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
  },
}
