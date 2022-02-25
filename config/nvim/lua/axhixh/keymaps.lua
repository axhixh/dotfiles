local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- local alias for keymap function
local km = vim.api.nvim_set_keymap

-- remap space as leader key
km("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Telescope
km("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
km("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

-- Nvimtree
km("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Buffers
km("n", "<S-n>", ":bnext<CR>", opts)
km("n", "<S-i>", ":bprevious<CR>", opts)
