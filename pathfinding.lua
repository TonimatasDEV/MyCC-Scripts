if #arg < 3 then
    print("Incorrect arguments. Please use: ")
    print("program <x> <y> <z>")
    return
end

local xToGo = arg[1]
local yToGo = arg[2]
local zToGo = arg[3]
print(xToGo, yToGo, zToGo)
local direction = "none"

if turtle.getFuelLevel() < 5 then
    print("You need more fuel.")
    return
end

function setDirection()
    local x, y, z = gps.locate()
    turtle.forward()
    local newX, newY, newZ = gps.locate()
    turtle.back()

    local dx = newX - x
    local dz = newZ - z

    if dx == 1 then
        direction = "east"
    elseif dx == -1 then
        direction = "west"
    elseif dz == 1 then
        direction = "south"
    elseif dz == -1 then
        direction = "north"
    else
        direction = "unknown"
    end
end

setDirection()

print(direction)