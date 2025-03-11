rednet.open("right")
turtle.up()
turtle.up()
turtle.up()
turtle.up()
print("in Startup")
while true do
    local id, message = rednet.receive()
    if message == "start" then
	print(message)
        shell.run("mobSorter")
    end
end
