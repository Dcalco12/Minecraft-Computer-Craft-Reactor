local t = {}

local function printPower()
    monitor.setBackgroundColor(32768)
    monitor.setTextColor(1)
    monitor.setTextScale(1)

    if reactorActive
    then
    monitor.setCursorPos(1, 1)
    monitor.clearLine()
    monitor.write("Reactor: On")

    else
    monitor.setCursorPos(1, 1)
    monitor.clearLine()
    monitor.write("Reactor: Off")
    end

    monitor.setCursorPos(1, 3)
    monitor.write("Power:")

    monitor.setCursorPos(1, 4)
    monitor.clearLine()
    monitor.write(string.format("%d",currentPower) .. "/" .. maxPower)

    monitor.setCursorPos(1, 6)
    monitor.write("Battery Percent:")

    monitor.setCursorPos(1, 7)
    monitor.clearLine()
    monitor.write(string.format("%.2f", percentPower) .. "%")

    monitor.setCursorPos(1, 9)
    monitor.write("RF Per Tick:")

    monitor.setCursorPos(1, 10)
    monitor.clearLine()
    monitor.write(string.format("%.2f", rfPerTick))
    
    monitor.setCursorPos(1, 12)
    monitor.write("Waste Percent:")

    monitor.setCursorPos(1, 13)
    monitor.clearLine()
    monitor.write(string.format("%.2f", percentWaste) .. "%")
    
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
        then monitor.setCursorBlink(false) end
    end

end

t.printPower = printPower
return t
