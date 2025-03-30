local reactorHandler = require("reactor-handler")

local protocols = {
    ["reactor"] = {
        ["1"] = reactorHandler.getCurrentPower,
        ["2"] = reactorHandler.getMaxPower,
        ["3"] = reactorHandler.getPercentPower,
        ["4"] = reactorHandler.getReactorActive,
        ["5"] = reactorHandler.getCurrentFuel,
        ["6"] = reactorHandler.rfPerTick,
        ["7"] = reactorHandler.getPercentWaste
    }
}

return protocols
