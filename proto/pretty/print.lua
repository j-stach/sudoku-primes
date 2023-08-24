
local digits = require("digits")
local colors = require("pretty/colors")

function generateMatrix(base)    
    local zenith = nil
    
    -- Sets zenith if the base is supported by digit table
    local maxDigit = maxDigit()
    if base <= maxDigit + 1 then
        zenith = base - 1
    else
        print("Error, digit table doesn't support these dimensions")
        return
    end

    local rows = zenith
    local cols = zenith
    -- Creates a multiplication matrix 
    local sumMatrix = {}
    for y = 1, rows do
        sumMatrix[y] = {}
        for x = 1, cols do
            -- takes the digitsum of each product
            sumMatrix[y][x] = digitSum(x * y, base)
        end
    end  
    return sumMatrix
end

function printMatrix(sumMatrix)
    local zenith = 0
    for _ in pairs(sumMatrix) do zenith = zenith + 1 end
    local gradient = rainbowGradient(zenith)
    for y, row in pairs(sumMatrix) do
        for x, element in pairs(row) do
            local index = getIndex(element)
            local color = gradient[index]
            io.write(color..element..' ')
        end
        io.write('\n')
    end
end
printMatrix(generateMatrix(13))

