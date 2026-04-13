return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            {
                "nvim-lua/plenary.nvim",
                "github/copilot.vim",
            },
        },
        opts = {
            -- Depends on the available models
            model = "gpt-5.3-codex",

            window = {
                -- TODO: Only works if File Tree closed
                width = 80,
            },

            headers = {
                user = '👤 You',
                assistant = '🤖 Copilot',
                tool = '🔧 Tool',
            }
        },

        separator = '━━',
        auto_fold = true, -- Automatically folds non-assistant messages
        init = function()
            local map = vim.keymap.set

            -- Fix to allow Completion in Copilot Chat window
            vim.g.copilot_no_tab_map = true
            map('i', '<S-Tab>', 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = false })

            -- Quick chat keybinding
            map('n', '<leader>ccq', function()
                local input = vim.fn.input("Quick Chat (Current buffer): ")
                if input ~= "" then
                    require("CopilotChat").ask(input, { resources = "buffer" })
                end
            end, { desc = "CopilotChat - Quick chat (Current buffer)" })

            map('n', '<leader>cct', function() require("CopilotChat").toggle() end, { desc = "CopilotChat - Toggle" })
        end,
    },
}
