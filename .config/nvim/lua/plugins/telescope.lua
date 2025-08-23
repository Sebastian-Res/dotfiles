return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release" },
        "nvim-tree/nvim-web-devicons",
    },
    init = function()
        local map = vim.keymap.set
        local builtin = require("telescope.builtin")

        -- File Search
        map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
        map("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
        map("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
        map("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })

        -- Git Search
        map("n", "<leader>gc", builtin.git_commits, { desc = "Git commits" })
        map("n", "<leader>gs", builtin.git_status, { desc = "Git status" })

        -- LSP Integration
        map("n", "<leader>ls", builtin.lsp_document_symbols, { desc = "LSP Document Symbols" })
        map("n", "<leader>lw", builtin.lsp_workspace_symbols, { desc = "LSP Workspace Symbols" })
    end,
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                layout_config = { prompt_position = "top" },
                sorting_strategy = "ascending",
                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,                           -- Move down
                        ["<C-k>"] = actions.move_selection_previous,                       -- Move up
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- Send to quickfix
                    },
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
                live_grep = {
                    additional_args = function() return { "--hidden" } end, -- Grep hidden files
                },
            },
            extensions = {
                fzf = { fuzzy = true, override_generic_sorter = true, override_file_sorter = true },
            },
        })

        telescope.load_extension("fzf") -- Load FZF extension
    end,
}
