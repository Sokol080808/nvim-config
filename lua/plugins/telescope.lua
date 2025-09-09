return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local telescope = require("telescope")
        telescope.setup {
            defaults = {
                prompt_prefix = "🔍 ",
                sorting_strategy = "ascending",
                file_ignore_patterns = {
                    ".git/",
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
            },
        }

        local map = vim.keymap.set
        map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
        map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
        map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
        map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
    end
}
