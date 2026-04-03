return {
    "romgrk/barbar.nvim",
    dependencies = {
        "lewis6991/gitsigns.nvim",     -- OPTIONAL: for git status
        "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    enabled = true,
    init = function()
        vim.g.barbar_auto_setup = false

        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        -- Move to previous/next
        map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
        map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)

        -- Re-order to previous/next
        map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
        map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

        -- Goto buffer in position...
        map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
        map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
        map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
        map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
        map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
        map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
        map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
        map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
        map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
        map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

        -- Pin/unpin buffer
        map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)

        -- Goto pinned/unpinned buffer
        --                 :BufferGotoPinned
        --                 :BufferGotoUnpinned

        -- Close buffer
        map('n', '<leader>bc', '<Cmd>BufferClose<CR>', opts)

        -- Wipeout buffer
        --                 :BufferWipeout

        -- Close commands
        map('n', '<leader>cab', '<Cmd>BufferCloseAllButCurrent<CR>', opts)
        --                 :BufferCloseAllButPinned
        --                 :BufferCloseAllButCurrentOrPinned
        --                 :BufferCloseBuffersLeft
        --                 :BufferCloseBuffersRight

        -- Magic buffer-picking mode
        map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
        map('n', '<C-s-p>', '<Cmd>BufferPickDelete<CR>', opts)

        -- Sort automatically by...
        map('n', '<leader>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
        map('n', '<leader>bn', '<Cmd>BufferOrderByName<CR>', opts)
        map('n', '<leader>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
        map('n', '<leader>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
        map('n', '<leader>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)
    end,
    opts = {
        animation = false,
        insert_at_start = false,
        insert_at_end = true,
        icons = {
            separator = { left = "", right = "" },
            separator_at_end = true,
            inactive = {
                separator = { left = "│", right = "" },
            }
        },
        sidebar_filetypes = {
            NvimTree = true,
        },
        filetype = {
            enabled = true,
        },
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
