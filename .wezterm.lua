-- ============================================================================
-- WezTerm Configuration
-- ============================================================================

-- 1. Load the WezTerm API
local wezterm = require 'wezterm'

-- ============================================================================
-- Events & Integrations (Must be defined BEFORE the config block)
-- ============================================================================

-- Zen Mode Integration (e.g., for Neovim's ZenMode plugin)
-- Listens for the 'ZEN_MODE' user variable and adjusts UI accordingly.
wezterm.on('user-var-changed', function(window, pane, name, value)
    local overrides = window:get_config_overrides() or {}
    
    if name == "ZEN_MODE" then
        local incremental = value:find("+")
        local number_value = tonumber(value)
        
        if incremental ~= nil then
            -- Increment font size
            while (number_value > 0) do
                window:perform_action(wezterm.action.IncreaseFontSize, pane)
                number_value = number_value - 1
            end
            -- Hide tab bar in Zen Mode
            overrides.enable_tab_bar = false
            
        elseif number_value < 0 then
            -- Reset font size and restore UI
            window:perform_action(wezterm.action.ResetFontSize, pane)
            overrides.font_size = nil
            overrides.enable_tab_bar = true
            
        else
            -- Set absolute font size
            overrides.font_size = number_value
            overrides.enable_tab_bar = false
        end
    end
    
    -- Apply the overrides
    window:set_config_overrides(overrides)
end)

-- ============================================================================
-- Core Configuration
-- ============================================================================

-- 3. Initialize the configuration builder
local config = wezterm.config_builder()

config.automatically_reload_config = true

-- Default domain: Connect directly to the Ubuntu WSL instance natively.
-- This ensures proper process management and prevents zombie processes.
config.default_domain = 'WSL:Ubuntu'
config.font_size = 11.0  -- default is 12.0

config.front_end = 'WebGpu'
--config.front_end = 'OpenGL'
config.webgpu_power_preference = 'HighPerformance'
--config.animation_fps = 1
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
config.enable_kitty_graphics = false

config.colors = {
  foreground = '#e8e8e8',
}

config.default_cursor_style = 'SteadyBlock'

local act = wezterm.action
config.keys = {
  -- Let C-M-% fall through to the terminal app (Emacs query-replace-regexp)
  { key = '%', mods = 'CTRL|SHIFT|ALT', action = act.DisableDefaultAssignment },
}

-- config.default_cursor_style = 'BlinkingBlock'  -- ἢ BlinkingBar
-- config.cursor_blink_rate = 500                 -- ms (default 800)
config.animation_fps = 1
-- config.cursor_blink_ease_in = 'Constant'
-- config.cursor_blink_ease_out = 'Constant'

config.enable_kitty_keyboard = true
-- Keep this off (its default); if enabled it takes precedence over KKP.
config.enable_csi_u_key_encoding = false

-- ============================================================================
-- Return Configuration
-- ============================================================================

-- 4. Return the configuration object to WezTerm (MUST BE AT THE END)
return config
