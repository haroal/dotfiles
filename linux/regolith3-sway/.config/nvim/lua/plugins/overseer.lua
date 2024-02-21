local wk = require("which-key")
wk.register({
  ["<leader>"] = {
    T = { name = "Tasks (overseer)" },
  },
})

local register_custom_problem_matchers = function()
  local problem_matcher = require("overseer.template.vscode.problem_matcher")

  problem_matcher.register_pattern("$pytest-django-pattern", {
    {
      regexp = "^([a-zA-Z0-9\\/_\\-\\.]+):(\\d+): in (test.+)$",
      kind = "location",
      file = 1,
      line = 2,
      message = 3,
      append = true,
    },
    {
      regexp = "^([^-_=].*)$",
      message = 1,
      loop = true,
    },
  })
  problem_matcher.register_problem_matcher("$pytest-django", {
    owner = "python",
    source = "python",
    fileLocation = { "relative", "${cwd}" },
    pattern = "$pytest-django-pattern",
  })
end

return {
  {
    "haroal/overseer.nvim",
    opts = {
      task_list = {
        max_width = { 300, 0.25 },
        min_width = { 40, 0.1 },
      },
    },
    config = function(_, opts)
      local overseer = require("overseer")
      overseer.on_setup(register_custom_problem_matchers)
      overseer.setup(opts)
    end,
    keys = {
      { "<leader>Tt", "<cmd>OverseerToggle<CR>", desc = "Toggle tasks list" },
      { "<leader>Tf", "<cmd>OverseerOpen<CR>", desc = "Focus tasks list" },
      { "<leader>Tr", "<cmd>OverseerRun<CR>", desc = "Run task" },
      { "<leader>Tb", "<cmd>OverseerBuild<CR>", desc = "Build task" },
      { "<leader>TR", "<cmd>OverseerQuickAction restart<CR>", desc = "Restart task" },
    },
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "nvim-neotest/neotest-python",
      "haroal/overseer.nvim",
    },
    opts = function(opts)
      opts = opts or {}

      -- Consumers
      if not opts.consumers then
        opts.consumers = {}
      end
      opts.consumers.overseer = require("neotest.consumers.overseer")

      -- Adapters
      if not opts.adapters then
        opts.adapters = {}
      end
      opts.adapters["neotest-python"] = {
        runner = function(python_command)
          -- Same as in neotest-python/init.lua, but just inverting to prefer django if available
          local base = require("neotest-python.base")
          return base.module_exists("django", python_command) and "django"
            or base.module_exists("pytest", python_command) and "pytest"
            or "unittest"
        end,
        args = function(runner)
          local args = {}
          if runner == "django" then
            -- Keep test database to save time
            table.insert(args, "--keepdb")
          end
          return args
        end,
      }
      return opts
    end,
  },
}
