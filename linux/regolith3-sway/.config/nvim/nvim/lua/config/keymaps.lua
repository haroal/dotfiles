-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- "Switch to other buffer" remapped from "<leader>`" to "<leader>." because of dead keys
vim.keymap.del("n", "<leader>`")
vim.keymap.set("n", "<leader>.", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Replace word under the cursor + possibly next occurrences
-- See https://vonheikemen.github.io/devlog/tools/how-to-survive-without-multiple-cursors-in-vim/
vim.keymap.set("n", "<leader>r", "*``cgn", { desc = "Replace current word" })
vim.keymap.set("v", "<leader>r", '"hy/<C-r>h<CR>``cgn', { desc = "Replace current word" })
-- Prepend/append to all occurrences
vim.keymap.set("n", "<leader>A", ":%s/<C-r><C-w>/&/gc", { desc = "Append/prepend current word" })
vim.keymap.set("v", "<leader>A", '"hy:%s/<C-r>h/&/gc', { desc = "Append/prepend current word" })

-- Do not yank on paste
vim.keymap.set("v", "p", [["_dP]], { desc = "Replace with paste" })
-- Copy/paste to/from system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })

-- Move cursor at the end of visual selection after yanking
vim.keymap.set("v", "y", "<cmd>set lazyredraw<CR>ygv<ESC><cmd>set nolazyredraw<CR>")

-- Center line on search/scrolling to better focus
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Remap increment/decrement number to <M-+>/<M--> to avoid conflicts with <C-a> used by tmux
vim.keymap.set({ "n", "v" }, "g+", "<C-a>", { silent = false, desc = "Increment" })
vim.keymap.set({ "n", "v" }, "g-", "<C-x>", { silent = false, desc = "Decrement" })
vim.keymap.set("v", "g/", "g<C-a>", { silent = false, desc = "Increment sequence" })
vim.keymap.set("v", "g\\", "g<C-x>", { silent = false, desc = "Decrement sequence" })

-- Keymaps to copy current file path in clipboard
vim.keymap.set("n", "<leader>fp", "<cmd>let @*=expand('%:.')<CR>", { desc = "Copy relative path" })
vim.keymap.set("n", "<leader>fP", "<cmd>let @*=expand('%:p')<CR>", { desc = "Copy absolute path" })

-- Safely select suggestions with <CR> + add <Tab> to select the first suggestion
-- <C-CR> does not work on Tmux, so use <Tab> instead
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
    ["<Tab>"] = cmp.mapping({
      i = function()
        if cmp.visible() then
          cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
        else
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
