-- NeoVim
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set('n', '<C-c>', '<esc>')
vim.keymap.set({ 'n', 'i', 'v', 'x' }, ';', ':', { noremap = true })
vim.keymap.set({ 'n', 'i', 'v', 'x' }, '<C-c>', '<esc>', { noremap = true })
vim.keymap.set({ 'n', 'v' }, '<C-j>', '<C-d>zz', { noremap = true })
vim.keymap.set({ 'n', 'v' }, '<C-k>', '<C-u>zz', { noremap = true })
vim.keymap.set('i', '<C-Del>', '<C-o>dw')
vim.keymap.set('i', '<C-H>', '<C-W>')
vim.keymap.set('n', '<S-Tab>', '<cmd>bnext<CR>')
vim.keymap.set("n", "<leader>j", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")

-- Dashboard
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>db', '<cmd>Dashboard<CR>', { noremap = true })

-- Lsp
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'LSP: Go To Definition' })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'LSP: Go To Declaration' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'LSP: Documentation' })
vim.keymap.set('n', '<C-A-l>', vim.lsp.buf.format, { desc = 'LSP: Format' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'LSP: Open Diagnostic Float' })
vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { desc = 'LSP: Rename' })
vim.keymap.set('n', ']e', '<cmd>lua vim.diagnostic.goto_next() <CR> zz', { desc = 'LSP: Go To Next Diagnostic' })
vim.keymap.set('n', '[e', '<cmd>lua vim.diagnostic.goto_prev() <CR> zz', { desc = 'LSP: Go To Previous Diagnostic' })
