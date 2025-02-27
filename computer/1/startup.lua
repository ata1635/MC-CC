local pressGoal = 10
local totalPresses = 0 
local circuitBreak = true
local timeA = os.time()
local timeB = os.time()
local moduloSwitch = 0

print()
print("----------")
print()

while true do
    local input = rs.getInput("right")    
    if input == true and circuitBreak == true then
        circuitBreak = false
        totalPresses = totalPresses + 1
        print("Pressed: " .. totalPresses)
        print("Modulo: " .. moduloSwitch)
        if moduloSwitch % 2 == 0 then
	           timeA = os.time()
	           print("timeA: " .. timeA)
            if timeA - timeB > 0.04 then
                print(timeA - timeB)
                print("SLOW")
                totalPresses = 0
            else
                print(timeA - timeB)
                print("ok")
            end
        end
        if moduloSwitch % 2 == 1 then
	           timeB = os.time()
            print("timeB: " .. timeB)
            if timeB - timeA > 0.04 then
                print(timeB - timeA)
                print("SLOW")
                totalPresses = 0
            else
                print(timeB - timeA)
                print("ok")
            end
        end
        print()
        print("----------")
        print()
    end
    if input == false and circuitBreak == false then
        circuitBreak = true
        moduloSwitch = moduloSwitch + 1
        if moduloSwitch == 999 then
            moduloSwitch = 0
        end
    end
    if input == true and totalPresses == pressGoal then
        rs.setOutput("front", true)
        totalPresses = 0
        sleep(0.1)
    else
        rs.setOutput("front", false)
        sleep(0.1)
    end
end
