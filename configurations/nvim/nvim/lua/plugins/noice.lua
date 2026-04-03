return {
    "folke/noice.nvim",
    event = "VeryLazy",
    enabled = true,
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    opts = {
        cmdline = {
            view = "cmdline",
        },
        routes = {
            { -- dont show cmdline popup when switching buffers
                filter = { event = "cmdline", find = "bnext", },
                opts = { skip = true },
            },
            {
                filter = { event = "cmdline", find = "bprevious", },
                opts = { skip = true },
            },
            { -- hide search count virtual text
                filter = { event = "msg_show", kind = "search_count" },
                opts = { skip = true },
            },
        },
        lsp = {
            progress = {
                enabled = false
            },
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
            },
        },
        presets = {
            long_message_to_split = true, -- long messages will be sent to a split
            lsp_doc_border = true,        -- add a border to hover docs and signature help
        },
    },
}
