-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Python binary for neovim
vim.g.python3_host_prog = "~/.virtualenvs/nvim/bin/python3"
-- Wrap to fit into window by default
vim.opt.wrap = true
vim.opt.linebreak = true
-- Enable spelling by default
vim.opt.spell = true
