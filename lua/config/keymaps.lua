vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)
