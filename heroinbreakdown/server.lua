local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    for i, d in pairs(Config.Heroin) do --index the config.packageddrugs list and make them useable in the function below
        QBCore.Functions.CreateUseableItem(i, function(source, item) --returns the list or arry of the config.packageddrugs
            player = QBCore.Functions.GetPlayer(source)
            TriggerClientEvent('heroinbreakdown:client:heroinbreakdown', source, item, QBCore.Shared.Items[Config.Heroin[item.name]])
        end)
    end
end)

RegisterNetEvent('heroinbreakdown:server:heroinbreakdown', function(fromdrug, todrug)
    player = QBCore.Functions.GetPlayer(source)
    player.Functions.RemoveItem(fromdrug.name, 1, nil)
    player.Functions.AddItem(todrug.name, 100, nil, {})
end)

RegisterNetEvent('heroin:server:heroinharvest', function(harvestdrug)
    player = QBCore.Functions.GetPlayer(source)
    player.Functions.AddItem('heroinbrick', 1, nil, {})
end)

RegisterServerEvent("heroinharvest:removeItem")
AddEventHandler("heroinharvest:removeItem", function(itemname, count)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    xPlayer.Functions.RemoveItem(itemname, count)
end)