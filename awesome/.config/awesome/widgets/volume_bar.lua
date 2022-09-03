-- [[
--  A volume bar widget
-- ]]
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

-- Default colors
local active_color = "#5AA3CC"
local muted_color = "#666666"
local active_background_color = "#222222"
local muted_background_color = "#222222"

-- Set colors
if beautiful.volume_bar ~= nil then
    active_color = beautiful.volume_bar.active_color or active_color
    muted_color = beautiful.volume_bar.muted_color or muted_color
    active_background_color = beautiful.volume_bar_active_background_color or active_background_color
    muted_background_color = beautiful.volume_bar_muted_background_color or muted_background_color
end

local volume_bar = wibox.widget({
    max_value     = 100,
    value         = 50,
    forced_height = dpi(10),
    margins       = {
        top = dpi(8),
        bottom = dpi(8),
    },
    forced_width  = dpi(200),
    shape         = gears.shape.rounded_bar,
    bar_shape     = gears.shape.rounded_bar,
    color         = active_color,
    background_color = active_background_color,
    border_width  = 0,
    border_color  = beautiful.border_color,
    widget        = wibox.widget.progressbar,
})

awesome.connect_signal("signal::volume", function(volume, muted)
    local fill_color
    local bg_color
    
    if muted then
        fill_color = muted_color
        bg_color = muted_background_color
    else
        fill_color = active_color
        bg_color = active_background_color
    end

    volume_bar.value = volume
    volume_bar.color = fill_color
    volume_bar.background_color = bg_color
end)

return volume_bar

