return {
  "nvim-lualine/lualine.nvim",
  config = function(_, _)
    local icons = require("lazyvim.config").icons
    require("lualine").setup({
      options = {
        theme = "auto",
        -- globalstatus = vim.o.laststatus == 3,
        -- globalstatus = false,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          "mode",
        },
        lualine_b = {
          "branch",
        },
        lualine_c = {
          -- "%=",
          {
            "filetype",
            icon_only = true, -- Display only an icon for filetype
          },
          {
            "filename",
            path = 1,
            file_status = true,
            -- symbols = { modified = "  ", readonly = " 🔏 ", unnamed = "" },
          },
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          {
            function()
              return "  " .. require("dap").status()
            end,
            cond = function()
              return package.loaded["dap"] and require("dap").status() ~= ""
            end,
            color = { fg = Snacks.util.color("Debug") },
          },
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = { fg = Snacks.util.color("Special") },
          },
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
          },
        },
        lualine_x = {
          {
            ---@diagnostic disable-next-line: undefined-field
            require("noice").api.status.command.get,
            cond = function()
              ---@diagnostic disable-next-line: undefined-field
              return package.loaded["noice"] and require("noice").api.status.command.has
            end,
            color = { fg = Snacks.util.color("Statement") },
          },
          {
            ---@diagnostic disable-next-line: undefined-field
            require("noice").api.status.mode.get,
            cond = function()
              ---@diagnostic disable-next-line: undefined-field
              return package.loaded["noice"] and require("noice").api.status.mode.has
            end,
            color = { fg = Snacks.util.color("Constant") },
          },
          { "navic", color_correction = "dynamic" },
          {
            "location",
          },
        },
        lualine_y = {
          {
            "progress",
            padding = { left = 1 },
          },
          {
            function()
              return "(%L lines)"
            end,
          },
        },
        lualine_z = {
          {
            "fileformat",
            symbols = {
              unix = "", -- e712
              dos = "", -- e70f
              mac = "", -- e711
            },
          },
        },
      },
      extensions = { "neo-tree", "lazy" },
    })
  end,
}
