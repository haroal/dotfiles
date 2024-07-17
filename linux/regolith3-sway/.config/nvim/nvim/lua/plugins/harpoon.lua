local wk = require("which-key")
wk.add({
  { "<leader>h", group = "harpoon" },
})

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = true,
  keys = {
    {
      "<leader>hs",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Show menu",
    },
    {
      "<leader>hm",
      function()
        local harpoon = require("harpoon")
        harpoon:list():add()
      end,
      desc = "Mark file",
    },
    {
      "<leader>hp",
      function()
        local harpoon = require("harpoon")
        harpoon:list():prev()
      end,
      desc = "Go to previous file",
    },
    {
      "<leader>hn",
      function()
        local harpoon = require("harpoon")
        harpoon:list():next()
      end,
      desc = "Go to next file",
    },
    {
      "<leader>1",
      function()
        local harpoon = require("harpoon")
        harpoon:list():select(1)
      end,
      desc = "Show harpoon file 1-4",
    },
    {
      "<leader>2",
      function()
        local harpoon = require("harpoon")
        harpoon:list():select(2)
      end,
      desc = "which_key_ignore",
    },
    {
      "<leader>3",
      function()
        local harpoon = require("harpoon")
        harpoon:list():select(3)
      end,
      desc = "which_key_ignore",
    },
    {
      "<leader>4",
      function()
        local harpoon = require("harpoon")
        harpoon:list():select(4)
      end,
      desc = "which_key_ignore",
    },
  },
}
