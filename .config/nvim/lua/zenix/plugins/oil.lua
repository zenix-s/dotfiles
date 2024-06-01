return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({

      -- vim.keymap.set("n", "<leader>o", "<cmd>Oil<CR>", { desc = "Open oil.nvim" }),
    })
  end,
  keys = {
    {"<leader>o", "<cmd>Oil<CR>", { noremap = true, silent = true, desc = "Open oil.nvim" } },
  },
}
