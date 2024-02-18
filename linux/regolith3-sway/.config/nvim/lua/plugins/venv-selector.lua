--- @param venv_path string A string containing the absolute path to selected virtualenv
--- @param venv_python string A string containing the absolute path to python binary in selected venv
local restart_lsp = function(venv_path, venv_python)
  vim.cmd("LspRestart")
end

return {
  "linux-cultist/venv-selector.nvim",
  opts = {
    path = "~/.virtualenvs/",
    search = false,
    changed_venv_hooks = { restart_lsp },
  },
  keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" } },
}
