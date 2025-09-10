return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local servers = {
            "pyright",
            "lua_ls",
            "clangd",
        }

        local on_attach = function(client, bufnr)
            local bufmap = function(mode, lhs, rhs)
                vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = bufnr })
            end

            bufmap("n", "gd", vim.lsp.buf.definition)
            bufmap("n", "gD", vim.lsp.buf.declaration)
            bufmap("n", "gi", vim.lsp.buf.implementation)
            bufmap("n", "gr", vim.lsp.buf.references)
            bufmap("n", "K", vim.lsp.buf.hover)
            bufmap("n", "<leader>rn", vim.lsp.buf.rename)
            bufmap("n", "<leader>ca", vim.lsp.buf.code_action)
            bufmap("n", "<leader>fr", function() vim.lsp.buf.format { async = true } end)
        end

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        local lspconfig = require("lspconfig")

        for _, server in ipairs(servers) do
            lspconfig[server].setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
        end

        lspconfig["lua_ls"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                    },
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false,
                    },
                    telemetry = {
                        enable = false,
                    },
                }
            },
        })
    end,
}
