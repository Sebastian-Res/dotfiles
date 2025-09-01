return {
    -- Melange
    {
        "savq/melange-nvim",
        lazy = false,
        priority = 1000,
        config = function()
            -- Default colorscheme on startup
            vim.cmd.colorscheme("melange")
        end,
    },
    -- Chocolatier
    {
        "qaptoR-nvim/chocolatier.nvim",
        priority = 1000,
        config = true,
    }
}
