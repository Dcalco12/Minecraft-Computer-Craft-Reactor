local t = {}

local function getCurrentPower(message)
    currentPower = tonumber(message)
end

local function getMaxPower(message)
    maxPower = tonumber(message)
end

local function getPercentPower(message)
    percentPower = tonumber(message)
end

local function getReactorActive(message)
    if message == "true" then reactorActive = true
    else reactorActive = false
    end
end

local function getCurrentFuel(message)
    currentFuel = tonumber(message)
end

local function getRfPerTick(message)
    rfPerTick = tonumber(message)
end

local function getPercentWaste(message)
    percentWaste = tonumber(message)
end

t.getCurrentPower = getCurrentPower
t.getMaxPower = getMaxPower
t.getPercentPower = getPercentPower
t.getReactorActive = getReactorActive
t.getCurrentFuel = getCurrentFuel
t.rfPerTick = getRfPerTick
t.getPercentWaste = getPercentWaste

return t
