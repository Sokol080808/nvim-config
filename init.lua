vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.tabstop = 8
vim.opt.softtabstop = 0

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.smartindent = true
vim.opt.autoindent = true

vim.diagnostic.config({
    virtual_lines = true,
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

require("config.keymaps")
require("config.lazy")

vim.cmd.colorscheme("tokyonight")

vim.g.vimtex_env_toggle_math_map = {
  ['$'] = '\\(',
  ['$$'] = '\\[',
  ['\\('] = '\\[',
  ['\\['] = 'gather*',
  ['gather'] = '\\(',
}
