local map = vim.keymap.set

-- buffers
map("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })
-- buffer keymaps moved to plugins/barbar.lua

-- tabs
map("n", "<leader>tn", ":tabnew<CR>", { desc = "New tab" })
