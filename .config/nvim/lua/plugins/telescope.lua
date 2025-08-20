return {
  "telescope.nvim",
  config = function()
    require("telescope").load_extension("fzf")
    require("telescope").setup({
      defaults = {
        hidden = true,
        file_ignore_patterns = {
          "node_modules",
          ".git/",
          -- Add any other patterns you want to ignore
        },
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            width = 0.95,
            height = 0.95,
          },
          vertical = {
            width = 0.95,
            height = 0.95,
            preview_height = 0.6,
          },
        },
      },
    })
  end,
  keys = {
    {
      "<leader>sx",
      require("telescope.builtin").resume,
      desc = "Resume Telescope",
      mode = { "n" },
    },
    {
      "<leader>fh",
      function()
        require("telescope.builtin").find_files({ hidden = true })
      end,
      desc = "Find files (including hidden)",
      mode = { "n" },
    },
  },
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
}
