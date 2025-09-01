return {
    "nvimdev/dashboard-nvim",
    requires = {
        "nvim-tree/nvim-web-devicons"
    },
    lazy = false,
    enabled = true,
    event = "VimEnter",
    config = function()
        require("dashboard").setup({
            theme = "doom",
            config = {
                header = {
                    [[ /$$   /$$ /$$    /$$ /$$$$$$ /$$      /$$]],
                    [[| $$$ | $$| $$   | $$|_  $$_/| $$$    /$$$]],
                    [[| $$$$| $$| $$   | $$  | $$  | $$$$  /$$$$]],
                    [[| $$ $$ $$|  $$ / $$/  | $$  | $$ $$/$$ $$]],
                    [[| $$  $$$$ \  $$ $$/   | $$  | $$  $$$| $$]],
                    [[| $$\  $$$  \  $$$/    | $$  | $$\  $ | $$]],
                    [[| $$ \  $$   \  $/    /$$$$$$| $$ \/  | $$]],
                    [[|__/  \__/    \_/    |______/|__/     |__/]],
                    [[]],
                    [[]],
                },

                center = {
                    {
                        icon = "  ",
                        desc = "Find File ",
                        action = "Telescope find_files",
                        key = "f"
                    },
                    {
                        icon = "  ",
                        desc = "Find Text",
                        action = "Telescope live_grep",
                        key = "g"
                    },
                    {
                        icon = "󰒲  ",
                        desc = "Lazy",
                        action = "Lazy",
                        key = "l"
                    },
                    {
                        icon = "  ",
                        desc = "Exit",
                        action = function() vim.api.nvim_input("<cmd>qa<cr>") end,
                        key = "q"
                    },
                },

                footer = function()
                    local utils = require("dashboard.utils")
                    local package_manager_stats = utils.get_package_manager_stats()

                    return {
                        "",
                        "⚡Startuptime: " .. package_manager_stats.time .. " ms",
                        " Plugins: " .. package_manager_stats.count .. " installed",
                    }
                end,

                vertical_center = true
            }
        })
    end
}
