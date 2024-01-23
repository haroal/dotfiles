return {
  {
    "nvim-telescope/telescope-symbols.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      { "<leader>se", "<cmd>Telescope symbols<cr>", desc = "Symbols" },
    },
  },
  {
    "hrsh7th/cmp-emoji",
    dependencies = {
      "nvim-cmp",
    },
  },
  {
    "nvim-cmp",
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },
}
