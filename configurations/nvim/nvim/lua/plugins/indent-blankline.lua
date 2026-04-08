return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        indent = {
            char = "▏",
            smart_indent_cap = true
        },
        scope = {
            show_start = false,
            show_end = false,
        },
        exclude = {
            filetypes = {
                "dashboard"
            }
        }
    },
}
