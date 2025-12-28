-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local overseer = require("overseer")

vim.keymap.set("n", "<leader>ot", function()
  overseer.toggle()
end, { desc = "Overseer toggle" })

vim.keymap.set("n", "<leader>or", ":OverseerRun<CR>", { desc = "Overseer run tasks" })
