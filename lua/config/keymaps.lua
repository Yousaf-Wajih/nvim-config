-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local del = vim.keymap.del

map("n", "<S-tab>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>qb", Snacks.bufdelete.delete, { desc = "Delete Buffer" })
map("n", "<leader>qB", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

del("n", "<leader>ft")
del("n", "<leader>fT")
del("n", "<c-/>")
del("n", "<c-_>")

local lazyterm_root = function()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end

local lazyterm = function()
  Snacks.terminal()
end

map("n", "<leader>ft", lazyterm, { desc = "Terminal" })
map("n", "<leader>fT", lazyterm_root, { desc = "Terminal (Root Dir)" })
map("n", "<c-/>", lazyterm, { desc = "Terminal" })
map("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })
