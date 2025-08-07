-- autocmds.lua
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
    callback = function(event)
        local bufnr = event.buf -- Get the buffer number
        local client = vim.lsp.get_client_by_id(event.data.client_id)

        local function client_supports_method(_client, method, _bufnr)
            if vim.fn.has 'nvim-0.11' == 1 then
                return _client:supports_method(method, _bufnr)
            else
                return _client.supports_method(method, { bufnr = _bufnr })
            end
        end

        -- LSP-specific keymaps (moved from your keymaps.lua)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = 'LSP: Go To Definition' })
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = 'LSP: Go To Declaration' })
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = bufnr, desc = 'LSP: Go To Implementation' }) -- Added implementation
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = bufnr, desc = 'LSP: Go To References' })         -- Added references
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = 'LSP: Documentation' })
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = 'LSP: Code Action' })     -- Added code action
        vim.keymap.set('n', '<C-A-l>', function() vim.lsp.buf.format({ async = true }) end,
            { buffer = bufnr, desc = 'LSP: Format' })
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float,
            { buffer = bufnr, desc = 'LSP: Open Diagnostic Float' })
        vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { buffer = bufnr, desc = 'LSP: Rename' })
        vim.keymap.set('n', ']e', function() vim.diagnostic.goto_next() end,
            { buffer = bufnr, desc = 'LSP: Go To Next Diagnostic' })
        vim.keymap.set('n', '[e', function() vim.diagnostic.goto_prev() end,
            { buffer = bufnr, desc = 'LSP: Go To Previous Diagnostic' })

        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, bufnr) then
            local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })

            -- When cursor stops moving: Highlights all instances of the symbol under the cursor
            -- When cursor moves: Clears the highlighting
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                buffer = bufnr,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                buffer = bufnr,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })

            -- When LSP detaches: Clears the highlighting
            vim.api.nvim_create_autocmd('LspDetach', {
                group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
                end,
            })
        end
    end,
})
