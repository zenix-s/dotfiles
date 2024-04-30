return {
  "navarasu/onedark.nvim",
  priority = 1000,
  config = function()
    -- Lua
    require('onedark').setup {
      style = 'darker'
    }
    require('onedark').load()
  end,
}
--
--return {
--	"rebelot/kanagawa.nvim",
--	opts= {
--		style = ':'
--	}
--}
