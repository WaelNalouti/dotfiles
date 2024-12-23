return {
  "sphamba/smear-cursor.nvim",
  event = "VeryLazy",
  enabled = false,
  cond = vim.g.neovide == nil,
  opts = {
    hide_target_hack = true,
    -- cursor_color = "none",
    cursor_color = "#ff8800",
    stiffness = 0.9,
    trailing_stiffness = 0.8,
    trailing_exponent = 0.1,
    gamma = 1,
    volume_reduction_exponent = -0.1,
  },
  specs = {
    -- disable mini.animate cursor
    {
      "echasnovski/mini.animate",
      optional = true,
      opts = {
        cursor = { enable = false },
      },
    },
  },
}
