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
        function()
          require("telescope.builtin").find_files({
            prompt_title = "Find files",
            prompt_prefix = "🔍",
          })
        end,
        { noremap = true, silent = true, desc = "Find files" },
      },
      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep({
            prompt_title = "Grep files",
            prompt_prefix = "🔍",
          })
        end,
        { noremap = true, silent = true, desc = "Grep files" },
      },
    },
  },
}
