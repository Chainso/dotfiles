-- [[
-- Drawing utilities
-- ]]

local gears = require("gears")

local drawing = {}

-- [[ Shapes ]]
drawing.rounded_rect = function(radius)
    return function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, radius)
    end
end

drawing.prrect = function(radius, tl, tr, br, bl)
    return function(cr, width, height)
        gears.shape.partially_rounded_rect(cr, width, height, tl, tr, br, bl, radius)
    end
end

drawing.squircle = function(rate, delta)
    return function(cr, width, height)
        gears.shape.squircle(cr, width, height, rate, delta)
    end
end

drawing.psquircle = function(rate, delta, tl, tr, br, bl)
    return function(cr, width, height)
        gears.shape.partial_squircle(cr, width, height, tl, tr, br, bl, rate, delta)
    end
end

return drawing
