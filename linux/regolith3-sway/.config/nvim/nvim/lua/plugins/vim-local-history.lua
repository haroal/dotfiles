return {
  "dinhhuy258/vim-local-history",
  build = ":UpdateRemotePlugins",
  keys = {
    { "gh", "<cmd>LocalHistoryToggle<CR>", desc = "Local history" },
  },
}
