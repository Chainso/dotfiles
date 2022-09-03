local text = {}

text.colorize_text = function(text, color)
    return "<span foreground='"..color.."'>"..text.."</span>"
end

return text
