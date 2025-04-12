-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.whichwrap:append("h,l,<,>,[,]")
vim.opt.relativenumber = false
vim.g.root_lsp_ignore = { "clangd", "copilot" }
