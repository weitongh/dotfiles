return {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
    },
    config = function()
        local cmp = require("cmp")

        cmp.setup({
            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)
                end,
            },

            completion = {
                completeopt = "menu,menuone",
            },

            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },

            mapping = {
                ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
                ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
                ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
                ["<Esc>"] = cmp.mapping(cmp.mapping.abort(), { "i", "c" }),
                ["<Tab>"] = cmp.mapping(cmp.mapping.confirm({ select = true }), { "i", "c" }),
            },

            sources = cmp.config.sources(
                {
                    { name = "nvim_lsp",
                        -- Dont suggest snippet from nvm_lsp 
                        entry_filter = function(entry, ctx)
                            return require("cmp").lsp.CompletionItemKind.Snippet ~= entry:get_kind()
                    end },
                },
                {
                    { name = "buffer" },
                },
                {
                    { name = "path" },
                }
            ),

            enabled = function()
                -- disable completion in comments
                local context = require "cmp.config.context"
                -- keep command mode completion enabled when cursor is in a comment
                if vim.api.nvim_get_mode().mode == "c" then
                    return true
                else
                    return not context.in_treesitter_capture("comment")
                    and not context.in_syntax_group("Comment")
                end
            end
        })

        cmp.setup.cmdline(":", {
            sources = cmp.config.sources(
                {
                    { name = "path" }
                },
                {
                    { name = "cmdline" }
                }
            ),
            matching = { disallow_symbol_nonprefix_matching = false }
        })

        vim.opt.pumheight = 15
    end,
}
