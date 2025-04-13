local keymap = vim.keymap
-- Update
local config = function()
  local teleScope = require('telescope')
  teleScope.setup({
    defaults = {
      vimgrep_arguments = { 
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
        '--hidden', 
        '--no-ignore',
      },
      mappings = {
        i = {
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",
        },
      },
    },
    pickers = {
      find_files = {
        theme = "dropdown",
        previewer = false,
        hidden = true,
      },
      live_grep = {
        theme = "dropdown",
        previewer = false,
      },
      buffers = { 
        theme = "dropdown",
        previewer = false,
      },
    },
  })
end

return {
  'nvim-telescope/telescope.nvim',
  lazy = false,
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = config,
  keys = {
    { "<leader>fk", ":Telescope keymaps<CR>", desc = "Find keymaps" }, 
    { "<leader>fh", ":Telescope help_tags<CR>", desc = "Find help tags" },
    { "<leader>ff", ":Telescope find_files<CR>", desc = "Find files" },
    { "<leader>fa", ":Telescope<CR>", desc = "Telescope" },
    { "<leader>fg", ":Telescope live_grep<CR>", desc = "Live grep" },
    { "<leader>fb", ":Telescope buffers<CR>", desc = "Find buffers" },
  },
}
