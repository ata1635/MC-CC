while true do
    turtle.digUp()
    turtle.up()
    turtle.dig()
    turtle.forward()
    if turtle.detect() then
        while turtle.detect() do
            turtle.dig()
            turtle.digUp()
            turtle.up()
        end
        while not turtle.detectDown() do
            turtle.down()
            if turtle.detectDown() then
                break
            end
        end
        turtle.dig()
        turtle.place()
        turtle.up()
    end
    turtle.back()
    turtle.down()
    for i=1,6 do
        rs.setOutput("back", true)
        os.sleep(0.1)
        rs.setOutput("back",false)
        turtle.suck()
        turtle.suckUp()
        os.sleep(5)
    end    
end
