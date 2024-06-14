require("vscode").setup({
    -- Alternatively set style in setup
    -- style = "light"

    -- Enable transparent background
    transparent = true,

    -- Enable italic comment
    italic_comments = false,

    -- Underline `@markup.link.*` variants
    underline_links = true,

    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,

    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {
    },

    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
    },
})

-- load the colorscheme here
vim.cmd.colorscheme("vscode")
