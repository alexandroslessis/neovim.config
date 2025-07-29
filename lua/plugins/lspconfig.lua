local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function(client, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc, noremap = true, silent = true })

        if client.name == 'ruff_lsp' then
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
        end
    end

    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('K', vim.lsp.buf.hover, 'Fetch Documentation')
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    -- nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>lf', vim.lsp.buf.format, '[L]sp [F]ormat')

    nmap('gl', vim.diagnostic.open_float, '[G]oto [L]ine Diagnostics')
    nmap(']e', '<cmd>lua vim.diagnostic.goto_next() <CR> zz', 'Goto Next Diagnostic')
    nmap('[e', '<cmd>lua vim.diagnostic.goto_prev() <CR> zz', 'Goto Previous Diagnostic')
    nmap('<leader>e', vim.diagnostic.open_float, 'Show diagnostic [E]rror messages')
    nmap('<leader>q', vim.diagnostic.setloclist, 'Open diagnostic [Q]uickfix list')

    nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })

    vim.diagnostic.config({
        virtual_text = false, -- disable virtual text
        update_in_insert = false,
        underline = true,
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

    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
        vim.lsp.handlers.hover, { border = 'single' }
    )
end

local servers = {
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = {
                globals = { 'vim' }
            }
        },
    },
    basedpyright = {
        python = {
            analysis = {
                autoImportCompletions = false,
                autoSearchPaths = true,
                diagnosticMode = 'openFilesOnly',
                typeCheckingMode = 'off',
                useLibraryCodeForTypes = true,
                diagnosticSeverityOverrides = {
                    reportGeneralTypeIssues = 'none',
                    reportOptionalSubscript = 'none',
                    reportOptionalMemberAccess = 'none',
                    reportOptionalCall = 'none',
                    reportOptionalIterable = 'none',
                    reportOptionalContextManager = 'none',
                    reportOptionalOperand = 'none',
                    reportUnknownMemberType = 'none',
                },
            }
        }
    },
    pyright = {
        pyright = {
            disableOrganizeImports = true,
        },
        python = {
            analysis = {
                autoImportCompletions = false,
                autoSearchPaths = true,
                diagnosticMode = 'openFilesOnly',
                typeCheckingMode = 'standard',
                useLibraryCodeForTypes = true,
                diagnosticSeverityOverrides = {
                    reportGeneralTypeIssues = 'none',
                    reportOptionalSubscript = 'none',
                    reportOptionalMemberAccess = 'none',
                    reportOptionalCall = 'none',
                    reportOptionalIterable = 'none',
                    reportOptionalContextManager = 'none',
                    reportOptionalOperand = 'none',
                },
            }
        }
    },
    pyrefly = {},
    pylyzer = {},
    ty_ls = {
        cmd = { 'ty', 'server' },
        filetypes = { 'python' },
        root_markers = { 'ty.toml', 'pyproject.toml', '.git' },
    },
    lemminx = {},
    ruff_lsp = {}
}

return {
    'neovim/nvim-lspconfig',
    dependencies = {
        { "folke/neodev.nvim", opts = {} },
    },

    config = function()

        local lspconfig = require('lspconfig')
        local configs = require('lspconfig.configs')
        if not configs.ty_ls then
            configs.ty_ls = {
                default_config = {
                    cmd = { 'ty', 'server' },
                    filetypes = { 'python' },
                    root_markers = { 'ty.toml', 'pyproject.toml', '.git' },
                }
            }
        end

        require 'lspconfig'.lua_ls.setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers['lua_ls'],
        }
        require 'lspconfig'.pyright.setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers['pyright']
        }
        -- require 'lspconfig'.basedpyright.setup {
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        --     settings = servers['basedpyright']
        -- }
        -- require 'lspconfig'.pyrefly.setup {
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        --     settings = servers['pyrefly']
        -- }
        -- require 'lspconfig'.pylyzer.setup {
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        --     settings = servers['pylyzer']
        -- }
        -- require 'lspconfig'.ty_ls.setup {
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        --     settings = servers['ty_ls'],
        -- }
        require 'lspconfig'.lemminx.setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers['lemminx']
        }
        -- require 'lspconfig'.ruff_lsp.setup {
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        --     settings = servers['ruff_lsp']
        -- }
    end
}
