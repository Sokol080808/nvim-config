vim.g.mapleader = " "
vim.g.maplocalleader = ","

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap({'n', 'v'}, '<C-h>', '<C-w>h', opts)
keymap({'n', 'v'}, '<C-j>', '<C-w>j', opts)
keymap({'n', 'v'}, '<C-k>', '<C-w>k', opts)
keymap({'n', 'v'}, '<C-l>', '<C-w>l', opts)

keymap({'n', 'v'}, '<leader>y', '"+y', opts);
keymap({'n', 'v'}, '<leader>p', '"+p', opts);
