vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local attached_buf = ev.buf
        local map = vim.keymap.set

        -- LSP Keymaps
        map("n", "<leader>fm", function() vim.lsp.buf.format() end,
            { desc = "Format file" })

        map("n", "K", vim.lsp.buf.hover,
            { desc = "LSP hover", buffer = attached_buf })

        map({ "n", "v" }, "gra", function() vim.lsp.buf.code_action() end,
            { desc = "Code action", buffer = attached_buf })

        map("n", "gri", function() vim.lsp.buf.implementation() end,
            { desc = "Implementation", buffer = attached_buf })

        map("n", "grn", function() vim.lsp.buf.rename() end,
            { desc = "Rename", buffer = attached_buf })

        map("n", "grt", function() vim.lsp.buf.type_definition() end,
            { desc = "Type definition", buffer = attached_buf })

        map("n", "grr", function() vim.lsp.buf.references() end,
            { desc = "References", buffer = attached_buf })

        map("n", "grd", function() vim.lsp.buf.declaration() end,
            { desc = "Declaration", buffer = attached_buf })

        map("n", "grs", function() vim.lsp.buf.signature_help() end,
            { desc = "Signature help", buffer = attached_buf })

        -- Telescope LSP Keymaps
        map("n", "<leader>lr", require('telescope.builtin').lsp_references,
            { desc = "LSP References", buffer = attached_buf })

        map("n", "<leader>li", require('telescope.builtin').lsp_implementations,
            { desc = "LSP implementation", buffer = attached_buf })

        map("n", "<leader>lD", require('telescope.builtin').lsp_type_definitions,
            { desc = "LSP type definitions", buffer = attached_buf })

        map("n", "<leader>ld", require('telescope.builtin').lsp_definitions,
            { desc = "LSP definition", buffer = attached_buf })
    end
})

vim.diagnostic.config({
    signs = {
        -- icon before line number
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.INFO] = " ",
            [vim.diagnostic.severity.HINT] = "󰌵 ",
        },
        -- line number color
        numhl = {
            [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
            [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
            [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
            [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
        },
    },
    virtual_text = {
        prefix = "",
    },
    virtual_lines = vim.g.virtual_lines,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})
