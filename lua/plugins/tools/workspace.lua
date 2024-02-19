return {
    {
        "natecraddock/workspaces.nvim",
        dependencies = { "Shatur/neovim-session-manager" },
        config = function()
            require("workspaces").setup {
                auto_open = true,
                sort = true,
                mru_sort = true,
                hooks = {
                    add = { "SessionManager save_current_session" },
                    open = { "SessionManager load_current_dir_session" },
                    remove = { "SessionManager delete_current_dir_session" },
                },
            }
        end,
    },
    {
        "Shatur/neovim-session-manager",
        lazy = true,
        config = function()
            require("session_manager").setup {
                autoload_mode = "Disabled",
            }
            vim.api.nvim_create_autocmd({ "DirChangedPre" }, {
                callback = require("session_manager").autosave_session,
            })
        end,
    },
}