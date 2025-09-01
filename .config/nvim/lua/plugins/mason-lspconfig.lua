return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        { "williamboman/mason.nvim" },
        { "saghen/blink.cmp" }
    },
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
            },
            automatic_installation = false,
        })
    end,
}
