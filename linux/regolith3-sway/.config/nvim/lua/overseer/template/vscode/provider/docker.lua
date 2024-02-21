local variables = require("overseer.template.vscode.variables")
local Path = require("plenary.path")

local M = {}

M.get_task_opts = function(defn)
  local command = defn.command
  if not command then
    error("Missing command")
  end
  local options = defn.options or {}

  local cwd = vim.loop.cwd()
  if options.cwd then
    cwd = variables.replace_vars(options.cwd, {}, nil)
  end
  local imageName = options.image
  if not imageName then
    error("Missing image name in options.image")
  end
  local envMappings = options.env or {}
  local volumeMappings = options.volume or {}
  local extraDockerArgs = options.extraDockerArgs or {}
  local file = options.file
  if file then
    file = variables.replace_vars(options.file, {}, nil)
    file = Path:new(file):make_relative(cwd)
  end

  local cmd = {
    "docker",
    "run",
    "--rm",
  }

  for hostPath, containerPath in pairs(volumeMappings) do
    local resolvedHostPath = variables.replace_vars(hostPath, {}, nil)
    table.insert(cmd, "-v")
    table.insert(cmd, resolvedHostPath .. ":" .. containerPath)
  end
  for key, value in pairs(envMappings) do
    table.insert(cmd, "--env")
    table.insert(cmd, key .. "=" .. value)
  end
  for _, arg in ipairs(extraDockerArgs) do
    table.insert(cmd, arg)
  end
  table.insert(cmd, imageName)
  if type(command) == "string" then
    for part in vim.gsplit(command, " ", { plain = true, trimempty = true }) do
      table.insert(cmd, part)
    end
  else
    for _, part in ipairs(command) do
      table.insert(cmd, part)
    end
  end
  table.insert(cmd, file)

  return {
    cmd = cmd,
    cwd = cwd,
  }
end

return M
