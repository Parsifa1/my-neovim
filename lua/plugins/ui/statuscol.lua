return {
    "luukvbaal/statuscol.nvim",
    branch = "0.10",

    opts = function()
        local builtin = require "statuscol.builtin"

        return {
            bt_ignore = { "nofile", "terminal" },
            segments = {
                { -- TODO:调整colwidth
                    sign = {
                        name = { ".*" },
                        text = { ".*" },
                        colwidth = 2,
                        wrap = false,
                    },
                },
                {
                    text = { builtin.lnumfunc },
                    condition = { true, builtin.not_empty },
                    click = "v:lua.ScLa",
                },
                { text = { " " } },
                {
                    text = {
                        function(args)
                            args.fold.close = ""
                            args.fold.open = ""
                            args.fold.sep = " "
                            return builtin.foldfunc(args)
                        end,
                    },
                    click = "v:lua.ScFa",
                },
                { text = { " " } },
            },
        }
    end,
}