local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    for i, d in pairs(Config.Coke) do --index the config.packageddrugs list and make them useable in the function below
        QBCore.Functions.CreateUseableItem(i, function(source, item) --returns the list or arry of the config.packageddrugs
            player = QBCore.Functions.GetPlayer(source)
            TriggerClientEvent('cokebreakdown:client:cokebreakdown', source, item, QBCore.Shared.Items[Config.Coke[item.name]])
        end)
    end
end)

RegisterNetEvent('cokebreakdown:server:cokebreakdown', function(fromdrug, todrug)
    player = QBCore.Functions.GetPlayer(source)
    player.Functions.RemoveItem(fromdrug.name, 1, nil)
    player.Functions.AddItem(todrug.name, 112, nil, {})
end)