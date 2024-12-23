-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.winbar = "%= %h %m %f"
vim.opt.cursorcolumn = false
vim.opt.cursorline = true
vim.opt.scrolloff = 4
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.listchars.append(
  vim.opt.listchars,
  { eol = "↲", tab = "» ", trail = "·", extends = "<", precedes = ">", conceal = "┊", nbsp = "␣" }
)
-- vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "auto"

vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldmethod = "expr"
vim.opt.foldnestmax = 20
