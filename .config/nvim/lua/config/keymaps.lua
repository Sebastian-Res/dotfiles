local map = vim.keymap.set

-- buffers
map("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>cb", ":bd<CR>", { desc = "Close buffer" })
map("n", "<leader>cbc", ":bd!<CR>", { desc = "Force close buffer" })

-- tabs
map("n", "<leader>tn", ":tabnew<CR>", { desc = "New tab" })
