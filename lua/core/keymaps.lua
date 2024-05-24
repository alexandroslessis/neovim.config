-- NeoVim
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set('n', '<C-c>', '<esc>')
vim.keymap.set({'n', 'i', 'v', 'x'}, ';', ':', {noremap=true})
vim.keymap.set({'n', 'i', 'v', 'x'}, '<C-c>', '<esc>', {noremap=true})
vim.keymap.set({'n', 'v'}, '<C-j>', '<C-d>zz', {noremap=true})
vim.keymap.set({'n', 'v'}, '<C-k>', '<C-u>zz', {noremap=true})
vim.keymap.set('i', '<C-Del>', '<C-o>dw')
vim.keymap.set('i', '<C-H>', '<C-W>')
vim.keymap.set('n', '<S-Tab>', '<cmd>bnext<CR>')
vim.keymap.set("n", "<leader>j", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")

-- Dashboard
vim.keymap.set({'n', 'v', 'x'}, '<leader>db', '<cmd>Dashboard<CR>', {noremap=true})
