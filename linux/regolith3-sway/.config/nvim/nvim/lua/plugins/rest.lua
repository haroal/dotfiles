local wk = require("which-key")
wk.register({
  ["<leader>"] = {
    H = { name = "HTTP client" },
  },
})

return {
  {
    "rest-nvim/rest.nvim",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require("rest-nvim").setup({
        skip_ssl_verification = true,
      })
    end,
    keys = {
      {
        "<leader>Hr",
        "<Plug>RestNvim",
        desc = "Run current HTTP request",
      },
      {
        "<leader>Hl",
        "<Plug>RestNvimLast",
        desc = "Re-run last HTTP request",
      },
    },
    ft = { "http" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "http", "json" })
    end,
  },
}
