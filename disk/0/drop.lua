local stopRequested = false
os.sleep(1)
rednet.send(9, "active")

repeat
    turtle.drop()
    local id, message = rednet.receive(0.3)
    if message == "stop" then
        print(message)
        stopRequested = true
        break
    end 
until stopRequested

rednet.send(9, "inactive")
shell.run("startup") 

