i = 1
j = 0
while turtle.getItemCount() == 0 do
    turtle.select(i)
    i = i + 1
    j = j + 1
    if turtle.getSelectedSlot() == 16 then
        i = 0
    end
    if j == 16 then
        print("no items")
        break
    end 
end
