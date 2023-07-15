local Core = exports['cs_lib']:GetLib()
TacoTruckRob = {['lastHeist'] = 0}

Core.RegisterCallback('sin-Tacotrcukrob:server:checkTime', function(source, cb)
    local src = source
    local player = Core.GetId(src)
    
    if (os.time() - TacoTruckRob['lastHeist']) < Config['Rob']['Timenextrob'] and TacoTruckRob['lastHeist'] ~= 0 then
        local seconds = Config['Rob']['Timenextrob'] - (os.time() - TacoTruckRob['lastHeist'])
        Core.Notification(source, 'You have to wait ' .. ' ' .. math.floor(seconds / 60) .. ' ' .. 'minute')
        cb(false)
    else
        TacoTruckRob['lastHeist'] = os.time()
        cb(true)
    end
end)

RegisterServerEvent('sin-Tacotrcukrob:server:finish')
AddEventHandler('sin-Tacotrcukrob:server:finish', function(sellprice , item, itemamount)
    local src = source
    local player = Core.GetId(src)

    if player then
        Core.GiveItem(source, item, itemamount)
        Core.GiveMoney(source, 'cash', sellprice)    
    end
end)

RegisterNetEvent('sin-Tacotrcukrob:server:policeAlert')
AddEventHandler('sin-Tacotrcukrob:server:policeAlert', function(coords)
    local players = Core.GetPlayers()
    for i = 1, #players do
        local player = Core.GetId(players[i])
        if Core.GetJob(players[i]) == Config['Rob']['Policejobname'] then
            TriggerClientEvent('sin-Tacotrcukrob:client:policeAlert', players[i], coords)
        end
    end
end)