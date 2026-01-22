vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- File Explorer
vim.keymap.set("n", "<leader>e", ":NvimTreeOpen<CR>")

-- Center the screen while jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })
 
-- Fzf keymaps
vim.keymap.set("n", "<leader>ff", ":FzfLua files<CR>")
vim.keymap.set("n", "<leader>fg", ":FzfLua grep<CR>")
 
-- Autoclose
vim.keymap.set("i", "(", "()<Esc>i")
vim.keymap.set("i", "'", "''<Esc>i")
vim.keymap.set('i', '"', '""<Esc>i')
vim.keymap.set("i", "{", "{}<Esc>i")
vim.keymap.set("i", "[", "[]<Esc>i")
vim.keymap.set("i", "<", "<><Esc>i")

-- Autopair Full Line
vim.keymap.set("v", "<leader>'", "c''<Esc>P")
vim.keymap.set("v", '<leader>"', 'c""<Esc>P')
vim.keymap.set("v", '<leader>[', 'c[]<Esc>P')


-- search
vim.opt.hlsearch = true
vim.keymap.set("n", '<Esc>', '<cmd>nohlsearch<CR>')

