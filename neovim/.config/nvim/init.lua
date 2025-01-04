require("config.lazy")

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.number = true
vim.o.relativenumber = true

-- Sync clipboard between OS and NeoVim
-- Remove this option if you want your OS clipboard to remain independent.
-- See `:help 'clipboard'`
vim.o.clipboard = "unnamedplus"

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false

-- keep sign column on by default
vim.o.signcolumn = 'yes'
