-- file for vim options

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Make sure to setup `mapleader` and `maplocalleader` before
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- tab
vim.o.tabstop = 4      -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4  -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4   -- Number of spaces inserted when indenting

-- session
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.opt.clipboard = "unnamedplus"

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2

-- colorscheme
vim.o.background = "dark"
