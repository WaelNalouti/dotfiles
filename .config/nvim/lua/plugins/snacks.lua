local ensure_file_exists = function(file_path, initial_lines)
  local d = {
    success = false,
    created_new = false,
    path = nil,
  }

  if string.sub(file_path, 1, 1) == "~" then
    d.path = string.gsub(file_path, "^~", os.getenv("HOME") or os.getenv("USERPROFILE"))
  else
    d.path = file_path
  end

  local f = io.open(d.path, "r")
  if f then
    io.close(f)
    d.success = true
    d.created_new = false
  else
    local file = io.open(d.path, "w")
    if file then
      if initial_lines then
        file:write(initial_lines .. "\n")
      end
      file:close()
      d.success = true
      d.created_new = true
    else
      d.success = false
    end
  end
  return d
end

local create_new_file_at_root_dir = function(name)
  local path = vim.fn.getcwd(-1, -1) .. "/" .. name
  return ensure_file_exists(path, nil)
end

return {
  "folke/snacks.nvim",
  opts = {
    indent = { enabled = false },
    scroll = { enabled = false },
    notifier = { enabled = true },
    dashboard = {
      preset = {
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = {
        { section = "header" },
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { section = "startup" },
      },
    },
  },
  keys = {
    {
      "<leader>on",
      function()
        vim.ui.select({ "work", "personal", "new" }, {
          prompt = "Select a note file to open",
          title = "Select a note file to open",
          format_item = function(item)
            if item == "new" then
              return "Create a new note (Root Dir)"
            end
            return "Open " .. item .. " note"
          end,
        }, function(choice)
          local file_data = {}
          if choice == "personal" then
            file_data = ensure_file_exists("~/personal/NOTES.md", "# Notes")
          elseif choice == "work" then
            file_data = ensure_file_exists("~/work/NOTES.md", "# Notes")
          elseif choice == "new" then
            local file_name = vim.fn.input("file name (default notes.md): ")
            if file_name == nil or file_name == "" then
              file_name = "notes.md"
            end
            local new_note_data = create_new_file_at_root_dir(file_name)
            if new_note_data.success then
              file_data.path = new_note_data.path
              file_data.created_new = new_note_data.created_new
            else
              return
            end
          elseif choice == nil then
            return
          else
            Snacks.notify.error("Unknown note. Expected 'personal' or 'work'.", {})
            return
          end

          if file_data.success == false then
            Snacks.notify.error("Unable to open notes at path: " .. file_data.path, {})
            return
          end

          if file_data.created_new then
            Snacks.notify.info("Created new notes file at path: " .. file_data.path, {})
          end

          Snacks.win({
            file = file_data.path,
            width = 0.7,
            height = 0.7,
            bo = {
              modifiable = true,
            },
            wo = {
              winbar = "%= %h %m %f",
              wrap = false,
              signcolumn = "yes",
              statuscolumn = " ",
              conceallevel = 3,
            },
          })
        end)
      end,
      desc = "open notes",
      mode = { "n" },
    },
  },
}
