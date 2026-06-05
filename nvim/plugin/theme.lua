vim.pack.add({
	"https://github.com/rose-pine/neovim",
	"https://github.com/xiyaowong/transparent.nvim",
})
require("rose-pine").setup()
vim.cmd("colorscheme rose-pine")

local transparent = require("transparent")
transparent.setup({
	extra_groups = {
		"NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
		"TelescopeBorder",
		"MiniFilesBorder",
		"BlinkCmpMenuBorder",
	},
})
transparent.clear_prefix("NeoTree")
-- transparent.clear_prefix('lualine')
