local opts = { noremap = true, silent = true }
local termp_opts = { silent = true }

-- Make Easily Accessible
local keymap = vim.keymap.set

-- Space is the leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- REMAPPING IN NORMAL MODE --
-- fast buffer navigation
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>pv", ":E<CR>", opts)

-- REMAPPING IN INSERT MODE --
keymap("i", "jk", "<ESC>", opts)

-- REMAPPING IN VISUAL MODE --
-- indentation
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- visual move up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- REMAPPING IN VISUAL BLOCK MODE --
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

