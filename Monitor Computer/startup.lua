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
multishell.setTitle(shellMainIndex, "Reactor Listener")
term.clear()
multishell.setFocus(shellMainIndex+1)
term.setCursorPos(1, 1)
term.write(spacerString)
term.setCursorPos(1, 4)
term.write("Reactor Listener is active!")
term.setCursorPos(1, 7)
paintutils.drawImage(image, term.getCursorPos())
term.setCursorPos(1, 11)
term.setBackgroundColor(32768)
term.write(spacerString)


-- script logic starts here

currentPower = 0
maxPower = 0
percentPower = 0
reactorActive = false
currentFuel = 0
rfPerTick = 0
percentWaste = 0

monitor = peripheral.find("monitor")
monitor.clear()

local printing = require("printing")
local protocols = require("protocols")


function rednetListener()
    local event, sender, message, protocol = os.pullEvent("rednet_message")
    if protocol ~= nil 
    then

        if sender == 1 and protocols["reactor"][protocol] ~= nil
        then protocols["reactor"][protocol](message)
        else
            local currentIndex = multishell.getCurrent()
            multishell.setFocus(shellMainIndex)
            
            -- extra verbose logging for unexpected protocols
            term.write("Unexpected message from: " .. sender)
            term.write("Protocol: " .. protocol)
            term.write("")
            term.write("Message: " .. message)
            
            multishell.setFocus(currentIndex)
        end
    
    else
        -- simple logging for no protocol messages
      local currentIndex = multishell.getCurrent()
      multishell.setFocus(shellMainIndex)
      
      term.write("Received unexpected message from " .. sender .. " with message " .. tostring(message))
      
      multishell.setFocus(currentIndex)
    end
end

while true do
    rednetListener()
    printing.printPower()
end
