-- Git plugins
return {
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            local on_attach = function (bufnr)
                local gitsigns = require('gitsigns')

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map('n', ']c', function()
                  if vim.wo.diff then
                    vim.cmd.normal({']c', bang = true})
                  else
                    gitsigns.nav_hunk('next')
                  end
                end, { desc = 'Go to next hunk' })

                map('n', '[c', function()
                  if vim.wo.diff then
                    vim.cmd.normal({'[c', bang = true})
                  else
                    gitsigns.nav_hunk('prev')
                  end
                end, { desc = 'Go to previous hunk' })

                -- Actions
                map('n', '<leader>gc', gitsigns.preview_hunk, { desc = 'Preview git changes' })
                map('n', '<leader>gb', gitsigns.toggle_current_line_blame, { desc = 'Toggle line git blame' })
                map('n', '<leader>gr', gitsigns.reset_hunk, { desc = 'Reset current git hunk' })
            end
            require('gitsigns').setup {
                on_attach = on_attach,
            }
        end

    },
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
}
