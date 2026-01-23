local opts = { noremap = true, silent = true }
-- local termp_opts = { silent = true }
local builtin = require('telescope.builtin')

-- Make Easily Accessible
local keymap = vim.keymap.set

-- Space is the leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NORMAL --
-- Better Window Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- fast buffer navigation
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
-- keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>pv", ":NvimTreeOpen<CR>", opts)
keymap("n", "<leader>pc", ":NvimTreeClose<CR>", opts)


-- INSERT --
keymap("i", "jk", "<ESC>", opts)

-- VISUAL --
-- indentation
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- visual move up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- VISUAL BLOCK --
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)


-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
-- keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>pg", "<cmd>Telescope live_grep<cr>", opts)

keymap("n", "<leader>ef", "<cmd>EslintFixAll<cr>", opts)
keymap("n", "<leader>ff", "<cmd>Neoformat<cr>", opts)

keymap("n", "<leader>pf", builtin.find_files, opts)
keymap("n", "<C-p>", builtin.git_files, opts)

------------------------------------------------------
-- FOLDING (Leader-based shortcuts)
------------------------------------------------------

-- Enable better default folding
vim.o.foldmethod = "indent"         -- or "expr" with treesitter
vim.o.foldlevel = 99                -- open everything by default
vim.o.foldenable = true

-- Toggle fold under cursor
keymap("n", "<leader>ft", "za", opts)      -- (f)old (t)oggle

-- Fold all
keymap("n", "<leader>fa", "zM", opts)      -- (f)old (a)ll

-- Unfold all
keymap("n", "<leader>fA", "zR", opts)      -- (f)old (A)ll-open

-- Fold one level
keymap("n", "<leader>fc", "zc", opts)      -- (f)old (c)lose

-- Unfold one level
keymap("n", "<leader>fo", "zo", opts)      -- (f)old (o)pen

-- Codecompanion

vim.keymap.set({ "n", "v" }, "cc", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
