-- Core Modules
require('core.keymaps')
require('core.options')
require('core.lsp')
require('core.autocmds')
require('core.buffer')

-- Plugin Manager (LazyVim)
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup('plugins')
vim.cmd.colorscheme 'vague'

