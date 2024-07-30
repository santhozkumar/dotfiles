vim.opt.nu = true
vim.opt.relativenumber = true



-- autocmd BufEnter *.py :setlocal tabstop=4 shiftwidth=4 expandtab


vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { "*.lua", "*.js", "*.ts", "*.elm" },
  callback = function(ev)
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = true
  end
})


vim.opt.tabstop = 4
vim.opt.softtabstop = 4  -- tab after some characters means move 4 spaces
vim.opt.shiftwidth = 4   -- used by >>, <<
vim.opt.expandtab = true -- 4 white space characters instead of tab


vim.opt.smartindent = true

vim.opt.wrap = false


vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 500
vim.opt.colorcolumn = "80"
