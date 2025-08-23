-- catppuccin theme
return {
    "catppuccin/nvim",
	lazy = false,       -- make sure we load this during startup if it is your main colorscheme
	priority = 1000,    -- make sure to load this before all the other start plugins
    name = "catppuccin-scheme",
    config = function()
        require("catppuccin").setup({
            flavour = vim.g.catppuccin_scheme,
        })
        vim.cmd.colorscheme("catppuccin")
	end,
}
