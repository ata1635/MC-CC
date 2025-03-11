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
        turtle.dropDown()
        sleep(0,5)
    end
end

local stopRequested = false
rednet.send(9, "active")
print("active message sent")

repeat
    suck()
    turtle.down()
    drop("minecraft:bone")
    turtle.down()
    drop("minecraft:bone")
    turtle.down()
    drop("minecraft:arrow")
    turtle.down() 
    drop("minecraft:glowstone_dust")
    drop("minecraft:potion")
    drop("minecraft:redstone_dust")
    dropAll()
    turtle.up()
    turtle.up()
    turtle.up()
    turtle.up()
    print("receiving")
	local id, message = rednet.receive(180)
	if message == "stop" then
	    print(message)
		stopRequested = true
		break
	end
until stopRequested

rednet.send(9, "inactive")
print("inactive message sent return to startup")
print("returning to startup")
shell.run("startup")

  
