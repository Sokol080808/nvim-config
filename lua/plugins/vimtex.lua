return {
    "lervag/vimtex",
    ft = { "tex" },
    config = function()
        vim.g.vimtex_compiler_method = "latexmk"

        vim.g.vimtex_indent_enabled = 0
    end,
}
