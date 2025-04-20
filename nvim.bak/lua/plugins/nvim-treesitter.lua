local config = function()
  require'nvim-treesitter.configs'.setup {
  ensure_installed = { "java", "lua", "vim", "javascript", "query", "markdown", "markdown_inline" },

  sync_install = false,

  auto_install = true,

  ignore_install = { "javascript" },

  highlight = {
    enable = true,
  },
}
end

return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  config = config
}
