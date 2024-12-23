return {
  "hrsh7th/nvim-cmp",
  opts = function()
    local cmp = require("cmp")
    return {
      sources = cmp.config.sources({
        { name = "cody" },
        { name = "nvim_lsp" },
        -- { name = "lazydev" },
        { name = "luasnip" },
        { name = "path" },
      }, {
        { name = "buffer" },
      }),

      mapping = {
        -- Manually trigger cody completions
        ["<M-space>"] = cmp.mapping.complete({
          config = {
            sources = {
              { name = "cody" },
            },
          },
        }),
      },
    }
  end,
}
