return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
		keys = {
			{
				"<leader>ff",
				"<cmd>lua require('telescope.builtin').find_files()<CR>",
				{ noremap = true, silent = true, desc = "Find files" },
			},
			{
				"<leader>fg",
				"<cmd>lua require('telescope.builtin').live_grep()<CR>",
				{ noremap = true, silent = true, desc = "Grep files" },
			},
		},
	},
}
