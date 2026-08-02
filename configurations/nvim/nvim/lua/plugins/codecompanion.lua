return {
    "olimorris/codecompanion.nvim",
    version = "^19.0.0",
    opts = {
        adapters = {
            acp = {
                codex = function()
                    return require("codecompanion.adapters").extend("codex", {
                        defaults = {
                            auth_method = "chat-gpt",
                        },
                    })
                end,
            },
        },
        interactions = {
            chat = {
                adapter = "codex",
            },
        },
    },

    keys = {
        {
            "<leader>ccq",
            "<cmd>CodeCompanionChat Toggle<cr>",
            desc = "Toggle Codex ACP chat",
        },
        {
            "<leader>cca",
            "<cmd>CodeCompanionActions<cr>",
            desc = "AI actions",
        },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "romus204/tree-sitter-manager.nvim",
    }
}
