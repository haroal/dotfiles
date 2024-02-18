-- To add a shortcut to get link to GitHub from current line(s)
return {
  "vincent178/nvim-github-linker",
  config = true,
  keys = {
    { "<leader>gu", "<cmd>GithubLink<CR><cmd>let @+=@*<CR>", mode = { "n", "v" }, desc = "GitHub link" },
  },
}
