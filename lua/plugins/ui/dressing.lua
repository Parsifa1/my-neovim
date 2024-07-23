---@diagnostic disable: duplicate-set-field

local init = function()
    vim.ui.select = function(...)
        require("lazy").load { plugins = { "dressing.nvim" } }
        return vim.ui.select(...)
    end
    vim.ui.input = function(...)
        require("lazy").load { plugins = { "dressing.nvim" } }
        return vim.ui.input(...)
    end
end

local session_config = {
    prompt = false,
    winopts = {
        height = 0.32,
        width = 0.47,
        row = 0.50,
        col = 0.50,
        title_pos = "center",
        title = " " .. "Sessions" .. " ",
    },
    hls = { title = "TelescopePromptTitle" },
}
return {
    "stevearc/dressing.nvim",
    init = init,
    opts = {
        select = {
            backend = { "fzf_lua", "telescope" },
            get_config = function(opts)
                if opts.prompt == "Load Session" then
                    return {
                        backend = { "fzf_lua" },
                        fzf_lua = session_config,
                    }
                end
                if opts.kind == "codeaction" then
                    return {}
                end
            end,
            -- telescope = require("telescope.themes").get_dropdown { initial_mode = "normal" },
            fzf_lua = {
                winopts = {},
            },
        },
    },
}
