-- auto build on update
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name = ev.data.spec.name
		if name == "nvim-treesitter" then
			vim.cmd("TSUpdate")
		end
	end,
})

vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

-- Setup treesitter with ghactions support (deferred so vim.pack.add has time to load the plugin)
vim.defer_fn(function()
  local ok_configs, configs = pcall(require, "nvim-treesitter.configs")
  if not ok_configs then return end

  -- Add custom parser configuration
  local ok_parsers, parsers = pcall(require, "nvim-treesitter.parsers")
  if ok_parsers and parsers.get_parser_configs then
    local parser_config = parsers.get_parser_configs()
    parser_config.ghactions = {
      install_info = {
        url = "https://github.com/rmuir/tree-sitter-ghactions",
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = "ghactions",
    }
  end

  configs.setup({
    ensure_installed = {
      "go",
      "gomod",
      "javascript",
      "typescript",
      "tsx",
      "yaml",
      "bash",
      "ghactions",
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
  })
end, 0)

-- Map .github/workflows/*.yml files to ghactions filetype
vim.filetype.add({
  pattern = {
    [".*/%.github/workflows/.*%.ya?ml$"] = "ghactions",
  },
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "go", "python", "bash", "javascript", "typescript", "tsx", "yaml" },
	callback = function()
		vim.treesitter.start()
	end,
})
