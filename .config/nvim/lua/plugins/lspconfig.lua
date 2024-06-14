return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        lspconfig.pyright.setup {
            capabilities = capabilities,
        }

        lspconfig.html.setup {
            capabilities = capabilities,
        }

        lspconfig.cssls.setup {
            capabilities = capabilities,
        }

        require("lspconfig.ui.windows").default_options.border = "rounded"

        vim.diagnostic.config({
            signs = false,
            virtual_text = true,
            float = {
                focusable = true,
                border = "rounded",
            },
        })

        vim.keymap.set("n", "<C-Space>", vim.diagnostic.open_float)
    end,
}
