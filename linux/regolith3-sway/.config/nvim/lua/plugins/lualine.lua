local Util = require("lazyvim.util")
local icons = require("lazyvim.config").icons
local lazyvim_lualine = require("lazyvim.util.lualine")

-- Copied from LazyVim/lua/lazyvim/util/lualine.lua, to display more path parts in the status line
local pretty_path = function(opts)
  opts = vim.tbl_extend("force", {
    relative = "cwd",
    modified_hl = "Constant",
  }, opts or {})

  return function(self)
    local path = vim.fn.expand("%:p") --[[@as string]]

    if path == "" then
      return ""
    end
    local root = Util.root.get({ normalize = true })
    local cwd = Util.root.cwd()

    if opts.relative == "cwd" and path:find(cwd, 1, true) == 1 then
      path = path:sub(#cwd + 2)
    else
      path = path:sub(#root + 2)
    end

    local sep = package.config:sub(1, 1)
    local parts = vim.split(path, "[\\/]")
    if #parts > 4 then
      parts = { parts[1], parts[2], "…", parts[#parts - 1], parts[#parts] }
    end

    if opts.modified_hl and vim.bo.modified then
      parts[#parts] = lazyvim_lualine.format(self, parts[#parts], opts.modified_hl)
    end

    return table.concat(parts, sep)
  end
end

-- Copied from basic LazyVim config. Just use local pretty_path() function instead of the default one.
return {
  "nvim-lualine/lualine.nvim",
  opts = {
    sections = {
      lualine_c = {
        Util.lualine.root_dir(),
        {
          "diagnostics",
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
        },
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        { pretty_path() },
      },
    },
  },
}
