turtle.refuel(64)
turtle.forward()
for i = 1, 38 do
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
    turtle.select(5) -- Cactus
    turtle.placeDown()
    turtle.turnRight()
    turtle.turnRight()
    turtle.forward()
    turtle.turnLeft()
    turtle.forward()
    turtle.turnLeft()
    turtle.select(4) -- Fence
    turtle.place()
    turtle.turnRight()
    turtle.down()
    turtle.down()
    turtle.down()
end