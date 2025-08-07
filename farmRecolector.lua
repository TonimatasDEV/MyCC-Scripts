local forwardTimes = 9
local rotateTimes = 9
local replant = true
local maxAge = 7
local block = "minecraft:potatoes"
local hasSeed = false
local seed = "seed"


function isEmpty()
    for i = 1, 16 do
        turtle.select(i)
        local item = turtle.getItemDetail()

        if item then
            return false
        end
    end

    return true
end

function selectSeedItem()
    for i = 1, 16 do
        turtle.select(i)
        local item = turtle.getItemDetail()

        if item then
            if item.name == seed then
                break
            end
        end
    end
end

function recolect()
    local success, data = turtle.inspectDown()

    if success then
        if data.name == block then
            local age = tonumber(data.state.age)
            if age == maxAge then
                turtle.digDown()

                if replant then
                    if hasSeed then
                        selectSeedItem()
                    end

                    turtle.placeDown()
                end
            end
        end
    end
end

while true do
    local success, data = turtle.inspect()

    if success then
        if data.name == block then
            local age = tonumber(data.state.age)

            if age < maxAge or not isEmpty() then
                sleep(30)
                goto continue
            end
        end
    else
        goto continue
    end

    if turtle.getFuelLevel() < 1000 then
        if turtle.suckDown() then
            turtle.refuel()
        else
            sleep(10)
            goto continue
        end

        turtle.turnLeft()
        turtle.drop()
        turtle.turnRight()
    end

    turtle.up()
    turtle.forward()

    local forward = true

    for i = 1, rotateTimes do
        for i = 1, forwardTimes - 1 do
            recolect()
            turtle.forward()
        end

        recolect()

        if forward then
            turtle.turnLeft()
            turtle.forward()
            turtle.turnLeft()
            forward = false
        else
            turtle.turnRight()
            turtle.forward()
            turtle.turnRight()
            forward = true
        end
    end

    for i = 1, forwardTimes do
        turtle.forward()
    end

    turtle.turnLeft()


    for i = 1, rotateTimes do
        turtle.forward()
    end

    turtle.turnLeft()
    turtle.down()

    turtle.turnLeft()
    for i = 1, 16 do
        turtle.select(i)
        turtle.drop()
    end

    turtle.select(1)
    turtle.turnRight()
    ::continue::
end
