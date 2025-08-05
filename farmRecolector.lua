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
        if data.name == "minecraft:potatoes" then
            local age = tonumber(data.state.age)
            if age == 7 then
                turtle.digDown()
                turtle.placeDown()
            end
        end
    end
end

local forward = true

for i = 1, 9 do
    for i = 1, 8, 1 do
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

for i = 1, 9 do
    turtle.forward()
end

turtle.turnLeft()


for i = 1, 9 do
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