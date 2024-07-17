-- To add a shortcut to get link to GitHub from current line(s)
local wk = require("which-key")
wk.add({
  { "<leader>gu", group = "GitHub link" },
})

return {
  "linrongbin16/gitlinker.nvim",
  cmd = "GitLink",
  opts = {},
  keys = {
    { "<leader>guu", "<cmd>GitLink<CR>", mode = { "n", "v" }, desc = "Copy GitHub link (current)" },
    { "<leader>guU", "<cmd>GitLink!<CR>", mode = { "n", "v" }, desc = "Open GitHub link (current)" },
    { "<leader>gud", "<cmd>GitLink default_branch<CR>", mode = { "n", "v" }, desc = "Copy GitHub link (default)" },
    { "<leader>guD", "<cmd>GitLink! default_branch<CR>", mode = { "n", "v" }, desc = "Open GitHub link (default)" },
  },
}
