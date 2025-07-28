return {
    -- {
    --     'catppuccin/nvim',
    --     name = 'catppuccin',
    --     priority = 1000,
    --     config = function()
    --         require('catppuccin').setup({
    --             integrations = {
    --                 cmp = true,
    --                 gitsigns = true,
    --                 nvimtree = true,
    --                 treesitter = true,
    --             },
    --         })
    --         -- vim.cmd.colorscheme 'catppuccin'
    --     end,
    -- },
    -- {
    --     "rose-pine/neovim",
    --     name = "rose-pine",
    --     config = function()
    --         require("rose-pine").setup({})
    --         -- vim.cmd("colorscheme rose-pine")
    --     end,
    -- },
    {
        "vague2k/vague.nvim",
        name = "vague",
        priority = 1000,
        config = function()
            require("vague").setup({})

            -- Use vim.schedule to run after colorscheme fully loads
            vim.schedule(function()
                vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { underline = true, undercurl = false, sp = "#d8647e" })
                vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { underline = true, undercurl = false, sp = "#f3be7c" })
                vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { underline = true, undercurl = false, sp = "#7e98e8" })
                vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { underline = true, undercurl = false, sp = "#7e98e8" })
                vim.api.nvim_set_hl(0, "SpellBad", { underline = true, undercurl = false, sp = "#d8647e" })
                vim.api.nvim_set_hl(0, "SpellCap", { underline = true, undercurl = false, sp = "#f3be7c" })
                vim.api.nvim_set_hl(0, "SpellRare", { underline = true, undercurl = false, sp = "#7e98e8" })
                vim.api.nvim_set_hl(0, "SpellLocal", { underline = true, undercurl = false, sp = "#7e98e8" })
            end)
        end,
    }
}
