
x = 15
y = 8
z = 38

right = true
for i = 1, y, 1 do
    for j = 1, z, 1 do
        for k = 1, x, 1 do
            turtle.dig()
            turtle.forward()
        end
    
        if right then
            turtle.turnRight()
            turtle.dig()
            turtle.forward()
            turtle.turnRight()
            right = false
        else
            turtle.turnLeft()
            turtle.dig()
            turtle.forward()
            turtle.turnLeft()
            right = true
        end
    end
    if turtle.detectUp then
        turtle.digUp()
    end
    turtle.up()
    right = not right
end
