return {
  "folke/flash.nvim",
  keys = {
    -- Disable the default flash keymap to use "s" to subsitute character (default vim behavior)
    { "s", mode = { "n", "x", "o" }, false },
  },
}
