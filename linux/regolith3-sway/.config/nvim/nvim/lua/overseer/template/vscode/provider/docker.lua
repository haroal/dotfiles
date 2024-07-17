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
  local image_name = options.image
  if not image_name then
    error("Missing image name in options.image")
  end
  local env_mappings = options.env or {}
  local volume_mappings = options.volume or {}
  local extra_docker_args = options.extraDockerArgs or {}
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

  for host_path, container_path in pairs(volume_mappings) do
    local resolved_host_path = variables.replace_vars(host_path, {}, nil)
    table.insert(cmd, "-v")
    table.insert(cmd, resolved_host_path .. ":" .. container_path)
  end
  for key, value in pairs(env_mappings) do
    table.insert(cmd, "--env")
    table.insert(cmd, key .. "=" .. value)
  end
  for _, arg in ipairs(extra_docker_args) do
    table.insert(cmd, arg)
  end
  table.insert(cmd, image_name)
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
