local map = vim.keymap.set

-- buffers
map("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bn", "<cmd> enew <CR>", { desc = "New [b]uffer" })
-- buffer keymaps moved to plugins/barbar.lua

-- tabs
map("n", "<leader>tn", ":tabnew<CR>", { desc = "New tab" })

-- go to  beginning and end
map("i", "<C-b>", "<ESC>^i", { desc = "Move to first non-blank character" })
map("i", "<C-e>", "<End>", { desc = "Move to end of line" })

-- nnvigate within insert mode
map("i", "<C-h>", "<Left>", { desc = "Move cursor left" })
map("i", "<C-l>", "<Right>", { desc = "Move cursor right" })
map("i", "<C-j>", "<Down>", { desc = "Move cursor down" })
map("i", "<C-k>", "<Up>", { desc = "Move cursor up" })

-- clear search highlights on pressing <Esc> in normal mode
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using <cmd> :map
-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
map("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Move down", expr = true })
map("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Move up", expr = true })
map("n", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Move down", expr = true })
map("n", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Move down", expr = true })

-- diagnostics
map("n", "<leader>dta", ":DiagnosticToggle<CR>", { desc = "Toggle Diagnostic" })
map("n", "<leader>dtl", ":DiagnosticVirtualLinesToggle<CR>", { desc = "Toggle Virtual Lines Diagnostic" })
