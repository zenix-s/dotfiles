return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		require("lualine").setup ({
			icons_enabled = true,
			theme = "onedark",
			section_separators = '',
			component_separators = ''
		})
	end
}
