-- Register custom ghactions parser and setup treesitter
vim.defer_fn(function()
  local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
  parser_config.ghactions = {
    install_info = {
      url = "https://github.com/rmuir/tree-sitter-ghactions",
      files = { "src/parser.c" },
      branch = "main",
    },
    filetype = "ghactions",
  }

  -- Configure treesitter with highlighting and detection
  require("nvim-treesitter.configs").setup({
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
