-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap
-- Disable lazy git...
map.del("n", "<leader>gg")
map.del("n", "<leader>gG")
map.del("n", "<leader>gf")
