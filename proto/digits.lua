
-- This file holds information about the expandable number type

-- The term "Zenith" is used below to describe the highest single-digit
-- value within the decimal system for a given numeric base

-- later map dynaminally, new types?
function digits()
    local digits = {}
    digits[1 ] = "1"
    digits[2 ] = "2"
    digits[3 ] = "3"
    digits[4 ] = "4"
    digits[5 ] = "5"
    digits[6 ] = "6"
    digits[7 ] = "7"
    digits[8 ] = "8"
    digits[9 ] = "9"
    digits[10] = "A"
    digits[11] = "B"
    digits[12] = "C"
    digits[13] = "D"
    digits[14] = "E"
    digits[15] = "F"
    digits[16] = "G"
    digits[17] = "H"
    digits[18] = "I"
    digits[19] = "J"
    digits[20] = "K"
    digits[21] = "L"
    digits[22] = "M"
    digits[23] = "N"
    digits[24] = "O"
    digits[25] = "P"
    digits[26] = "Q"
    digits[27] = "R"
    digits[28] = "S"
    digits[29] = "T"
    digits[30] = "U"
    digits[31] = "V"
    digits[32] = "W"
    digits[33] = "X"
    digits[34] = "Y"
    digits[35] = "Z"
    return digits
end

-- Obtains the maximum conversion key
function maxDigit()
    local maxDigit = nil
    local digits = digits()
    for key, _ in pairs(digits) do
        if not maxDigit or key > maxDigit then
            maxDigit = key
        end
    end
    return maxDigit
end

-- Coverts representation of number to expanded form
function expand(num)
    local maxDigit = maxDigit()
    local digits = digits()
    if num == 0 then return 0 end
    if num > maxDigit then
        print("Error, attempted to convert number not stored in table")
        return
    else 
        return digits[num]
    end
end

--print(expand(32)) -- Should be "W"
--print("Expect error:")
--print(expand(69)) -- Should fail

-- Converts number to new base, using expanded form, summing the digits
function digitSum(num, base)
    local maxDigit = maxDigit(digits)
    if base > maxDigit then
        print("Error, chosen base not supported by conversion table")
        return
    end
    local zenith = base - 1
    local mod = num
    if num > zenith then
        mod = num % zenith
    end
    if mod == 0 then mod = zenith end
    local sum = expand(mod)
    return sum
end

--print(digitSum(9, 27)) -- Should be "9"
--print(digitSum(15, 27)) -- Should be "F"
--print(digitSum(27, 9)) -- Should be "0"
--print("Expect error:")
--print(digitSum(420, 247)) -- Should fail

-- Converts an expanded number back to base 10 (the index val)
-- rename to align with expand?
function getIndex(digit)
    for key, val in ipairs(digits()) do
        if val == digit then
            return key
        end
    end
    return nil
end

--print(getIndex(W)) -- Should be "32"
--print("Expect error:")
--print(getIndex(69)) -- Should fail


