return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    keys = {
        {"<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree"},
        {"<leader>E", "<cmd>NvimTreeFocus<cr>", desc = "Focus on file tree"},
        {"<leader>F", "<cmd>NvimTreeFindFile<cr>", desc = "Find current file"},
    },
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },
        })
    end,
}
