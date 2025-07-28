vim.wo.number = true                    -- Make line numbers default
vim.wo.signcolumn = 'yes'               -- Keep signcolumn on by default
vim.o.clipboard = 'unnamedplus'         -- Allow access to clipboard
vim.o.hlsearch = false                  -- Set highlight on search
vim.o.mouse = 'a'                       -- Enable mouse mode
vim.o.breakindent = true                -- Enable break indent
vim.o.undofile = true                   -- Save undo history
vim.o.ignorecase = true                 -- Case-insensitive searching UNLESS \C or capital in search
vim.o.smartcase = true
vim.o.updatetime = 250                  -- Decrease update time
vim.o.timeoutlen = 300                  -- Decrease update time
vim.o.completeopt = 'menuone,noselect'  -- Set completeopt to have a better completion experience
vim.o.termguicolors = true
vim.o.cursorline = true                 -- Highlight cursor line and number
vim.o.scrolloff = 10			-- Minimum lines to cursor

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- -- Fromat on save
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = function(args)
--     require("conform").format({ bufnr = args.buf })
--   end,
-- })
--

vim.cmd([[
  highlight DiagnosticUnderlineError gui=underline guisp=NONE
]])
