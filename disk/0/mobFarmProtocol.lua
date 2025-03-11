local speaker = peripheral.find("speaker")
local monitor = peripheral.find("monitor")
local mouseWidth = 0
local mouseHeight = 0
local onButton = true
local offButton = false

function drawButtons(color1, color2)
    monitor.setCursorPos(2,2)
    monitor.setBackgroundColor(color1)
    monitor.write(" ON  ")
    monitor.setBackgroundColor(colors.black)

    monitor.setCursorPos(2,4)
    monitor.setBackgroundColor(color2)
    monitor.write(" OFF ")
    monitor.setBackgroundColor(colors.black)
end

function turnPixelsYellow()
    turtles(0,"Attacker",colors.yellow)
    turtles(1,"Sorter",colors.yellow)
    turtles(2,"Dropper",colors.yellow)
    turtles(3,"Flusher",colors.yellow)
end

function checkClickPosition()
    if mouseWidth > 1 and mouseWidth < 8 and mouseHeight == 2 and onButton then
        onButton = false
        offButton = true
        speaker.playSound("block.stone_button.click_on")
        drawButtons(colors.lime, colors.lightGray)
        turnPixelsYellow()
        parallel.waitForAll(
        function() send(3,"start","active",10) end,
        function() send(4,"start","active",5) end,
        function() send(8,"start","active",5) end,
        function() send(6,"start","active",30) end
        )
    elseif mouseWidth > 1 and mouseWidth < 8 and mouseHeight == 4 and offButton then
        offButton = false
        onButton = true
        drawButtons(colors.lightGray, colors.red)
        speaker.playSound("block.stone_button.click_off")
        turnPixelsYellow()
        parallel.waitForAll(
        function() send(3,"stop","inactive",10) end,
        function() send(4,"stop","inactive",5) end,
        function() send(8,"stop","inactive",5) end,
        function() send(6,"stop","inactive",30) end
        )    
    end
end

function send(turtleID,message,state, tries)
    for i = 1, tries do
		rednet.send(turtleID,message)
		local id, message = rednet.receive(1)
		if id == turtleID then
			isActive(id,state)
			return
		end
	end
end

function isActive(id, message)
    if id == 3 then
        if message == "active" then
            turtles(0, "Attacker", colors.lime)
        elseif message == "inactive" then
            turtles(0, "Attacker", colors.red) 
        end
    end

    if id == 6 then
        if message == "active" then
            turtles(1, "Sorter", colors.lime)
        elseif message == "inactive" then
            turtles(1, "Sorter", colors.red)
        end
    end

    if id == 4 then
        if message == "active" then
            turtles(2, "Dropper", colors.lime)
        elseif message == "inactive" then
            turtles(2, "Dropper", colors.red)
        end
    end

    if id == 8 then
        if message == "active" then
            turtles(3, "Flusher", colors.lime)
        elseif message == "inactive" then
            turtles(3, "Flusher", colors.red)
        end
    end
end
    
function turtles(y,name,color)
    monitor.setCursorPos(11,1+y)
    monitor.write(name)
    drawPixel(11,1+y,color)
    speaker.playSound("entity.parrot.eat")    
end

function drawPixel(x,y,color)
    local oldTerm = term.current()
    term.redirect(monitor)
    paintutils.drawPixel(x-1, y, color)
    term.redirect(oldTerm)
    monitor.setBackgroundColor(colors.black)
end

monitor.clear()
monitor.setTextScale(1)
monitor.setBackgroundColor(colors.black)
drawButtons(colors.lightGray, colors.red)
turtles(0,"Attacker",colors.red)
turtles(1,"Sorter",colors.red)
turtles(2,"Dropper",colors.red)
turtles(3,"Flusher",colors.red)
peripheral.find("modem", rednet.open)

repeat
    event, p1, x, y = os.pullEvent()
    if event == "monitor_touch" then
        mouseWidth = x
        mouseHeight = y
        checkClickPosition()
    end 
until event == "char" and p1 == ("x")
        
