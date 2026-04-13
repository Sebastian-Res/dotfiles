-- Toggle Diagnostic
vim.api.nvim_create_user_command("DiagnosticToggle", function()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostic" })

-- Toggle virtual lines diagnostics
vim.api.nvim_create_user_command("DiagnosticVirtualLinesToggle", function()
    vim.diagnostic.config({ virtual_lines = not vim.g.virtual_lines })
    vim.g.virtual_lines = not vim.g.virtual_lines
end, { desc = "Toggle virtual line diagnostic" })
