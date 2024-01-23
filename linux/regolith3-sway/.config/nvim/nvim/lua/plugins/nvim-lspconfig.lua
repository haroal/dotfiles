return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                -- Analyze the entire workspace to have all imports suggested
                diagnosticMode = "workspace",
              },
            },
          },
        },
      },
    },
  },
}
