return {
    "hiphish/rainbow-delimiters.nvim",
    event = "VeryLazy",
    config = function()
        -- This module contains a number of default definitions
        local rainbow_delimiters = require "rainbow-delimiters"

        ---rainbow_delimiters.config
        vim.g.rainbow_delimiters = {
            strategy = {
                [""] = rainbow_delimiters.strategy["global"],
                vim = rainbow_delimiters.strategy["local"],
            },
            query = {
                [""] = "rainbow-delimiters",
                lua = "rainbow-blocks",
            },
            highlight = {
                "TSRainbowRed",
                "TSRainbowYellow",
                "TSRainbowOrange",
                "TSRainbowBlue",
                "TSRainbowGreen",
                "TSRainbowViolet",
                "TSRainbowCyan",
                -- 'RainbowDelimiterRed',
                -- 'RainbowDelimiterYellow',
                -- 'RainbowDelimiterBlue',
                -- 'RainbowDelimiterOrange',
                -- 'RainbowDelimiterGreen',
                -- 'RainbowDelimiterViolet',
                -- 'RainbowDelimiterCyan',
            },
        }
    end,
}
