columns = 38
rows = 24
finishedRows = 0

function returnChest()
    turtle.turnLeft()

    for i = 1, finishedRows * 2 do
        turtle.forward()
    end

    turtle.turnLeft()

    for i = 1, columns * 2 + 1 do
        turtle.forward()
    end

    turtle.turnLeft()
    turtle.forward()
    turtle.forward()
end

function refillMaterials()
    turtle.turnRight()
    turtle.forward()
    turtle.turnRight()
    turtle.forward()
    turtle.forward()
    turtle.turnRight()
    turtle.turnRight()
    
    for i = 1, 5 do
        turtle.select(i)
        turtle.suckDown(64 - turtle.getItemCount(i))
        
        if i ~= 5 then
            turtle.forward()
        end
    end
    
    turtle.turnRight()
    turtle.turnRight()
    turtle.forward()
    turtle.forward()
    turtle.turnRight()
    turtle.forward()
    turtle.turnRight()
end

function prepareForNextRow()
    for i = 1, finishedRows * 2 do
        turtle.forward()
    end

    turtle.turnLeft()
end

placeFence = true

function doCactusFarm()
    turtle.forward()
    turtle.select(2) -- Stone Bricks
    turtle.turnLeft()
    turtle.place()
    turtle.up()
    turtle.select(3) -- Sand
    turtle.place()
    turtle.up()
    turtle.forward()
    turtle.up()
    turtle.select(4) -- Cactus
    turtle.placeDown()
    turtle.turnRight()
    turtle.turnRight()
    turtle.forward()
    turtle.turnLeft()
    turtle.forward()
    turtle.turnLeft()
    turtle.select(5) -- Fence
    
    if placeFence then
        turtle.place()
        placeFence = false
    else
        placeFence = true
    end

    turtle.turnRight()
    turtle.down()
    turtle.down()
    turtle.down()
end

for i = 1, rows do -- Rows
    turtle.select(1)
    turtle.refuel(64)
    turtle.forward()

    for i = 1, columns do -- Columns
        doCactusFarm()
    end
    
    finishedRows = finishedRows + 1
    returnChest()
    refillMaterials()
    prepareForNextRow()
end