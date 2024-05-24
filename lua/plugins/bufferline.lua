return {
    'akinsho/bufferline.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'echasnovski/mini.bufremove'
    },
    lazy = false,
    keys = {
        { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = 'Toggle pin' },
        { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Delete non-pinned buffers' },
        { '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', desc = 'Delete other buffers' },
        { '<leader>br', '<Cmd>BufferLineCloseRight<CR>', desc = 'Delete buffers to the right' },
        { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', desc = 'Delete buffers to the left' },
        { '<leader>bd', '<Cmd>bdelete<CR>', desc = 'Delete Current Buffer'},
        { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev buffer' },
        { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next buffer' },
        { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev buffer' },
        { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Next buffer' },
      },
      opts = {
        options = {
            numbers = 'none',
            always_show_bufferline = true,
            close_command = function(n) require('mini.bufremove').delete(n, false) end,
            right_mouse_command = function(n) require('mini.bufremove').delete(n, false) end,
            offsets = {
                {
                    filetype = 'neo-tree',
                    text = 'Neo-tree',
                    highlight = 'Directory',
                    text_align = 'left',
                },
            },
        },
      },
}
