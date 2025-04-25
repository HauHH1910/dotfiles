-- Leader config
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remove search highlights after searching
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search hightlights"})


-- Exit Vim's terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode"})

-- Disable arrow keys in normal node
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move LEFT"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move RIGHT"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move UP"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move DOWN"<CR>')

-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', {desc = "Move focus to the left window"})
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', {desc = "Move focus to the right window"})
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', {desc = "Move focus to the lower window"})
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', {desc = "Move focus to the upper window"})

vim.keymap.set('n', '<leader>wv', ':vsplit<cr>', {desc = "[W]indow Split [V]ertical"})
vim.keymap.set('n', '<leader>wh', ':split<cr>', {desc = "[W]indow Split [H]orizontal"})

vim.keymap.set('v', '<', "gv", {desc = "Indent left in visual mode"})
vim.keymap.set('v', '>', "gv", {desc = "Indent right in visual mode"})

-- Binding key for nvim
vim.keymap.set('n', '<leader>ww', '<cmd>:q!<cr>', { desc = "Exit Vim without save"})
vim.keymap.set('n', '<leader>wq', '<cmd>:wq<cr>', { desc = "Exit Vim with save"})

