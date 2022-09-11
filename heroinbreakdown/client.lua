local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('heroinbreakdown:client:heroinbreakdown', function(fromdrug, todrug)
    QBCore.Functions.Progressbar('Breaking down ' .. fromdrug.label .. ' to ' .. todrug.label, 'Breaking down ' .. fromdrug.label .. ' to ' .. todrug.label, 5000, false, false, false, 'amb@world_human_smoking@male@male_a@enter', nil, nil, function()
        TriggerServerEvent('heroinbreakdown:server:heroinbreakdown', fromdrug, todrug)
    end, nil)
end)

RegisterNetEvent('heroin:client:heroinharvest', function(harvestdrug)
    local playerPed = PlayerPedId()
    local hasItem = QBCore.Functions.HasItem('ammonia')
    local hasItem2 = QBCore.Functions.HasItem('sacid')
    local animDict = "anim@amb@business@meth@meth_monitoring_cooking@cooking@"
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Wait(10) end
    Wait(10)
    if hasItem and hasItem2 then
        TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_VEHICLE_MECHANIC", 0, false)
        TriggerServerEvent("heroinharvest:removeItem", 'ammonia', 1)
        TriggerServerEvent("heroinharvest:removeItem", 'sacid', 1)
        QBCore.Functions.Progressbar('You start to ', ' You are cooking heroin ', 7000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true
            }, {}, {}, {}, function()
                QBCore.Functions.Notify('you started the cooking process. Wait for it to finish %1', 'success', 2500)
                Wait(5000)
                QBCore.Functions.Notify('you started the cooking process. Wait for it to finish %10', 'success', 2500)
                Wait(5000)
                QBCore.Functions.Notify('you started the cooking process. Wait for it to finish %20', 'success', 2500)
                Wait(5000)
                QBCore.Functions.Notify('you started the cooking process. Wait for it to finish %30', 'success', 2500)
                Wait(5000)
                QBCore.Functions.Notify('you started the cooking process. Wait for it to finish %40', 'success', 2500)
                Wait(5000)
                QBCore.Functions.Notify('you started the cooking process. Wait for it to finish %50', 'success', 2500)
                Wait(5000)
                QBCore.Functions.Notify('you started the cooking process. Wait for it to finish %60', 'success', 2500)
                Wait(5000)
                QBCore.Functions.Notify('you started the cooking process. Wait for it to finish %70', 'success', 2500)
                Wait(5000)
                QBCore.Functions.Notify('you started the cooking process. Wait for it to finish %80', 'success', 2500)
                Wait(5000)
                QBCore.Functions.Notify('you started the cooking process. Wait for it to finish %90', 'success', 2500)
                Wait(5000)
                QBCore.Functions.Notify('you started the cooking process. Wait for it to finish %100', 'success', 2500)
                Wait(3000)
                TriggerServerEvent('heroin:server:heroinharvest')
                QBCore.Functions.Notify('You have cooked a brick of heroin! ', 'success', 5000)
            end)
        else
            QBCore.Functions.Notify('This requires ammonia and sodium benzoate', 'error', 5000)
        end
        ClearPedTasks(playerPed)
end)

exports['qb-target']:AddBoxZone("heroinharvesting", vector3(1391.85, 3605.98, 38.94), 10.45, 10.35, {
	name = "heroinharvesting",
	heading = 119.59,
	debugPoly = false,
	minZ = 1.77834,
	maxZ = 300.87834,
}, {
	options = {
		{
            type = "client",
            event = "heroin:client:heroinharvest",
			icon = "fas fa-sign-in-alt",
			label = "Cook Heroin",
            job = "unemployed",
		},
	},
	distance = 2.5
})