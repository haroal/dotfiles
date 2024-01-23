return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        -- Use custom rules for Markdown linting
        markdownlint = {
          args = { "--config", "~/.config/nvim/files/plugins/nvim-lint/markdownlint.yaml" },
        },
      },
    },
  },
}
