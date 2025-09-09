return {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",     -- LSP source
        "hrsh7th/cmp-buffer",       -- buffer source
        "hrsh7th/cmp-path",         -- filesystem paths
        "hrsh7th/cmp-cmdline",      -- command line completions
        "L3MON4D3/LuaSnip",         -- snippet engine
        "saadparwaiz1/cmp_luasnip", -- snippets source
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        local mapping = cmp.mapping.preset.insert({
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<Tab>"] = cmp.mapping.select_next_item(),
            ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        })

        local sources = {
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "path" },
        }

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = mapping,
            sources = cmp.config.sources(sources),
        })

        cmp.setup.filetype("lua", {
            completion = {
                autocomplete = false,
            }
        })

        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" }
            },
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
                { name = "cmdline" },
            }),
        })
    end,
}

