-- File Tree
return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    cmd = 'Neotree',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
        'MunifTanjim/nui.nvim',
    },
    keys = {
        {
            '<C-e>',
            function()
                require('neo-tree.command').execute({ toggle = true, dir = vim.loop.cwd() })
            end,
            desc = 'Explorer NeoTree (root dir)',
        },
        -- {
        --     '<leader>be',
        --     function()
        --         require('neo-tree.command').execute({ source = 'buffers', toggle = true })
        --     end,
        --     desc = 'Buffer explorer',
        -- },
    },

}

