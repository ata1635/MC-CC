rednet.open("right")
print("in Startup")
while true do    
    local id, message = rednet.receive()
    if message == "start" then
        print(message)
        shell.run("attack")
    end
    os.sleep(0)
end
