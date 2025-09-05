return {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
        -- Add keymap
        vim.keymap.set("n", "<leader>fm", function() vim.lsp.buf.format() end, { desc = "Format file" })
        -- TODO: only on lsp attach
    end
}
