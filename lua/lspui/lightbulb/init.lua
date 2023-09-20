local config = require("lspui.config")
local lib_notify = require("lspui.lib.notify")
local util = require("lspui.lightbulb.util")

local M = {}

--- note: lightbulb depends on code_action

-- whether this module has initialized
local is_initialized = false

-- init for lightbulb
M.init = function()
    if not config.options.lightbulb.enable then
        return
    end

    if is_initialized then
        return
    end

    is_initialized = true

    -- register sign, should only be called once
    util.register_sign()

    util.autocmd()
end

-- run for lightbulb
M.run = function()
    lib_notify.Info("lightbulb has no run func")
end

-- deinit for lightbulb
M.deinit = function()
    if not is_initialized then
        return
    end

    util.unregister_sign()
    util.un_autocmd()

    is_initialized = false
end

return M