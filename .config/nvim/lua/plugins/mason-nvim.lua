return {
    "williamboman/mason.nvim",
    -- opts = function(_, opts)
    --     opts.ensure_installed = opts.ensure_installed or {}
    --     table.insert(opts.ensure_installed, "js-debug-adapter", "gopls")
    -- end,
    opts = {
        ensure_installed = {
            "gopls",
            "js-debug-adapter",
        },
    },
}
