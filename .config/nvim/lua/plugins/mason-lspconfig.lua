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

        require("mason-lspconfig").setup({
            -- Setup ls
            function(server_name)
                local server = require("lspconfig")[server_name]
                local capabilities = require('blink.cmp').get_lsp_capabilities(server.capabilities)
                server.setup({ capabilities = capabilities })
            end,
        })
    end,
}
