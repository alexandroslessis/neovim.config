-- Status line
local lsp_client_names = function()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    local client_names = {}

    for _, client in pairs(clients) do
        table.insert(client_names, client.name)
    end

    return client_names
end

local lsp_info = {
    function ()
        local buf_client_names = lsp_client_names()
        if #buf_client_names == 0 then
            return 'LSP Inactive'
        end

        local unique_client_names = table.concat(buf_client_names, ", ")
        local language_servers = string.format("[%s]", unique_client_names)
        return language_servers
    end
}

local lsp_status = function()
    local get_lsp_status = function(client_names)
        local progress = vim.lsp.status()
        -- Get lsp status for current buffer
        for _, v in ipairs(progress) do
            if vim.tbl_contains(client_names, v.name) or v.name == "null-ls" then
                return v
            end
        end
    end

    local client_names = lsp_client_names()
    local lsp_status = get_lsp_status(client_names)

    -- Show client status
    if lsp_status and lsp_status.message then
        return lsp_status.title:gsub("^%l", string.upper)
            .. " ["
            .. (lsp_status.percentage and (lsp_status.percentage .. "%%") or lsp_status.message:gsub(
                "^%l",
                string.upper
            ))
            .. "]"
    end
    return ''
end

local function env_cleanup(venv)
    if string.find(venv, "/") then
      local final_venv = venv
      for w in venv:gmatch "([^/]+)" do
        final_venv = w
      end
      venv = final_venv
    end
    return venv
end

local python_env = {
    function()
        if vim.bo.filetype == "python" then
            local venv = os.getenv "CONDA_DEFAULT_ENV" or os.getenv "VIRTUAL_ENV"
            if venv then
                local icons = require "nvim-web-devicons"
                local py_icon, _ = icons.get_icon ".py"
                return string.format(" " .. py_icon .. " (%s)", env_cleanup(venv))
            end
        end
        return ""
    end
}

return {
    'nvim-lualine/lualine.nvim',
    opts = {
        options = {
            icons_enabled = false,
            -- theme = 'catppuccin',
            theme = 'vague',
            component_separators = '|',
            section_separators = '',
        },
        sections = {
            lualine_x = { lsp_status },
            lualine_y = { python_env, lsp_info, 'filetype' },
            lualine_z = {'location'}
        },
    },
}
