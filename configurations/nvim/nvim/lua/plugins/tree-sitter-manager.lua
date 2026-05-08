return {
    "romus204/tree-sitter-manager.nvim",
    dependencies = {}, -- tree-sitter CLI must be installed system-wide
    config = function()
        require("tree-sitter-manager").setup({
            -- Nvim includes these parsers as of 0.12.0: C Lua Markdown Vimscript Vimdoc Treesitter query files ft-query-plugin
            ensure_installed = { "javascript", "html", "go" },
            auto_install = false,
            highlight = true,
        })
    end
}
