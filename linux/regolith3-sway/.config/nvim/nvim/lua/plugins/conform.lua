-- Use "blue" formatter for Python files instead of "black"
return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      python = function()
        local root_path = vim.fn.system("git rev-parse --show-toplevel 2> /dev/null")
        local project_name = vim.fs.basename(root_path)

        -- Trim project name
        project_name = project_name:gsub("%s+", "")
        project_name = string.gsub(project_name, "%s+", "")

        if project_name == "archfx_cloud" then
          return { "blue", "ruff" }
        elseif project_name == "archfx_dremio" then
          return { "ruff_format" }
        else
          return { "isort", "black" }
        end
      end,
    },
  },
}
