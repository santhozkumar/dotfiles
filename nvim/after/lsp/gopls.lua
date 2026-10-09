return {
  settings = {
    gopls = {
      buildFlags = {"-tags=itests"},
      directoryFilters = { "-**/vendor", "-**/node_modules" },
      codelenses = {
        run_govulncheck = false,
        vendor = false,
      },
      completeUnimported = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}
