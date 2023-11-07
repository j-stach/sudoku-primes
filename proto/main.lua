local pretty = require("pretty/print")
local digits = require("digits")

-- CLI
local base = tonumber(arg[1])

printMatrix(generateMatrix(base))

-- TODO: Options 
-- print monochrome
-- print greyscale
-- print blurred ("#")
-- print bg block w/ or w/o numbers
-- highlight regions
-- trim "zenith" border
-- even out color gradient, move red to 1
