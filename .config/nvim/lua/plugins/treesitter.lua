return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "python",
                "lua",
                "html",
                "css",
                "bash",
            },

            highlight = { enable = true },

            indent = { enable = true },
        })
    end,
}
