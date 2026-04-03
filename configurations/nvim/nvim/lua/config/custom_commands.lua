-- Toggle Diagnostic
vim.api.nvim_create_user_command("DiagnosticToggle", function()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostic" })

-- Toggle virtual lines diagnostics
vim.api.nvim_create_user_command("DiagnosticVirtualLinesToggle", function()
    vim.diagnostic.config({ virtual_lines = not vim.g.virtual_lines })
    vim.g.virtual_lines = not vim.g.virtual_lines
end, { desc = "Toggle virtual line diagnostic" })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('user-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank({ higroup = 'Visual' })
    end,
})
