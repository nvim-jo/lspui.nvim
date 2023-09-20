local lib_notify = require("lspui.lib.notify")

return {
    -- init `lspui` plugin
    --- @param user_config lspui_config? user's plugin config
    setup = function(user_config)
        if vim.fn.has("nvim-0.10") == 1 then
            local command = require("lspui.command")
            local config = require("lspui.config")
            local modules = require("lspui.modules")

            config.setup(user_config)
            command.init()
            for _, module in pairs(modules) do
                module.init()
            end
        else
            lib_notify.Warn(
                "The version of neovim needs to be at least 0.10!! you can use branch legacy"
            )
        end
    end,
    api = vim.fn.has("nvim-0.10") == 0 and {} or require("lspui.api"),
}