return {
    "nvimdev/dashboard-nvim",
    lazy = false,
    event = "VimEnter",
    opts = {
        theme = "doom",
        -- @TODO
    },
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    }
}
