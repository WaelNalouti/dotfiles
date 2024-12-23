-- Use your favorite package manager to install, for example in lazy.nvim
--  Optionally, you can also install nvim-telescope/telescope.nvim to use some search functionality.
return {
  {
    "sourcegraph/sg.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", --[[ "nvim-telescope/telescope.nvim ]]
    },

    config = {
      enable_cody = true,
    },

    keys = {
      {
        "<leader>ct",
        function()
          require("sg.cody.commands").toggle()
        end,
        desc = "Toggle Cody chat",
      },
      {
        "<leader>cC",
        function()
          -- FIXME: no output for some reason?

          -- Request parameters
          local request = {
            filename = vim.api.nvim_buf_get_name(0),
            row = vim.api.nvim_win_get_cursor(0)[1] - 1,
            col = vim.api.nvim_win_get_cursor(0)[2],
          }

          -- Callback to handle autocomplete result
          local handle_result = function(err, result)
            if err then
              print("Error: " .. vim.inspect(err))
              return
            end

            local row = request.row
            local col = request.col

            -- Insert completion items
            local lines = {}
            for _, item in ipairs(result.items) do
              for k, v in pairs(item) do
                print("hey", k, v)
              end
              table.insert(lines, item.insertText)
            end

            vim.api.nvim_buf_set_lines(0, row, row, false, lines)

            -- Move cursor to end of inserted text
            vim.api.nvim_win_set_cursor(0, { row + #lines, col })
          end

          require("sg.cody.commands").autocomplete(nil, handle_result)
        end,
        desc = "Cody autocomplete",
      },
    },

    -- If you have a recent version of lazy.nvim, you don't need to add this!
    build = "nvim -l build/init.lua",
  },
}
