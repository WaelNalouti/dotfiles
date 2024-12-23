return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  keys = function()
    local keys = {
      {
        "<leader>H",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Harpoon File",
      },
      {
        "<leader>h",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon Quick Menu",
      },
      {
        "<C-x>",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:select_menu_item({ split = true })
        end,
        desc = "Select horizental",
      },
      {
        "<C-v>",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:select_menu_item({ vsplit = true })
        end,
        desc = "Select vertical",
      },
    }
    for i = 1, 5 do
      table.insert(keys, {
        "<leader>" .. i,
        function()
          require("harpoon"):list():select(i)
        end,
        desc = "Harpoon to File " .. i,
      })
    end
    return keys
  end,
}
