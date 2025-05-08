-- Set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap
local wk = require("which-key")

-- General keymaps
keymap.set("n", "<leader>wq", ":wq<CR>", { desc = "Save and quit" })
keymap.set("n", "<leader>qq", ":q!<CR>", { desc = "Quit without saving" })
keymap.set("n", "<leader>ww", ":w<CR>", { desc = "Save" })
keymap.set("n", "gx", ":!open <c-r><c-a><CR>", { desc = "Open URL under cursor" })

-- Split window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split windows equal width" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close split window" })
keymap.set("n", "<leader>sj", "<C-w>-", { desc = "Make split window height shorter" })
keymap.set("n", "<leader>sk", "<C-w>+", { desc = "Make split windows height taller" })
keymap.set("n", "<leader>sl", "<C-w>>5", { desc = "Make split windows width bigger" })
keymap.set("n", "<leader>sh", "<C-w><5", { desc = "Make split windows width smaller" })

-- Tab management
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open a new tab" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close a tab" })
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Next tab" })
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Previous tab" })

-- Vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", { desc = "Toggle maximize split" })

-- Nvim-tree
keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
keymap.set("n", "<leader>er", ":NvimTreeFocus<CR>", { desc = "Focus file explorer" })
keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>", { desc = "Find file in explorer" })

-- Telescope
keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Find files" })
keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "Live grep" })
keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "Find buffers" })
keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "Help tags" })
keymap.set("n", "<leader>fs", require("telescope.builtin").current_buffer_fuzzy_find, { desc = "Find in buffer" })
keymap.set("n", "<leader>fo", require("telescope.builtin").lsp_document_symbols, { desc = "Document symbols" })
keymap.set("n", "<leader>fi", require("telescope.builtin").lsp_incoming_calls, { desc = "LSP incoming calls" })
keymap.set("n", "<leader>fm", function()
  require("telescope.builtin").treesitter({ symbols = { "function", "method" } })
end, { desc = "Find methods/functions" })
keymap.set("n", "<leader>ft", function()
  local success, node = pcall(function() return require("nvim-tree.lib").get_node_at_cursor() end)
  if not success or not node then return end
  require("telescope.builtin").live_grep({ search_dirs = { node.absolute_path } })
end, { desc = "Grep in tree node" })

-- Git-blame
keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>", { desc = "Toggle git blame" })

-- Harpoon
keymap.set("n", "<leader>ha", require("harpoon.mark").add_file, { desc = "Harpoon add file" })
keymap.set("n", "<leader>hh", require("harpoon.ui").toggle_quick_menu, { desc = "Harpoon quick menu" })
for i = 1, 9 do
  keymap.set("n", "<leader>h" .. i, function()
    require("harpoon.ui").nav_file(i)
  end, { desc = "Harpoon go to file " .. i })
end

-- REST Console
keymap.set("n", "<leader>xr", ":call VrcQuery()<CR>", { desc = "Run REST query" })

-- LSP
local lsp = vim.lsp.buf
local diag = vim.diagnostic
keymap.set("n", "<leader>gg", lsp.hover, { desc = "Hover" })
keymap.set("n", "<leader>gd", lsp.definition, { desc = "Go to definition" })
keymap.set("n", "<leader>gD", lsp.declaration, { desc = "Go to declaration" })
keymap.set("n", "<leader>gi", lsp.implementation, { desc = "Go to implementation" })
keymap.set("n", "<leader>gt", lsp.type_definition, { desc = "Go to type" })
keymap.set("n", "<leader>gr", lsp.references, { desc = "Go to references" })
keymap.set("n", "<leader>gs", lsp.signature_help, { desc = "Signature help" })
keymap.set("n", "<leader>rr", lsp.rename, { desc = "Rename" })
keymap.set("n", "<leader>gf", function() lsp.format({ async = true }) end, { desc = "Format" })
keymap.set("v", "<leader>gf", function() lsp.format({ async = true }) end, { desc = "Format" })
keymap.set("n", "<leader>ga", lsp.code_action, { desc = "Code action" })
keymap.set("n", "<leader>gl", diag.open_float, { desc = "Show diagnostics" })
keymap.set("n", "<leader>gp", diag.goto_prev, { desc = "Previous diagnostic" })
keymap.set("n", "<leader>gn", diag.goto_next, { desc = "Next diagnostic" })
keymap.set("n", "<leader>tr", lsp.document_symbol, { desc = "Document symbols" })
keymap.set("i", "<C-Space>", lsp.completion, { desc = "Trigger completion" })

-- Java-specific
keymap.set("n", "<leader>go", function()
  if vim.bo.filetype == "java" then require("jdtls").organize_imports() end
end, { desc = "Organize imports" })
keymap.set("n", "<leader>gu", function()
  if vim.bo.filetype == "java" then require("jdtls").update_projects_config() end
end, { desc = "Update Java project config" })
keymap.set("n", "<leader>tc", function()
  if vim.bo.filetype == "java" then require("jdtls").test_class() end
end, { desc = "Run Java test class" })
keymap.set("n", "<leader>tm", function()
  if vim.bo.filetype == "java" then require("jdtls").test_nearest_method() end
end, { desc = "Run Java nearest test" })

-- DAP
local dap = require("dap")
keymap.set("n", "<leader>bb", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
keymap.set("n", "<leader>bc", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, { desc = "Conditional breakpoint" })
keymap.set("n", "<leader>bl", function() dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, { desc = "Log point" })
keymap.set("n", "<leader>br", dap.clear_breakpoints, { desc = "Clear breakpoints" })
keymap.set("n", "<leader>ba", "<cmd>Telescope dap list_breakpoints<cr>", { desc = "List breakpoints" })
keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
keymap.set("n", "<leader>dj", dap.step_over, { desc = "Step over" })
keymap.set("n", "<leader>dk", dap.step_into, { desc = "Step into" })
keymap.set("n", "<leader>do", dap.step_out, { desc = "Step out" })
keymap.set("n", "<leader>dd", function() dap.disconnect(); require("dapui").close() end, { desc = "Disconnect DAP" })
keymap.set("n", "<leader>dt", function() dap.terminate(); require("dapui").close() end, { desc = "Terminate DAP" })
keymap.set("n", "<leader>dr", dap.repl.toggle, { desc = "Toggle REPL" })
keymap.set("n", "<leader>dl", dap.run_last, { desc = "Run last" })
keymap.set("n", "<leader>di", function() require("dap.ui.widgets").hover() end, { desc = "DAP Hover" })
keymap.set("n", "<leader>d?", function() require("dap.ui.widgets").centered_float(require("dap.ui.widgets").scopes) end, { desc = "DAP Scopes" })
keymap.set("n", "<leader>df", "<cmd>Telescope dap frames<cr>", { desc = "DAP Frames" })
keymap.set("n", "<leader>dh", "<cmd>Telescope dap commands<cr>", { desc = "DAP Commands" })
keymap.set("n", "<leader>de", function() require("telescope.builtin").diagnostics({ default_text = ":E:" }) end, { desc = "Diagnostics search" })

-- Which-key toggle itself
keymap.set("n", "<leader>?", function() wk.show({ global = false }) end, { desc = "Show which-key popup" })
