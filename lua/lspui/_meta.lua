--- @class lspui_rename_config
--- @field enable boolean? whether enable `rename` module
--- @field command_enable boolean? whether enable command for `rename`
--- @field auto_select boolean? whether select all string in float window
--- @field key_binding { exec: string?, quit: string? }? keybind for `rename`

--- @class lspui_lightbulb_config
--- @field enable boolean? whether enable `lightbulb` module
--- @field is_cached boolean? whether enable cache
--- @field icon string? icon for lightbulb
--- @field debounce (integer|boolean)? whether enable debounce for lightbulb ? defalt is 250 milliseconds, this will reduce calculations when you move the cursor frequently, but it will cause the delay of lightbulb, false will diable it

--- @class lspui_code_action_config
--- @field enable boolean? whether enable `code_action` module
--- @field command_enable boolean? whether enable command for `lightbulb`
--- @field gitsigns boolean? whether enable gitsigns support?
--- @field key_binding { exec: string?, prev: string?, next: string?, quit: string? }? keybind for `code_action`

--- @class lspui_diagnostic_config
--- @field enable boolean? whether enable `diagnostic` module
--- @field command_enable boolean? whether enable command for `diagnostic`

--- @class lspui_hover_config
--- @field enable boolean? whether enable `hover` module
--- @field command_enable boolean? whether enable command for `hover`
--- @field key_binding { prev: string?, next: string?, quit: string? }? keybind for `hover`

--- @class lspui_inlay_hint_config
--- @field enable boolean? whether enable `inlay_hint` module

-- this is just for some keybind like definition, type definition, declaration, reference, implementation
--- @alias lspui_pos_keybind_config { secondary: { jump: string?, quit:string?, hide_main:string?, enter: string? }?, main: { back: string?, hide_secondary: string? }? }

--- @class lspui_definition_config
--- @field enable boolean? whether enable `definition` module
--- @field command_enable boolean? whether enable command for `definition`

--- @class lspui_type_definition_config
--- @field enable boolean? whether enable `definition` module
--- @field command_enable boolean? whether enable command for `definition`

--- @class lspui_declaration_config
--- @field enable boolean? whether enable `definition` module
--- @field command_enable boolean? whether enable command for `definition`

--- @class lspui_implementation_config
--- @field enable boolean? whether enable `definition` module
--- @field command_enable boolean? whether enable command for `definition`

--- @class lspui_reference_config
--- @field enable boolean? whether enable `definition` module
--- @field command_enable boolean? whether enable command for `definition`

--- @class lspui_config config for lspui
--- @field rename lspui_rename_config? `rename` module
--- @field lightbulb lspui_lightbulb_config? `lightbulb` module
--- @field code_action lspui_code_action_config? `code_action` module
--- @field diagnostic lspui_diagnostic_config? `diagnostic` module
--- @field hover lspui_hover_config? `hover` module
--- @field inlay_hint lspui_inlay_hint_config? `inlay_hint` module
--- @field definition lspui_definition_config? `definition` module
--- @field type_definition lspui_type_definition_config? `type_definition` module
--- @field declaration lspui_declaration_config? `declaration` module
--- @field implementation lspui_implementation_config? `implementation` module
--- @field reference lspui_reference_config? `reference` module
--- @field pos_keybind lspui_pos_keybind_config? keybind for `definition`, `type definition`, `declaration`, `reference`, implementation