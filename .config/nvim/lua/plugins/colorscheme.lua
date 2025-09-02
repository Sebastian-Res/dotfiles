return {
    -- gruvbox
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.gruvbox_material_enable_italic = true
            vim.g.gruvbox_material_backgroung = "hard"
            vim.g.gruvbox_material_foregroung = "origial"

            --vim.cmd.colorscheme("gruvbox-material")
        end
    },
    -- Chocolatier
    {
        "qaptoR-nvim/chocolatier.nvim",
        priority = 1000,
        config = true,
    },
    -- Bamboo
    {
        'ribru17/bamboo.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('bamboo').setup {
                style = "multiplex", -- or "vulgaris"
                lualine = {
                    transparent = false,
                },
            }
            require("bamboo").load()
            vim.cmd.colorscheme("bamboo")
        end,
    },
}
