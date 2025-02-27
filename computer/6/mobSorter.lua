function suck()
    for i = 1,16 do
        turtle.select(i)
        turtle.suckUp()	
    end    
end 

function drop(x)
    for i = 1,16 do
        turtle.select(i)
        details = turtle.getItemDetail()
        if details and details.name == x then
            turtle.drop()
            sleep(0,5)
        end
    end
end

function dropAll()
    for i = 1,16 do
	turtle.select(i)
        turtle.drop()
        sleep(0,5)
    end
end

while true do
    turtle.turnLeft()
    suck()
    turtle.forward()
    suck()
    turtle.forward()
    suck()
    turtle.turnRight()
    turtle.down()
    drop("minecraft:bone")
    turtle.down()
    drop("minecraft:arrow")
    turtle.down()
    drop("minecraft:gunpowder")
    turtle.down() 
    drop("minecraft:glowstone_dust")
    turtle.turnRight()
    turtle.forward()
    turtle.forward()
    turtle.turnLeft()
    drop("minecraft:potion")
    turtle.turnRight()
    dropAll()
    turtle.turnLeft()
    turtle.up()
    turtle.up()
    turtle.up()
    turtle.up()
    sleep(180)
end

  
