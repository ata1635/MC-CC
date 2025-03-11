function drop()
    for i = 1,16 do
        turtle.select(i)
        turtle.dropDown()
    end    
end

local stopRequested = false
os.sleep(1)
rednet.send(9, "active")

repeat
    for i = 1, 500 do
        turtle.attack()
        local id, message = rednet.receive(0.3)
        if message == "stop" then
            print(message)
            stopRequested = true
            break
        end    
    end
    drop()
until stopRequested
rednet.send(9, "inactive")
shell.run("startup") 
