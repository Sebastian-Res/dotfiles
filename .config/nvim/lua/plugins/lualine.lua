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
                        cond = function()
                            if require("noice").api.statusline.mode.has() == false then
                                return false
                            else
                                local mode = require("noice").api.statusline.mode.get()

                                if string.match(mode, "INSERT") then return false end
                                return true
                            end
                        end
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
