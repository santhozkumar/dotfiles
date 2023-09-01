require("gopher").setup {
  commands = {
    go = "go",
    gomodifytags = "gomodifytags",
    gotests = "~/go/bin/gotests", -- also you can set custom command path
    impl = "impl",
    iferr = "iferr",
  },
}


vim.keymap.set("n", "<leader>gtj", vim.cmd.GoTagAdd);
vim.keymap.set("n", "<leader>gty", vim.cmd.GoTagAdd);



-- vim.keymap.set("n", "<leader>gta", vim.cmd.GoTestAdd);
-- vim.keymap.set("n", "<leader>gte", vim.cmd.GoTestsExp);
-- vim.keymap.set("n", "<leader>gt*", vim.cmd.GoTestsAll);

vim.keymap.set("n", "<leader>gif", vim.cmd.GoIfErr);


