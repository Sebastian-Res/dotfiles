return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            extensions = {
                "nvim-tree"
            },
            options = {
                theme = "gruvbox-material",
            },
            sections = {
                lualine_x = {
                    {
                        require("noice").api.statusline.mode.get,
                        cond = require("noice").api.statusline.mode.has,
                    },
                    {
                        require("noice").api.status.command.get,
                        cond = require("noice").api.status.command.has,
                    },
                    {
                        require("noice").api.status.search.get,
                        cond = require("noice").api.status.search.has,
                    },
                    'encoding',
                    'lsp_status',
                    'filetype',
                },
            },
        })
    end
}
