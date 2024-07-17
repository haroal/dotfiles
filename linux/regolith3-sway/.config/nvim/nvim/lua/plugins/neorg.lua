return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- We'd like this plugin to load first out of the rest
    config = true, -- This automatically runs `require("luarocks-nvim").setup()`
  },
  {
    "nvim-neorg/neorg",
    dependencies = {
      "vhyrro/luarocks.nvim",
      "hrsh7th/nvim-cmp",
    },
    lazy = true, -- enable lazy load
    ft = "norg", -- lazy load on file type
    cmd = "Neorg", -- lazy load on command
    keys = {
      { "<leader>n", "<cmd>Neorg<CR>", desc = "Notes (neorg)" },
    },
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              default_workspace = "arch",
              workspaces = {
                arch = "~/Documents/Notes/arch",
                perso = "~/Documents/Notes/perso",
              },
            },
          },
          ["core.export"] = {},
          ["core.export.markdown"] = {},
          ["core.completion"] = {
            config = {
              engine = "nvim-cmp",
            },
          },
          ["core.integrations.nvim-cmp"] = {},
        },
      })
      require("cmp").setup.filetype("norg", {
        enabled = false,
      })
    end,
  },
}
