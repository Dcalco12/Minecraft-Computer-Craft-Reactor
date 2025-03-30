local t = {}

local function printPower()
    monitor.setBackgroundColor(32768)
    monitor.setTextColor(1)
    monitor.setTextScale(1)

    if reactorActive == true
    then
    monitor.setCursorPos(1, 1)
    monitor.clearLine()
    monitor.write("Reactor: On")
    end

    if reactorActive == false
    then
    monitor.setCursorPos(1, 1)
    monitor.clearLine()
    monitor.write("Reactor: Off")
    end

    if reactorActive == nil
    then
    monitor.setCursorPos(1, 1)
    monitor.clearLine()
    monitor.write("Reactor: Off")
    end

    monitor.setCursorPos(1, 3)
    monitor.write("Power:")

    monitor.setCursorPos(1, 4)
    monitor.clearLine()

    if currentPower ~= nil
    then
        if maxPower ~= nil
        then monitor.write(string.format("%d",currentPower) .. "/" .. maxPower)
        end
    end

    if currentPower == nill 
    then if maxPower ~= nill
        then monitor.write("nil" .. "/" .. maxPower)
        end
    end
    
    if maxPower == nil
    then if currentPower ~= nil
        then monitor.write(currentPower .. "/" .. "nil")
        end
    end

    if currentPower == nil
    then
        if maxPower == nil
        then monitor.write("nil" .. "/" .. "nil")
        end
    end
     

    monitor.setCursorPos(1, 6)
    monitor.write("Battery Percent:")

    monitor.setCursorPos(1, 7)
    monitor.clearLine()

    if percentPower ~= nil
    then monitor.write(string.format("%.2f", percentPower) .. "%")
    end

    if percentPower == nil
    then monitor.write("nil")
    end

    monitor.setCursorPos(1, 9)
    monitor.write("RF Per Tick:")

    monitor.setCursorPos(1, 10)
    monitor.clearLine()

    if rfPerTick == nil
    then monitor.write("nil")
    end

    if rfPerTick ~= nil
    then monitor.write(string.format("%.2f", rfPerTick))
    end
    
    monitor.setCursorPos(1, 12)
    monitor.write("Waste Percent:")

    monitor.setCursorPos(1, 13)
    monitor.clearLine()

    if percentWaste == nil
    then monitor.write("nil")
    end

    if percentWaste ~= nil
    then monitor.write(string.format("%.2f", percentWaste) .. "%")
    end
    
    if currentFuel == 0
    then
        monitor.setCursorPos(1, 14)
        monitor.setCursorBlink(true)
        monitor.setTextColor(16384)
        monitor.write("OUT OF FUEL!")
    else
        monitor.setCursorPos(1, 14)
        monitor.clearLine()

        if monitor.getCursorBlink()
        then monitor.setCursorBlink(false)
        end
    end
end

t.printPower = printPower
return t
