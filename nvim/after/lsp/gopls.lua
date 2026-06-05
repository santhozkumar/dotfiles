return {
  settings = {
    gopls = {
      buildFlags = {"-tags=itests"},
      completeUnimported = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}
