local config = function()
	local theme = require("lualine.themes.nightfly")

	require("lualine").setup({
		options = {
			theme = theme,
			globalstatus = true,
		},
		tabline = {
			lualine_a = { "mode" },
			lualine_b = { "buffers" },
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		sections = {},
	})
end

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = config,
}
