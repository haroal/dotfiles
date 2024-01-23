local wk = require("which-key")
wk.register({
  ["<leader>"] = {
    O = {
      name = "octo (GitHub)",
      a = "assignee",
      c = "comment",
      i = "issue",
      l = "label",
      s = "suggestion",
      p = "pr",
      r = "react",
      v = "reviewer",
      w = "review",
    },
  },
})

return {
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("octo").setup({
        mappings = {
          issue = {
            close_issue = { lhs = "<leader>Oic", desc = "close issue" },
            reopen_issue = { lhs = "<leader>Oio", desc = "reopen issue" },
            list_issues = { lhs = "<leader>Oil", desc = "list open issues on same repo" },
            reload = { lhs = "<C-r>", desc = "reload issue" },
            open_in_browser = { lhs = "<C-b>", desc = "open issue in browser" },
            copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
            add_assignee = { lhs = "<leader>Oaa", desc = "add assignee" },
            remove_assignee = { lhs = "<leader>Oad", desc = "remove assignee" },
            create_label = { lhs = "<leader>Olc", desc = "create label" },
            add_label = { lhs = "<leader>Ola", desc = "add label" },
            remove_label = { lhs = "<leader>Old", desc = "remove label" },
            goto_issue = { lhs = "<leader>Oig", desc = "navigate to a local repo issue" },
            add_comment = { lhs = "<leader>Oca", desc = "add comment" },
            delete_comment = { lhs = "<leader>Ocd", desc = "delete comment" },
            next_comment = { lhs = "]c", desc = "go to next comment" },
            prev_comment = { lhs = "[c", desc = "go to previous comment" },
            react_hooray = { lhs = "<leader>Orp", desc = "add/remove 🎉 reaction" },
            react_heart = { lhs = "<leader>Orh", desc = "add/remove ❤️ reaction" },
            react_eyes = { lhs = "<leader>Ore", desc = "add/remove 👀 reaction" },
            react_thumbs_up = { lhs = "<leader>Or+", desc = "add/remove 👍 reaction" },
            react_thumbs_down = { lhs = "<leader>Or-", desc = "add/remove 👎 reaction" },
            react_rocket = { lhs = "<leader>Orr", desc = "add/remove 🚀 reaction" },
            react_laugh = { lhs = "<leader>Orl", desc = "add/remove 😄 reaction" },
            react_confused = { lhs = "<leader>Orc", desc = "add/remove 😕 reaction" },
          },
          pull_request = {
            checkout_pr = { lhs = "<leader>Opo", desc = "checkout PR" },
            merge_pr = { lhs = "<leader>Opm", desc = "merge commit PR" },
            squash_and_merge_pr = { lhs = "<leader>Ops", desc = "squash and merge PR" },
            list_commits = { lhs = "<leader>Opc", desc = "list PR commits" },
            list_changed_files = { lhs = "<leader>Opf", desc = "list PR changed files" },
            show_pr_diff = { lhs = "<leader>Opd", desc = "show PR diff" },
            add_reviewer = { lhs = "<leader>Ova", desc = "add reviewer" },
            remove_reviewer = { lhs = "<leader>Ovd", desc = "remove reviewer request" },
            close_issue = { lhs = "<leader>OpC", desc = "close PR" },
            reopen_issue = { lhs = "<leader>Opo", desc = "reopen PR" },
            list_issues = { lhs = "<leader>Oil", desc = "list open issues on same repo" },
            reload = { lhs = "<C-r>", desc = "reload PR" },
            open_in_browser = { lhs = "<C-b>", desc = "open PR in browser" },
            copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
            goto_file = { lhs = "gf", desc = "go to file" },
            add_assignee = { lhs = "<leader>Oaa", desc = "add assignee" },
            remove_assignee = { lhs = "<leader>Oad", desc = "remove assignee" },
            create_label = { lhs = "<leader>Olc", desc = "create label" },
            add_label = { lhs = "<leader>Ola", desc = "add label" },
            remove_label = { lhs = "<leader>Old", desc = "remove label" },
            goto_issue = { lhs = "<leader>Oig", desc = "navigate to a local repo issue" },
            add_comment = { lhs = "<leader>Oca", desc = "add comment" },
            delete_comment = { lhs = "<leader>Ocd", desc = "delete comment" },
            next_comment = { lhs = "]c", desc = "go to next comment" },
            prev_comment = { lhs = "[c", desc = "go to previous comment" },
            react_hooray = { lhs = "<leader>Orp", desc = "add/remove 🎉 reaction" },
            react_heart = { lhs = "<leader>Orh", desc = "add/remove ❤️ reaction" },
            react_eyes = { lhs = "<leader>Ore", desc = "add/remove 👀 reaction" },
            react_thumbs_up = { lhs = "<leader>Or+", desc = "add/remove 👍 reaction" },
            react_thumbs_down = { lhs = "<leader>Or-", desc = "add/remove 👎 reaction" },
            react_rocket = { lhs = "<leader>Orr", desc = "add/remove 🚀 reaction" },
            react_laugh = { lhs = "<leader>Orl", desc = "add/remove 😄 reaction" },
            react_confused = { lhs = "<leader>Orc", desc = "add/remove 😕 reaction" },
          },
          review_thread = {
            goto_issue = { lhs = "<leader>Oig", desc = "navigate to a local repo issue" },
            add_comment = { lhs = "<leader>Oca", desc = "add comment" },
            add_suggestion = { lhs = "<leader>Osa", desc = "add suggestion" },
            delete_comment = { lhs = "<leader>Ocd", desc = "delete comment" },
            next_comment = { lhs = "]c", desc = "go to next comment" },
            prev_comment = { lhs = "[c", desc = "go to previous comment" },
            select_next_entry = { lhs = "]q", desc = "move to previous changed file" },
            select_prev_entry = { lhs = "[q", desc = "move to next changed file" },
            select_first_entry = { lhs = "[Q", desc = "move to first changed file" },
            select_last_entry = { lhs = "]Q", desc = "move to last changed file" },
            close_review_tab = { lhs = "<ESC>", desc = "close review tab" },
            react_hooray = { lhs = "<leader>Orp", desc = "add/remove 🎉 reaction" },
            react_heart = { lhs = "<leader>Orh", desc = "add/remove ❤️ reaction" },
            react_eyes = { lhs = "<leader>Ore", desc = "add/remove 👀 reaction" },
            react_thumbs_up = { lhs = "<leader>Or+", desc = "add/remove 👍 reaction" },
            react_thumbs_down = { lhs = "<leader>Or-", desc = "add/remove 👎 reaction" },
            react_rocket = { lhs = "<leader>Orr", desc = "add/remove 🚀 reaction" },
            react_laugh = { lhs = "<leader>Orl", desc = "add/remove 😄 reaction" },
            react_confused = { lhs = "<leader>Orc", desc = "add/remove 😕 reaction" },
          },
          submit_win = {
            approve_review = { lhs = "<leader>Owa", desc = "approve review" },
            comment_review = { lhs = "<leader>Owt", desc = "comment review" },
            request_changes = { lhs = "<leader>Owr", desc = "request changes review" },
            close_review_tab = { lhs = "<ESC>", desc = "close review tab" },
          },
          review_diff = {
            add_review_comment = { lhs = "<leader>Oca", desc = "add a new review comment" },
            add_review_suggestion = { lhs = "<leader>Osa", desc = "add a new review suggestion" },
            focus_files = { lhs = "<leader>Oe", desc = "move focus to changed file panel" },
            toggle_files = { lhs = "<leader>Ob", desc = "hide/show changed files panel" },
            next_thread = { lhs = "]t", desc = "move to next thread" },
            prev_thread = { lhs = "[t", desc = "move to previous thread" },
            select_next_entry = { lhs = "]q", desc = "move to previous changed file" },
            select_prev_entry = { lhs = "[q", desc = "move to next changed file" },
            select_first_entry = { lhs = "[Q", desc = "move to first changed file" },
            select_last_entry = { lhs = "]Q", desc = "move to last changed file" },
            close_review_tab = { lhs = "<ESC>", desc = "close review tab" },
            toggle_viewed = { lhs = "<leader>Op<space>", desc = "toggle viewer viewed state" },
            goto_file = { lhs = "gf", desc = "go to file" },
          },
          file_panel = {
            next_entry = { lhs = "j", desc = "move to next changed file" },
            prev_entry = { lhs = "k", desc = "move to previous changed file" },
            select_entry = { lhs = "<cr>", desc = "show selected changed file diffs" },
            refresh_files = { lhs = "R", desc = "refresh changed files panel" },
            focus_files = { lhs = "<leader>Oe", desc = "move focus to changed file panel" },
            toggle_files = { lhs = "<leader>Ob", desc = "hide/show changed files panel" },
            select_next_entry = { lhs = "]q", desc = "move to previous changed file" },
            select_prev_entry = { lhs = "[q", desc = "move to next changed file" },
            select_first_entry = { lhs = "[Q", desc = "move to first changed file" },
            select_last_entry = { lhs = "]Q", desc = "move to last changed file" },
            close_review_tab = { lhs = "<ESC>", desc = "close review tab" },
            toggle_viewed = { lhs = "<leader>Op<space>", desc = "toggle viewer viewed state" },
          },
        },
      })
    end,
    keys = {
      -- Helpers
      { "<leader>Om", "<cmd>Octo search assignee:@me is:pr is:open<CR>", desc = "My PRs" },
      {
        "<leader>Ot",
        "<cmd>Octo search review-requested:@me is:pr is:open draft:false<CR>",
        desc = "PRs to review",
      },
      -- Lists
      { "<leader>Oh", "<cmd>Octo actions<CR>", desc = "List actions" },
      { "<leader>Oo", "<cmd>Octo pr list<CR>", desc = "List PRs" },
      -- Pull requests
      { "<leader>Opk", "<cmd>Octo pr checks<CR>", desc = "Show checks" },
      -- Review
      { "<leader>Ows", "<cmd>Octo review start<CR>", desc = "Start review" },
      { "<leader>Owp", "<cmd>Octo review resume<CR>", desc = "Resume review" },
      { "<leader>Owq", "<cmd>Octo review close<CR>", desc = "Close review" },
      { "<leader>OwS", "<cmd>Octo review submit<CR>", desc = "Submit review" },
      {
        "<leader>O<space>",
        function()
          local octo_mappings = require("octo.mappings")
          octo_mappings.toggle_viewed()
          octo_mappings.select_next_entry()
        end,
        desc = "Toggle viewed and go to next file",
      },
    },
  },
  {
    "petertriho/cmp-git",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "pwntester/octo.nvim",
      "nvim-cmp",
    },
    config = true,
  },
  {
    "nvim-cmp",
    opts = function(_, opts)
      table.insert(opts.sources, { name = "git" })
    end,
  },
}
