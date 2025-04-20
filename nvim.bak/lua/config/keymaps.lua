-- config keymap leader in nvim 
vim.g.mapleader = " "
vim.g.maplocalleader = " "
local key = vim.keymap

local opts = { silent = true, remap = true}
-- directory navigation
key.set("n","<leader>m", ":NvimTreeFocus<CR>", { noremap = true, silent = true })
key.set("n","<leader>f", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Page Navigation
key.set("n", "<C-h>", "<C-w>h", opts) -- navigation left
key.set("n", "<C-j>", "<C-w>j", opts) -- navigation down
key.set("n", "<C-k>", "<C-w>k", opts) -- navigation Up
key.set("n", "<C-l>", "<C-w>l", opts) -- navigation right

-- Windows management
key.set("n", "<leader>sv", ":vsplit<CR>", opts) -- split vertical
key.set("n", "<leader>sh", ":split<CR>", opts) -- split horizon
key.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts) -- toggle
-- Indenting
key.set("v", "<", "<gv", { remap = true})
key.set("v", ">", ">gv", { remap = true})
-- comment
key.set("n", "<C-_>", "gcc", { noremap = false })
key.set("v", "<C-_>", "gcc", { noremap = false})
