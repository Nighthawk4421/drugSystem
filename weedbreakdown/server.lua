local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    for i, d in pairs(Config.Weed) do --index the config.packageddrugs list and make them useable in the function below
        QBCore.Functions.CreateUseableItem(i, function(source, item) --returns the list or arry of the config.packageddrugs
            player = QBCore.Functions.GetPlayer(source)
            TriggerClientEvent('weedbreakdown:client:weedbreakdown', source, item, QBCore.Shared.Items[Config.Weed[item.name]])
        end)
    end
end)

RegisterNetEvent('weedbreakdown:server:weedbreakdown', function(fromdrug, todrug)
    player = QBCore.Functions.GetPlayer(source)
    player.Functions.RemoveItem(fromdrug.name, 1, nil)
    player.Functions.AddItem(todrug.name, 100, nil, {})
end)