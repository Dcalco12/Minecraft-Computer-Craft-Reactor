-- startup specific logic here
rednet.open("top")
shell.execute("bg")
local shellMainIndex = multishell.getCurrent()
local spacerString = "=========================================================="
local image = paintutils.parseImage([[
          e  e

         e    e
          eeee
]])
multishell.setTitle(shellMainIndex, "Reactor Controller")
term.clear()
multishell.setFocus(shellMainIndex+1)
term.setCursorPos(1, 1)
term.write(spacerString)
term.setCursorPos(1, 4)
term.write("Reactor Controller is active!")
term.setCursorPos(1, 7)
paintutils.drawImage(image, term.getCursorPos())
term.setCursorPos(1, 11)
term.setBackgroundColor(32768)
term.write(spacerString)
multishell.setFocus(shellMainIndex+1)

-- actual script start here

local monitor = peripheral.find("monitor")
local reactor = peripheral.wrap("back")

local power = 0
local fuel = 0
local currentPower = 0 -- protocol 1
local maxPower = 0 -- protocol 2
local percentPower = 0 -- protocol 3
local reactorActive = false -- protocol 4
local currentFuel = 0 -- protocol 5
local percentWaste = 0 -- protocol 6
local rfPerTick = 0 -- protocol 7

function checkPower()
    fuel = reactor.getFuelStats()
    power = reactor.getEnergyStats()
    reactorActive = reactor.getActive()
    currentPower = power["energyStored"]
    maxPower = power["energyCapacity"]
    rfPerTick = power["energyProducedLastTick"]
    currentFuel = fuel["fuelAmount"]

    if power["energyStored"] ~= nil
    then 
        if power["energyCapacity"] ~= nil
        then percentPower = power["energyStored"] / power["energyCapacity"] * 100
        end
    end
    
    if fuel["wasteAmount"] ~= nil
    then
        if fuel["fuelCapacity"] ~= nil
        then percentWaste = fuel["wasteAmount"] / fuel["fuelCapacity"] * 100
        end 
    end
end

function powerControl()
    if currentPower == nil
    then reactor.setActive(false)
    end
    
    if maxPower == nil
    then reactor.setActive(false)
    end

    if percentPower >= 80
    then reactor.setActive(false)
        
    elseif percentPower <= 30
    then reactor.setActive(true)  
    end
end

function sendData()
    rednet.broadcast(power["energyStored"], "1")
    rednet.broadcast(power["energyCapacity"], "2")
    rednet.broadcast(percentPower, "3")
    rednet.broadcast(tostring(reactorActive), "4")
    rednet.broadcast(fuel["fuelAmount"], "5")
    rednet.broadcast(power["energyProducedLastTick"], "6")
    rednet.broadcast(percentWaste, "7")
end

while true do
    checkPower()
    powerControl()
    sendData() -- computer ID 4
    sleep(1)
end