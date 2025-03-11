local stopRequested = false
os.sleep(1)
rednet.send(9, "active")

repeat
    redstone.setOutput("front", true)
    print("listening")
    local id, message = rednet.receive(9)
        if message == "stop" then
            print(message)
            stopRequested = true
            break
        end
    redstone.setOutput("front", false)
    print("listening")
    local id, message = rednet.receive(9)
        if message == "stop" then
            print(message)
            stopRequested = true
            break
        end
until stopRequested

rednet.send(9, "inactive")
shell.run("startup") 
