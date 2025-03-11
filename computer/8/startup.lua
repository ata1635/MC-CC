local dispenser = peripheral.find("minecraft:dispenser")
local item = dispenser.getItemDetail(1)

if item.name == "minecraft:bucket" then
    redstone.setOutput("front", true)
    os.sleep(0.5)
    redstone.setOutput("front", false)
end 

rednet.open("top")
print("in Startup")
while true do    
    local id, message = rednet.receive()
    if message == "start" then
        print(message)
        shell.run("mobFlusher")
    end
end
