return {
  "akinsho/bufferline.nvim",
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup({
      options = {
        separator_style = "thick",
        indicator = {
          icon = "▎", -- this should be omitted if indicator style is not 'icon'
          style = "icon", -- "icon" | "underline" | "none",
        },
      },
    })
  end,
}
