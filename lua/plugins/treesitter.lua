-- Highlight, edit, and navigate code
return {
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
        autopairs = {
            enable = true,
        },
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                'bash',
                'c',
                'diff',
                'html',
                'javascript',
                'jsdoc',
                'json',
                'jsonc',
                'lua',
                'luadoc',
                'luap',
                'markdown',
                'markdown_inline',
                'python',
                'query',
                'regex',
                'toml',
                'tsx',
                'typescript',
                'vim',
                'vimdoc',
                'yaml',
            },
        },
        config = function (_, opts)
            require('nvim-treesitter.configs').setup(opts)
        end
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        opts = {
            max_lines = 5
        }
    }

}
