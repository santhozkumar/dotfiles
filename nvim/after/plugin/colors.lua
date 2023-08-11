require('rose-pine').setup({
	    disable_background = true,
        groups = {
            comment = 'muted'
        }

    })
--
function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- require("gruvbox").setup({
-- 	contrast = "medium",
-- 	palette_overrides = {
-- 		gray = "#2ea542",
-- 	}
-- })
-- added something
ColorMyPencils()
