return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    -- Lazy load due to issue with auto-session. Folder/File argument is replaced by NvimTree_1
    lazy = true,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    cmd = {
        'NvimTreeOpen',
        'NvimTreeClose',
        'NvimTreeToggle',
        'NvimTreeFocus',
        'NvimTreeRefresh',
        'NvimTreeFindFile',
        'NvimTreeFindFileToggle',
        'NvimTreeClipboard',
        'NvimTreeResize',
        'NvimTreeCollapse',
        'NvimTreeCollapseKeepBuffers',
        'NvimTreeHiTest',
    },
    keys = {
        { "<leader>tt",  "<cmd>NvimTreeToggle<CR>",   { desc = "Toggle Tree" } },
        { "<leader>tff", "<cmd>NvimTreeFindFile<CR>", { desc = "Tree Find file" } },
        { "<leader>tf",  "<cmd>NvimTreeFocus<CR>",    { desc = "Tree Focus" } },
    },
    config = function()
        require("nvim-tree").setup({
            view = {
                width = 35,
                side = "left",
            },
            renderer = {
                icons = {
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = true,
                    },
                },
            },
            update_focused_file = {
                enable = true,
            },
            git = {
                ignore = false
            }
        })
    end,
}
