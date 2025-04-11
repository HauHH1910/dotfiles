-- config keymap leader in nvim 
vim.g.mapleader = " "
vim.g.maplocalleader = " "
local key = vim.keymap

-- directory navigation
key.set("n","<leader>m", ":NvimTreeFocus<CR>", { noremap = true, silent = true })
key.set("n","<leader>f", ":NvimTreeToggle<CR>", { noremap = true, silent = true })


-- telescope plugins configuration
