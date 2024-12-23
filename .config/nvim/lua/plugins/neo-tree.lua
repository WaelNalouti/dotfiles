return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    {
      "<leader>er",
      -- ":Neotree toggle right<CR>",
      function()
        require("neo-tree.command").execute({
          toggle = true,
          position = "right",
          dir = require("lazyvim.util").root.get(),
        })
      end,
      silent = true,
      desc = "Toggle Right Explorer NeoTree (root dir)",
    },
    {
      "<leader>ef",
      -- ":Neotree toggle float<CR>",
      function()
        require("neo-tree.command").execute({
          toggle = true,
          position = "float",
          dir = require("lazyvim.util").root.get(),
        })
      end,
      silent = true,
      desc = "Toggle Float Explorer NeoTree (root dir)",
    },
    {
      "<leader>ee",
      -- ":Neotree toggle float<CR>",
      function()
        require("neo-tree.command").execute({
          toggle = true,
          position = "current",
          dir = require("lazyvim.util").root.get(),
        })
      end,
      silent = true,
      desc = "Toggle Current Explorer NeoTree (root dir)",
    },
    {
      "<leader>eb",
      -- ":Neotree toggle float<CR>",
      function()
        require("neo-tree.command").execute({
          toggle = true,
          position = "bottom",
          dir = require("lazyvim.util").root.get(),
        })
      end,
      silent = true,
      desc = "Toggle Bottom Explorer NeoTree (root dir)",
    },
    {
      "<leader>et",
      -- ":Neotree toggle float<CR>",
      function()
        require("neo-tree.command").execute({
          toggle = true,
          position = "top",
          dir = require("lazyvim.util").root.get(),
        })
      end,
      silent = true,
      desc = "Toggle Top Explorer NeoTree (root dir)",
    },
  },
  opts = {
    window = {
      position = "current",
    },
    filesystem = {
      filtered_items = {
        always_show_by_pattern = {
          ".env*",
          ".config",
          ".zshrc",
        },
      },
    },
  },
}
