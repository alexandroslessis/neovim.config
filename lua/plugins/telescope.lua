return {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        { 
            'nvim-telescope/telescope-frecency.nvim',
            config = function()
                require('telescope').load_extension('frecency')
            end,
        },
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            enabled = vim.fn.executable('make') == 1,
            config = function()
                require('telescope').load_extension('fzf')
            end,
        },
        {
            "nvim-telescope/telescope-live-grep-args.nvim" ,
            -- This will not install any breaking changes.
            -- For major updates, this must be adjusted manually.
            version = "^1.0.0",
        },
    },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<C-f>', builtin.find_files, { desc = 'Find files' })
        vim.keymap.set('n', '<C-g>', ':lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>')
        vim.keymap.set('n', '<C-b>', builtin.buffers, { desc = 'Find buffers' })
        vim.keymap.set('n', '<C-h>', builtin.help_tags,  { desc = 'Find help tags' })
        vim.keymap.set('n', '<C-s>', builtin.current_buffer_fuzzy_find, { noremap = true, silent = true })
        vim.keymap.set('n', 'gr', builtin.lsp_references, { noremap = true, silent = true })
        vim.keymap.set('n', '<leader>ff', '<cmd>Telescope frecency workspace=CWD<CR>', { noremap = true, silent = true })
    end,
}
