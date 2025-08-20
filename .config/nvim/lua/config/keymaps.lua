-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Keep cursor on the middle of screen when scrolling h/page up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })

-- Move seletion
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- Scroll left and right
vim.keymap.set("n", "zl", "zlzlzlzlzl", { silent = true })
vim.keymap.set("n", "zh", "zhzhzhzhzh", { silent = true })

-- Switch project using tmux sessions
-- vim.keymap.set("n", "<leader>bnn", "<cmd>!tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>ue", "<cmd>lua vim.opt.colorcolumn='80'<CR>", { silent = true })
vim.keymap.set("n", "<leader>uee", "<cmd>lua vim.opt.colorcolumn=''<CR>", { silent = true })
