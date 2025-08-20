return {
  "lewis6991/gitsigns.nvim",

  opts = {
    current_line_blame = true,
  },

  keys = {
    {
      "<leader>gtb",
      ":Gitsigns toggle_current_line_blame<CR>",
      silent = true,
      desc = "Toggle current line blame",
    },
    {
      "<leader>gtw",
      ":Gitsigns toggle_word_diff<CR>",
      silent = true,
      desc = "Toggle word diff",
    },
  },
}
