local lsp = vim.lsp
local definition_feature = lsp.protocol.Methods.textDocument_definition

local M = {}

-- get all valid clients for definition
--- @param buffer_id integer
--- @return lsp.Client[]|nil clients array or nil
M.get_clients = function(buffer_id)
    local clients =
        lsp.get_clients({ bufnr = buffer_id, method = definition_feature })
    if vim.tbl_isempty(clients) then
        return nil
    end
    return clients
end

-- make request param
-- TODO: implement `WorkDoneProgressParams` and `PartialResultParams`
--
--- @param window_id integer
--- @return lsp.TextDocumentPositionParams
--- @see https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#definitionParams
M.make_params = function(window_id)
    local params = lsp.util.make_position_params(window_id)
    return params
end

return M