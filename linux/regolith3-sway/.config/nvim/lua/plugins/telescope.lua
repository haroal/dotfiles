local conf = require("telescope.config").values
local finders = require("telescope.finders")
local make_entry = require("telescope.make_entry")
local pickers = require("telescope.pickers")
local utils = require("telescope.utils")

local _get_default_git_branch = function(cwd)
  cwd = cwd or vim.loop.cwd()

  local branches, ret = utils.get_os_command_output({ "git", "branch", "--format=%(refname:short)" }, cwd)
  local default_branch_name = nil

  if ret == 0 and branches ~= nil then
    for _, branch_name in ipairs(branches) do
      if branch_name == "main" or branch_name == "master" then
        default_branch_name = branch_name
        break
      end
    end
  end

  return default_branch_name
end

local smart_grep_todos
smart_grep_todos = function(opts)
  opts = opts or {}
  opts.cwd = vim.loop.cwd()
  opts.entry_maker = make_entry.gen_from_vimgrep(opts)

  local search = "TODO:"
  local args = vim.tbl_flatten({
    conf.vimgrep_arguments,
    "--",
    search,
  })

  local prompt_title = "Find Todo"
  if opts.only_changed_files then
    prompt_title = prompt_title .. " (changed files only)"

    local default_branch_name = _get_default_git_branch()
    if not default_branch_name then
      print("Not a git repository: searching in all files")
      opts.only_changed_files = false
    else
      local changed_files, _ = utils.get_os_command_output(
        { "git", "diff", "--name-only", "--diff-filter=ACMR", "--relative", default_branch_name },
        opts.cwd
      )
      for _, file in ipairs(changed_files) do
        table.insert(args, file)
      end
    end
  else
    prompt_title = prompt_title .. " (all files)"
  end

  pickers
    .new(opts, {
      prompt_title = prompt_title,
      finder = finders.new_oneshot_job(args, opts),
      previewer = conf.grep_previewer(opts),
      sorter = conf.generic_sorter(opts),
      attach_mappings = function(_, map)
        map({ "i", "n" }, "<C-t>", function()
          local action_state = require("telescope.actions.state")
          local line = action_state.get_current_line()
          local only_changed_files = not opts.only_changed_files
          smart_grep_todos({ only_changed_files = only_changed_files, default_text = line })
        end)

        return true
      end,
    })
    :find()
end

return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader>st",
      function()
        smart_grep_todos({ only_changed_files = true })
      end,
      desc = "Todo (changed files)",
    },
  },
}
