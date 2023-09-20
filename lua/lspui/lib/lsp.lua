local lsp, api = vim.lsp, vim.api

local lib_notify = require("lspui.lib.notify")

local M = {}

-- check whether there is an active lsp client
-- note: this function now should not be called!!
--- @param is_notify boolean whether notify, default not
--- @return boolean
M.is_lsp_active = function(is_notify)
    is_notify = is_notify or false
    local current_buf = api.nvim_get_current_buf()

    local clients = lsp.get_clients({
        bufnr = current_buf,
    })

    if vim.tbl_isempty(clients) then
        if is_notify then
            local message = string.format(
                "not found lsp client on this buffer, id is %d",
                current_buf
            )
            lib_notify.Warn(message)
        end
        return false
    end
    return true
end

-- format and complete diagnostic default option,
-- this func is referred from
-- https://github.com/neovim/neovim/blob/master/runtime/lua/vim/lsp/diagnostic.lua#L138-L160
--- @param diagnostics lsp.Diagnostic[]
--- @return lsp.Diagnostic[]
M.diagnostic_vim_to_lsp = function(diagnostics)
    ---@diagnostic disable-next-line:no-unknown
    return vim.tbl_map(function(diagnostic)
        ---@cast diagnostic Diagnostic
        return vim.tbl_extend("keep", {
            -- "keep" the below fields over any duplicate fields
            -- in diagnostic.user_data.lsp
            range = {
                start = {
                    line = diagnostic.lnum,
                    character = diagnostic.col,
                },
                ["end"] = {
                    line = diagnostic.end_lnum,
                    character = diagnostic.end_col,
                },
            },
            severity = type(diagnostic.severity) == "string"
                    and vim.diagnostic.severity[diagnostic.severity]
                or diagnostic.severity,
            message = diagnostic.message,
            source = diagnostic.source,
            code = diagnostic.code,
        }, diagnostic.user_data and (diagnostic.user_data.lsp or {}) or {})
    end, diagnostics)
end

return M