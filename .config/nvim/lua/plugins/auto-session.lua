return {
    "rmagatti/auto-session",
    lazy = false,
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
        enabled = true,
        suppressed_dirs = { "~/", "~/Downloads", "/" },
        bypass_save_filetypes = { "dashboard" },
        args_allow_single_directory = true,
        -- log_level = "debug",
        pre_save_cmds = {
            "NvimTreeClose"
        },
        post_restore_cmds = {
            function()
                -- Restore nvim-tree after a session is restored
                local nvim_tree_api = require("nvim-tree.api")
                nvim_tree_api.tree.open()
                nvim_tree_api.tree.change_root(vim.fn.getcwd())
                nvim_tree_api.tree.reload()
            end
        },
    }
}
