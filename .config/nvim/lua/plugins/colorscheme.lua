return {
    -- gruvbox material
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.gruvbox_material_enable_italic = true
            vim.g.gruvbox_material_background = "hard"
            vim.g.gruvbox_material_foreground = "original"

            vim.cmd.colorscheme("gruvbox-material")
        end
    },
    -- Bamboo
    {
        'ribru17/bamboo.nvim',
        lazy = false,
        priority = 1000,
        enabled = false,
        config = function()
            require('bamboo').setup {
                style = "multiplex", -- or "vulgaris"
                lualine = {
                    transparent = false,
                },
            }
            require("bamboo").load()
            --vim.cmd.colorscheme("bamboo")
        end,
    },
}
