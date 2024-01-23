-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- "Switch to other buffer" remapped from <leader>` to <leader>. because of dead keys
vim.keymap.del("n", "<leader>`")
vim.keymap.set("n", "<leader>.", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Replace word under the cursor + possibly next occurences
-- See https://vonheikemen.github.io/devlog/tools/how-to-survive-without-multiple-cursors-in-vim/
vim.keymap.set("n", "<leader>r", "*``cgn", { desc = "Replace current word" })

-- Center line on search/scrolling to better focus
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Remap increment/decrement number to <M-+>/<M--> to avoid conflicts with <C-a> used by tmux
vim.keymap.set("n", "g+", "<C-a>", { silent = false, desc = "Increment" })
vim.keymap.set("n", "g-", "<C-x>", { silent = false, desc = "Decrement" })

-- Lazydocker in floating terminal (like lazygit as provided by LazyVim)
local Util = require("lazyvim.util")
vim.keymap.set("n", "<leader>D", function()
  Util.terminal({ "lazydocker" }, { esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazydocker" })

-- Safely select suggestions with <CR> + add <C-y> to select the first suggestion
-- <C-CR> does not work on Tmux, so use <C-y> instead
-- See https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#safely-select-entries-with-cr
local cmp = require("cmp")
cmp.setup({
  mapping = {
    ["<CR>"] = cmp.mapping({
      i = function(fallback)
        if cmp.visible() and cmp.get_active_entry() then
          cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
        else
          fallback()
        end
      end,
      s = cmp.mapping.confirm({ select = true }),
      c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
    }),
    ["<C-y>"] = cmp.mapping({
      i = function()
        if cmp.visible() then
          cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
        end
      end,
    }),
    ["<C-Space>"] = cmp.mapping({
      i = function()
        if not cmp.visible() then
          cmp.complete()
        end
      end,
    }),
  },
})

-- Add "compare to clipboard" shortcut
local compare_to_clipboard = function()
  local ftype = vim.api.nvim_eval("&filetype")
  vim.cmd("vsplit")
  vim.cmd("enew")
  vim.cmd("normal! P")
  vim.cmd("setlocal buftype=nowrite")
  vim.cmd("set filetype=" .. ftype)
  vim.cmd("diffthis")
  vim.cmd([[execute "normal! \<C-w>h"]])
  vim.cmd("diffthis")
end
vim.keymap.set("n", "<leader>=", compare_to_clipboard, { desc = "Compare to clipboard" })
