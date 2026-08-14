vim.pack.add({
	{ src = "https://github.com/juacker/git-link.nvim",},
})

local gitlink = require("git-link.main")

vim.keymap.set('n', '<leader>glu', function() gitlink.copy_line_url() end)
vim.keymap.set('n', '<leader>glo', function() gitlink.open_line_url() end)
vim.keymap.set('n', '<leader>glp', function() gitlink.copy_permalink() end)
vim.keymap.set('n', '<leader>glP', function() gitlink.open_permalink() end)
vim.keymap.set('x', '<leader>glu', function() gitlink.copy_line_url() end)
vim.keymap.set('x', '<leader>glo', function() gitlink.open_line_url() end)
vim.keymap.set('x', '<leader>glp', function() gitlink.copy_permalink() end)
vim.keymap.set('x', '<leader>glP', function() gitlink.open_permalink() end)
