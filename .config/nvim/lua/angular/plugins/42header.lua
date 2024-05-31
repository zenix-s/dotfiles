return {
  "Diogo-ss/42-header.nvim",
  config = function()
    require("42header").setup({
      default_map = true,
      auto_update = true,
      user = "serferna",
      mail = "serferna@student.42madrid.com",
    })
  end,
}
