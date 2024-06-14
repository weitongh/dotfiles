return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        local npairs = require("nvim-autopairs")
        local rule = require("nvim-autopairs.rule")
        local cond = require("nvim-autopairs.conds")

        npairs.setup()
        npairs.add_rules({ rule("<", ">", { "html", "lua" }):with_move(cond.after_regex("<")) })

        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local cmp = require("cmp")

        cmp.event:on(
        "confirm_done",
        cmp_autopairs.on_confirm_done()
        )
    end,
}
