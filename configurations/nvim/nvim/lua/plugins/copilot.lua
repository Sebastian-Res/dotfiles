return {
    "github/copilot.vim",
    init = function()
        vim.g.copilot_enabled = 0
    end,
    keys = {
        {
            "<leader>ct",
            function()
                if vim.g.copilot_enabled == 1 then
                    vim.cmd("Copilot disable")
                    vim.g.copilot_enabled = 0
                    vim.notify("Copilot disabled")
                else
                    vim.cmd("Copilot enable")
                    vim.g.copilot_enabled = 1
                    vim.notify("Copilot enabled")
                end
            end,
            desc = "Toggle Copilot",
        },
    },
}
