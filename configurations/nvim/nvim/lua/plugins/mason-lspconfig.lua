return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        { "williamboman/mason.nvim" },
        { "neovim/nvim-lspconfig" },
        { "saghen/blink.cmp" }
    },
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "gopls",
                "tinymist"
            },
            automatic_enable = { "lua_ls", "gopls", "tinymist" },
        })
    end,
}
