local forwardTimes = 9
local rotateTimes = 9

while true do
    if not redstone.getInput("left") then
        sleep(0.5)
        goto continue
    end

    if turtle.getFuelLevel() < 1000 then
        if turtle.suckDown() then
            turtle.refuel()
        end

        turtle.turnLeft()
        turtle.drop()
        turtle.turnRight()
    end

    turtle.up()
    turtle.forward()

    function recolect()
        local success, data = turtle.inspectDown()

        if success then
            if data.name == "minecraft:melon" then
                turtle.digDown()
            end

            if data.name == "minecraft:pumpkin" then
                turtle.digDown()
            end
        end
    end

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
