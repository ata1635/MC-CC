function drop()
    for i = 1,16 do
        turtle.select(i)
        turtle.dropDown()
    end    
end

while true do   
    for i = 1, 500 do
        turtle.attack()
    end
    drop()
end
