local api = vim.api
local command = require("lspui.command")
local config = require("lspui.config")
local lib_debug = require("lspui.lib.debug")
local lib_notify = require("lspui.lib.notify")
local pos_abstract = require("lspui.pos_abstract")
local util = require("lspui.declaration.util")
local M = {}
-- whether this module is initialized
local is_initialized = false

M.init = function()
    if not config.options.declaration.enable then
        return
    end

    if is_initialized then
        return
    end

    is_initialized = true

    -- TODO: de-comment this
    if config.options.declaration.command_enable then
        command.register_command("declaration", M.run, {})
    end
end

M.run = function()
    if not config.options.declaration.enable then
        lib_notify.Info("declaration is not enabled!")
        return
    end
    -- get current buffer
    local current_buffer = api.nvim_get_current_buf()

    local clients = util.get_clients(current_buffer)
    if clients == nil then
        lib_notify.Warn("no client supports declaration!")
        return
    end

    -- get current window
    local current_window = api.nvim_get_current_win()

    local params = util.make_params(current_window)

    pos_abstract.go(
        pos_abstract.method.declaration,
        current_buffer,
        current_window,
        clients,
        params
    )
end

return M