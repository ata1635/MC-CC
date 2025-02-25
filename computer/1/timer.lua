local lastPressedTime = nil

function timer(x)
    local timer_id = os.startTimer(x)
    local event, id
    repeat 
        event, id = os.pullEvent("timer")
    until id == timer_id
    print("Timer with ID " .. id .. " was fired")
end

for i = 1,5 do
    local a = os.time()
    timer(2)
    local b = os.time()
    print(b-a)
    if b - a > 0.04 then
        print("SLOW")
    end
end
