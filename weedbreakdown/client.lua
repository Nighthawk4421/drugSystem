local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('weedbreakdown:client:weedbreakdown', function(fromdrug, todrug)
    QBCore.Functions.Progressbar('Breaking down ' .. fromdrug.label .. ' to ' .. todrug.label, 'Breaking down ' .. fromdrug.label .. ' to ' .. todrug.label, 5000, false, false, false, 'amb@world_human_smoking@male@male_a@enter', nil, nil, function()
        TriggerServerEvent('weedbreakdown:server:weedbreakdown', fromdrug, todrug)
    end, nil)
end)