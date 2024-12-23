return {
  "telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    keys = {
      {
        "<leader>sx",
        require("telescope.builtin").resume,
        desc = "Resume Telescope",
        mode = { "n" },
      },
    },
    config = function()
      require("telescope").load_extension("fzf")
      require("telescope").setup({
        defaults = {
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
  },
}
