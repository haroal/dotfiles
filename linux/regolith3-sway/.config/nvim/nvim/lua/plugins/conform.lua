-- Use "blue" formatter for Python files instead of "black"
return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      ["python"] = { "blue" },
    },
  },
}
