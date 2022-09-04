-- [[
-- Status bar for the avarice theme
-- ]]
local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local x = beautiful.xresources.get_current_theme()
local dpi = beautiful.xresources.apply_dpi

local text = require("common.text")
local command = require("common.command")

local create_button = function (symbol, color, bg_color, hover_color)
    local widget = wibox.widget {
        font = "icomoon 14",
        align = "center",
        id = "text_role",
        valign = "center",
        markup = text.colorize_text(symbol, color),
        widget = wibox.widget.textbox()
    }

    local section = wibox.widget {
        widget,
        forced_width = dpi(70),
        bg = bg_color,
        widget = wibox.container.background
    }

    -- Hover animation
    section:connect_signal("mouse::enter", function ()
        section.bg = hover_color
    end)
    section:connect_signal("mouse::leave", function ()
        section.bg = bg_color
    end)

    -- helpers.add_hover_cursor(section, "hand1")

    return section
end

local volume_symbol = "🔊"
local volume_muted_color = x.color8
local volume_unmuted_color = x.color5
local volume = create_button(volume_symbol, volume_unmuted_color, x.color8.."30", x.color8.."50")

volume:buttons(gears.table.join(
    -- Left click - Mute / Unmute
    awful.button({ }, 1, function ()
        command.toggle_mute()
    end),
    -- Right click - Run or raise volume control client
--    awful.button({ }, 3, apps.volume),
    -- Scroll - Increase / Decrease volume
    awful.button({ }, 4, function ()
        command.increment_volume(5)
    end),
    awful.button({ }, 5, function ()
        command.increment_volume(-5)
    end)
))


awesome.connect_signal("evil::volume", function(_, muted)
    local t = volume:get_all_children()[1]
    if muted then
        t.markup = helpers.colorize_text(volume_symbol, volume_muted_color)
    else
        t.markup = helpers.colorize_text(volume_symbol, volume_unmuted_color)
    end
end)

awful.screen.connect_for_each_screen(function(s)
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))

    -- Wibar
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, tasklist_buttons)

    s.mywibox = awful.wibar({screen = s, visible = true, ontop = true, type = "dock", position = beautiful.wibar_position})
    s.mywibox:setup {
        -- expand = "none",
        layout = wibox.layout.align.horizontal,
        height = beautiful.wibar_height,
	    -- Left widgets
	    {
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist
        },
	    -- Middle widgets
        s.mytasklist,
	    -- Right Widgets
        {
            layout = wibox.layout.fixed.horizontal,
            volume,
	        wibox.widget.systray(),
	        wibox.widget.textclock(),
            s.mylayoutbox
        }
    }
end)
