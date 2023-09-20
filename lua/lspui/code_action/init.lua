local api = vim.api
local command = require("lspui.command")
local config = require("lspui.config")
local lib_notify = require("lspui.lib.notify")
local util = require("lspui.code_action.util")

local M = {}

-- whether this module is initialized
local is_initialized = false

-- init for code action
M.init = function()
    if not config.options.code_action.enable then
        return
    end

    if is_initialized then
        return
    end

    is_initialized = true

    if config.options.code_action.command_enable then
        command.register_command("code_action", M.run, {})
    end
end

-- run for acode action
M.run = function()
    if not config.options.code_action.enable then
        lib_notify.Info("code_sction is not enabled!")
        return
    end
    -- get current buffer
    local current_buffer = api.nvim_get_current_buf()

    -- get all valid clients which support code action, if return nil, that means no client
    local clients = util.get_clients(current_buffer)
    if clients == nil then
        lib_notify.Warn("no client supports code_action!")
        return
    end

    local params, is_visual = util.get_range_params(current_buffer)

    util.get_action_tuples(
        clients,
        params,
        current_buffer,
        is_visual,
        function(action_tuples)
            util.render(action_tuples)
        end
    )
end

return M