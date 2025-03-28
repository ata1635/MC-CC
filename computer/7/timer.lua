local timer = true
local startTime = nil
local monitor = peripheral.find("monitor")

function truncate(num, decimals)
    local power = 10 ^ decimals
    return math.floor(num * power) / power
end

print("Waiting for first Redstone signal...")

while timer do
    -- Detect first redstone signal
    if rs.getInput("right") and startTime == nil then
        print("1st Input Received")
        startTime = os.clock()  -- More precise than os.time()
        
        -- Wait for the signal to turn off before detecting the second one
        while rs.getInput("right") do
            sleep(0)  -- Yield execution to avoid freezing the system
        end
    end

    -- Detect second redstone signal
    if startTime and rs.getInput("left") then
        local elapsedTime = os.clock() - startTime
        print("Time: " .. elapsedTime .. "s")
        local speed = 21.875/elapsedTime
        print("Speed: " .. truncate(speed, 3) .. "m/s")
        monitor.clear()
        monitor.setCursorPos(1,1)
        monitor.setTextScale(0.5)
        monitor.write(truncate(speed,3) .. "m/s")

        -- Reset for next measurement
        startTime = nil
        print("Timer Reset. Waiting for new first signal...")
        
        -- Wait for the signal to turn off again before next measurement
        while rs.getInput("left") do
            sleep(0)
        end
    end
    
    sleep(0)  -- Prevent excessive CPU usage
end
