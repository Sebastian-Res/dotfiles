local copy_path = function(state)
    local node = state.tree:get_node()
    if not node or not node.id then
        vim.notify("No node selected.", vim.log.levels.WARN)
        return
    end

    if vim.fn.has('clipboard') == 0 then
        vim.notify("System clipboard is not available.", vim.log.levels.ERROR)
        return
    end

    local filepath = node:get_id()
    local filename = node.name
    local modify = vim.fn.fnamemodify

    local choices = {
        { label = "Filename",                   value = filename },
        { label = "Absolute path",              value = filepath },
        { label = "Path relative to CWD",       value = modify(filepath, ':.') },
        { label = "Path relative to HOME",      value = modify(filepath, ':~') },
        { label = "Filename without extension", value = modify(filename, ':r') },
        { label = "Extension of the filename",  value = modify(filename, ':e') },
    }

    require("snacks").picker.select(choices, {
        prompt = 'Choose to copy to clipboard:',
        format_item = function(item)
            return string.format("%-30s %s", item.label, item.value)
        end
    }, function(choice)
        if not choice then
            vim.notify("Copy cancelled.", vim.log.levels.INFO)
            return
        end

        local value_to_copy = choice.value

        vim.fn.setreg('+', value_to_copy)
        vim.notify('Copied to clipboard: ' .. value_to_copy)
    end)
end

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    -- Let auto-session handle startup arguments before opening the explorer.
    lazy = true,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    cmd = "Neotree",
    keys = {
        { "<leader>tt", "<cmd>Neotree filesystem toggle<CR>", desc = "Toggle Tree" },
        { "<leader>tf", "<cmd>Neotree filesystem focus<CR>",  desc = "Tree Focus" },

    },
    ---@module 'neo-tree'
    ---@type neotree.Config
    opts = {
        window = {
            width = 35,
            position = "left",
            mappings = {
                ['Y'] = copy_path
            }
        },
        filesystem = {
            follow_current_file = {
                enabled = true,
            },
            filtered_items = {
                hide_dotfiles = false,
                hide_gitignored = false,
            },
        },
    },
}
