-- This script is for adding a splash of color to your matrix

local digits = require("digits")

-- Creates an ANSI color code string from RGB
function newColor(r, g, b)
    return "\27[38;5;"..(
        16 +        -- Add 16 to skip the old ANSI colors
        36 * r +    -- Red influence
         6 * g +    -- Green influence
             b      -- Blue influence
    ).."m"  
end

-- Creates a rainbow color gradient scaled to the zenith digit
function rainbowGradient(zenith)
    -- TODO "I need my own function!" checkZenith
    local maxDigit = maxDigit(digits)
    if zenith > maxDigit then
        print("Error, chosen base not supported by conversion table")
        return
    end

    -- 30 steps total using rainbowGradient
    if zenith > 30 then 
        print("Sorry, Roy G. Biv can't color more than 30 digits..."..
        " and even that's pushing it.")
        return
    end

    -- Divide total steps by zenith to get gradient step size
    -- Round down for each so there's no overlap
    local gradientStep = math.floor(30 / zenith)

    local gradient = {} -- empty gradient

    -- Default RGB values
    local r = 5 --Standing by
    local g = 0 
    local b = 0

    -- Color adjustment functions
    function redUp()  if r < 5 then r = r + 1 end  end
    function redDn()  if r > 0 then r = r - 1 end  end
    function grnUp()  if g < 5 then g = g + 1 end  end
    function grnDn()  if g > 0 then g = g - 1 end  end
    function bluUp()  if b < 5 then b = b + 1 end  end
    function bluDn()  if b > 0 then b = b - 1 end  end

    -- Navigate the raw gradient in steps
    progress = 0
    function makeProgress()
        if     progress <  5 then do grnUp() end 
        elseif progress < 10 then do redDn() end
        elseif progress < 15 then do bluUp() end
        elseif progress < 20 then do grnDn() end
        elseif progress < 25 then do redUp() end
        elseif progress < 30 then do bluDn() end
        end
        progress = progress + 1
    end
    
    -- Calc & populate the rest of the gradient   
    for gs = 1, zenith do
        gradient[gs] = newColor(r, g, b)
        goal = progress + gradientStep
        while progress < goal do makeProgress() end
    end

    return gradient
end

--local gradient = rainbowGradient(30)
--for c, color in ipairs(gradient) do io.write(color, expand(c)) end

