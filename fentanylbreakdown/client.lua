local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('fentanylbreakdown:client:fentanylbreakdown', function(fromdrug, todrug)
    QBCore.Functions.Progressbar('Breaking down ' .. fromdrug.label .. ' to ' .. todrug.label, 'Breaking down ' .. fromdrug.label .. ' to ' .. todrug.label, 5000, false, false, false, nil, nil, nil, function()
        TriggerServerEvent('fentanylbreakdown:server:fentanylbreakdown', fromdrug, todrug)
    end, nil)
end)


RegisterNetEvent('fentanyl:client:fentanylharvest', function(harvestdrug)
    local playerPed = PlayerPedId()
    local hasItem = QBCore.Functions.HasItem('ammonia')
    local hasItem2 = QBCore.Functions.HasItem('sacid')
    local animDict = "anim@amb@business@meth@meth_monitoring_cooking@cooking@"
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Wait(10) end
    Wait(10)
    if hasItem and hasItem2 then
        TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_ATM", 0, false)
        TriggerServerEvent("fentanylharvest:removeItem", 'ammonia', 1)
        TriggerServerEvent("fentanylharvest:removeItem", 'sacid', 1)
        QBCore.Functions.Progressbar('You start to ', ' You are cooking fentanyl ', 7000, false, true, {
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
                TriggerServerEvent('fentanyl:server:fentanylharvest')
                QBCore.Functions.Notify('You have cooked a brick of fentanyl ', 'success', 5000)
            end)
        else
            QBCore.Functions.Notify('You dont have the right ingredients', 'error', 5000)
        end
        ClearPedTasks(playerPed)
end)

exports['qb-target']:AddBoxZone("Fentanylharvesting", vector3(2196.05, 5595.29, 53.78), 10.45, 10.35, {
	name = "Fentanylharvesting",
	heading = 246.1,
	debugPoly = false,
	minZ = 1.77834,
	maxZ = 300.87834,
}, {
	options = {
		{
            type = "client",
            event = "fentanyl:client:fentanylharvest",
			icon = "fas fa-sign-in-alt",
			label = "Harvest Fentanyl",
		},
	},
	distance = 2.5
})