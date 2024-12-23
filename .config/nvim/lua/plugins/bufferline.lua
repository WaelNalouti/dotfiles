return {
  "akinsho/bufferline.nvim",
  enabled = true,
  -- opts = {
  --   separator_style = "slope",
  -- },
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup({
      options = {
        -- separator_style = "slope",
        indicator = {
          -- icon = "▎", -- this should be omitted if indicator style is not 'icon'
          style = "none", -- "icon" | "underline" | "none",
        },
      },
    })
  end,
}
