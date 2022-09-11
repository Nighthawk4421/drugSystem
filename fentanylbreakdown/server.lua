local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    for i, d in pairs(Config.Fentanyl) do --index the config.packageddrugs list and make them useable in the function below
        QBCore.Functions.CreateUseableItem(i, function(source, item) --returns the list or arry of the config.packageddrugs
            player = QBCore.Functions.GetPlayer(source)
            TriggerClientEvent('fentanylbreakdown:client:fentanylbreakdown', source, item, QBCore.Shared.Items[Config.Fentanyl[item.name]])
        end)
    end
end)

RegisterNetEvent('fentanylbreakdown:server:fentanylbreakdown', function(fromdrug, todrug)
    player = QBCore.Functions.GetPlayer(source)
    player.Functions.RemoveItem(fromdrug.name, 1, nil)
    player.Functions.AddItem(todrug.name, 100, nil, {})
end)

RegisterNetEvent('fentanyl:server:fentanylharvest', function(harvestdrug)
    player = QBCore.Functions.GetPlayer(source)
    player.Functions.AddItem('fentanylbrick', 1, nil, {})
end)

RegisterServerEvent("fentanylharvest:removeItem")
AddEventHandler("fentanylharvest:removeItem", function(itemname, count)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    xPlayer.Functions.RemoveItem(itemname, count)
end)