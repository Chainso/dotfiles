-- [[
-- Provides:
--
-- widgets::volume
--  volume percentage (int)
--  if volume is muted (boolean)
--
--
-- ]]
local awful = require("awful")

local volume = -1
local muted = false

local current_audio_sink_info_script = [[sh -c "pactl list sinks | awk \"/Name:$(pactl info | grep 'Default Sink' | cut -d':' -f 2)/,/\n/\""]]

local function emit_volume_info()
    awful.spawn.easy_async_with_shell(current_audio_sink_info_script, function(audio_sink_info)
        local new_volume = audio_sink_info:match('(%d+)%% /')
        local new_volume_int = tonumber(volume)

        local new_muted = audio_sink_info:match('Mute:[yes]')
        local new_muted_bool = (muted and true) or false

        if volume ~= new_volume_int or muted ~= new_muted then
            volume = new_volume_int
            muted = new_muted_bool

            awesome.emit_signal("widget::volume", volume, muted)
        end
    end)
end

emit_volume_info()

local audio_sink_subscriber = [[sh -c "pactl subscribe 2>/dev/null | grep --line-buffered \"Event 'change' on sink #\"]]

awful.spawn.easy_async({"pkill", "--full", "--uid", os.getenv("USER"), "^pactl subscribe"}, function ()
    awful.spawn.with_line_callback(audio_sink_subscriber, {
        stdout = function(line)
            emit_volume_info()
        end
    })
end)

