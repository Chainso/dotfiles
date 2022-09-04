local awful = require("awful")

local command = {}

command.increment_volume = function(increment)
    local sign = (increment >= 0 and "+") or ""
    local increment_volume_script = "pactl set-sink-volume @DEFAULT_SINK@ " .. sign .. increment .. "%"

    awful.spawn.with_shell(increment_volume_script)
end

command.toggle_mute = function()
    local toggle_mute_script = "pactl set-sink-mute @DEFAULT_SINK@ toggle"
    awful.spawn.with_shell(toggle_mute_script)
end

return command
