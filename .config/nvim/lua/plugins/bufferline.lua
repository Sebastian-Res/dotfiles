return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require("bufferline").setup({
            options = {
                mode = "buffers",
                numbers = "ordinal",
                diagnostics = "nvim_lsp",
                separator_style = "slant",
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        text_align = "left",
                    },
                },
            },
            highlights = {
                buffer_selected = {
                    -- underline = true, --weird underline sometimes
                    sp = "#FFFFFF"
                }
            }
        })
    end,
}
