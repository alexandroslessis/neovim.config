vim.lsp.enable({
    -- "ty_ls",
    "pyright",
    -- "basedpyright",
    -- "pyrefly",
    "ruff_ls",
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
