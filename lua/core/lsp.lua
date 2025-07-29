vim.lsp.enable({
    "ty_ls",
    "ruff_ls",
    -- "pyright",
    "lua_ls"
})

vim.diagnostic.config({
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        focusable = true,
        style = 'minimal',
        border = 'single',
        source = 'always',
        header = '',
        prefix = '',
    },
})
