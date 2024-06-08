return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
    })
  end,
  keys = {
    {
      "<leader>ee",
      "<cmd>Neotree toggle right<CR>",
      { mode = "n", desc = "Toggle NeoTree" },
    },
    {
      "<leader>ef",
      "<cmd>Neotree focus right<CR>",
      { mode = "n", desc = "Focus NeoTree" },
    },
  },
}
