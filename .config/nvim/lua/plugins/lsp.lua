return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPost" },
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            vim.lsp.config('*', {
                capabilities = capabilities,
            })
            vim.lsp.config('gopls', {
                settings = {
                    gopls = {
                        gofumpt = true,
                    },
                },
            })
            vim.lsp.enable({ "gopls", "clangd", "lua_ls", "pyright", "ruff" })

            vim.keymap.set("n", "<leader>dn", function() vim.diagnostic.jump({ count = 1, float = true }) end)
            vim.keymap.set("n", "<leader>dp", function() vim.diagnostic.jump({ count = -1, float = true }) end)

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(ev)
                    local opts = { buffer = ev.buf }
                    vim.keymap.set("n", "K", function()
                        vim.lsp.buf.hover({ border = "rounded" })
                    end, opts)
                    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "<leader>lf", function()
                        vim.lsp.buf.format { async = true }
                    end, opts
                    )
                end,
            })
            -- Rounded Borders for diagnostics, hover and signaturehelp floating windows.
            vim.diagnostic.config({
                float = {
                    border = "rounded",
                }
            })

        end,
    },
}
