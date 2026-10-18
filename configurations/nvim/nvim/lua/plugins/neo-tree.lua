return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    -- Let auto-session handle startup arguments before opening the explorer.
    lazy = true,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    cmd = "Neotree",
    keys = {
        { "<leader>tt",  "<cmd>Neotree filesystem toggle<CR>", desc = "Toggle Tree" },
        { "<leader>tf",  "<cmd>Neotree filesystem focus<CR>",  desc = "Tree Focus" },
    },
    ---@module 'neo-tree'
    ---@type neotree.Config
    opts = {
        window = {
            width = 35,
            position = "left",
        },
        filesystem = {
            follow_current_file = {
                enabled = true,
            },
            filtered_items = {
                hide_dotfiles = false,
                hide_gitignored = false,
            },
        },
    },
}
