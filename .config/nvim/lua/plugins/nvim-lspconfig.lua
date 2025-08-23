return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason-lspconfig.nvim" },
        {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
                library = {
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        }
    },
    config = function()
        -- Add keymap
        vim.keymap.set("n", "<leader>fm", function() vim.lsp.buf.format() end, { desc = "Format file" })
        -- TODO: only on lsp attach & format on <leader>fm
        vim.diagnostic.config({
            virtual_text = {
                prefix = "●",
                source = "if_many", -- shows the source (e.g., "eslint") if multiple
                spacing = 4,        -- space between code and text
                severity = nil,     -- show all severities
            },
            underline = true,       -- keep underline too
            signs = true,           -- signs in gutter
            update_in_insert = false,
            severity_sort = true,
        })
    end
}
