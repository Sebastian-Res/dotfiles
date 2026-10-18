return {
    "rmagatti/auto-session",
    lazy = false,
    enabled = true,
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
        enabled = true,
        suppressed_dirs = { "~/", "~/Downloads", "/" },
        bypass_save_filetypes = { "dashboard" },
        args_allow_single_directory = true,
        pre_save_cmds = {
            "Neotree close"
        },
        post_restore_cmds = {
            function()
                -- Reopen the explorer at the restored working directory.
                require("neo-tree.command").execute({
                    action = "show",
                    source = "filesystem",
                    dir = vim.fn.getcwd(),
                })
            end
        },
    }
}
