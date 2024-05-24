return {
    'mg979/vim-visual-multi',
    opts = {
        branch = 'master'
    },
    config = function()
        vim.keymap.set({'n', 'v', 'x'}, '<A-j>', '<Plug>(VM-Find-Under)')
    end
}
